package com.base.test.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.BillDao;
import com.base.test.DAO.DaoInterface;
import com.base.test.DAO.TaxDetailDAO;
import com.base.test.model.Bill;
import com.base.test.model.TaxDetail;

@Service("billService")
public class BillService extends AbstractService<Bill> {

	public static final String ITEM_TYPE_BAR = "BAR";

	public static final String ITEM_TYPE_FOOD = "FOOD";

	@Autowired
	private BillDao billDAO;

	@Autowired
	private TaxDetailDAO taxDetailDAO;

	@Override
	public DaoInterface<Bill> getEntityDAO() {
		return billDAO;
	}

	public Bill getByTableNumber(String tableNumber) {
		return billDAO.getByTableNumber(tableNumber);
	}

	public List<Bill> getActiveBills() {
		return billDAO.getActiveBills();
	}

	public void create(Bill bill) {
		bill = calculateTax(bill);
		super.create(bill);
	}

	public Bill update(Long id, Bill bill) {
		bill = bill.getIsActive() == false ? bill : calculateTax(bill);
		super.update(id, bill);
		return findByID(id);
	}

	private Bill calculateTax(Bill bill) {
		double amount = 0;
		double serviceChargePercent = 0;
		double serviceTaxPercent = 0;
		double vatPercent = 0;
		double serviceChargeAmount = 0;
		double serviceTaxAmount = 0;
		double vatAmount = 0;
		double totalAmount = 0;

		double amountFood = bill.getOrders().stream().filter(b -> b.getType().equals(ITEM_TYPE_FOOD))
				.mapToDouble(b -> b.getCost()).sum();
		double amountBar = bill.getOrders().stream().filter(b -> b.getType().equals(ITEM_TYPE_BAR))
				.mapToDouble(b -> b.getCost()).sum();
		amount = amountBar + amountFood;
		bill.setAmount(amount);

		List<TaxDetail> taxList = taxDetailDAO.getTaxList(ITEM_TYPE_FOOD);
		for (TaxDetail list : taxList) {
			if (list.getTaxType().equalsIgnoreCase("VAT"))
				vatPercent = list.getTaxValue();
			if (list.getTaxType().equalsIgnoreCase("SERVICE CHARGE"))
				serviceChargePercent = list.getTaxValue();
			if (list.getTaxType().equalsIgnoreCase("SERVICE TAX"))
				serviceTaxPercent = list.getTaxValue();
		}
		double serviceChargeFood = amountFood * (serviceChargePercent / 100);
		serviceTaxAmount += (amountFood + serviceChargeFood) * (serviceTaxPercent / 100);
		vatAmount += (amountFood + serviceChargeFood) * (vatPercent / 100);
		serviceChargeAmount += serviceChargeFood;

		taxList = taxDetailDAO.getTaxList(ITEM_TYPE_BAR);
		for (TaxDetail list : taxList) {
			if (list.getTaxType().equalsIgnoreCase("VAT"))
				vatPercent = list.getTaxValue();
			if (list.getTaxType().equalsIgnoreCase("SERVICE CHARGE"))
				serviceChargePercent = list.getTaxValue();
			if (list.getTaxType().equalsIgnoreCase("SERVICE TAX"))
				serviceTaxPercent = list.getTaxValue();
		}
		double serviceChargeBar = amountBar * (serviceChargePercent / 100);
		serviceTaxAmount += (amountBar + serviceChargeBar) * (serviceTaxPercent / 100);
		vatAmount += (amountBar + serviceChargeBar) * (vatPercent / 100);
		serviceChargeAmount += serviceChargeBar;

		totalAmount += vatAmount + serviceTaxAmount + amount + serviceChargeAmount;

		bill.setTaxAmount(vatAmount + serviceTaxAmount);
		bill.setCharges(serviceChargeAmount);
		bill.setTotalAmount(totalAmount);

		return bill;
	}
}