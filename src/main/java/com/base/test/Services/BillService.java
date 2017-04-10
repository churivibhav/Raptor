package com.base.test.Services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.BillDao;
import com.base.test.DAO.DaoInterface;
import com.base.test.DAO.TaxDetailDAO;
import com.base.test.model.Bill;
import com.base.test.model.Cards;
import com.base.test.model.Orders;
import com.base.test.model.Payments;
import com.base.test.model.TaxDetail;

@Service("billService")
public class BillService extends AbstractService<Bill> {

	public static final String ITEM_TYPE_BAR = "BAR";

	public static final String ITEM_TYPE_FOOD = "FOOD";

	@Autowired
	private BillDao billDAO;

	@Autowired
	private TaxDetailDAO taxDetailDAO;
	
	@Autowired
	private ServiceInterface<Cards> cardService;

	@Override
	public DaoInterface<Bill> getEntityDAO() {
		return billDAO;
	}

	@Transactional
	public Bill getByTableNumber(String tableNumber) {
		Bill bill = billDAO.getByTableNumber(tableNumber);
		lazyLoadToEgar(bill);
		return bill;
	}

	@Transactional
	public List<Bill> getActiveEntity() {
		List<Bill> activeBills = billDAO.getActiveBills();
		for (Bill bill : activeBills) {
			lazyLoadToEgar(bill);
		}
		return activeBills;
	}

	public void create(Bill bill) {
		bill = calculateTax(bill);
		super.create(bill);
	}

	@Override
	@Transactional
	public Bill update(Long id, Bill bill) {
		Bill bill_old = findByID(bill.getId());
		bill_old.setModificationDate(new Date());
		bill_old.setIsActive(bill.getIsActive());
		bill_old.setWaiterID(bill.getWaiterID());

		if (bill.getIsActive() == true) {
			for (Orders order : bill.getOrders()) {
				if (!bill_old.getOrders().contains(order)) {
					order.setModificationDate(new Date());
					order.setBill(bill_old);
					bill_old.getOrders().add(order);
				}
			}
		}

		if (bill.getPayments() == null) {
			bill.setPayments(new ArrayList<>());
		}

		for (Payments payemnt : bill.getPayments()) {
			bill_old.getPayments().add(payemnt);
			payemnt.setModificationDate(new Date());
			payemnt.setBill(bill_old);
			if (payemnt.getCardNumber() != null) {
				payemnt.setCardNumber(payemnt.getCardNumber().substring(14, 19));
				Cards card = cardService.getByName(payemnt.getCardNumber());
				card.setBalance(card.getBalance() - payemnt.getCost());
				cardService.update(card.getId(), card);
			}
		}
		
		bill_old = bill_old.getIsActive() == false ? bill_old : calculateTax(bill_old);
		super.update(id, bill_old);
		return findByID(id);
	}

	private void lazyLoadToEgar(Bill bill) {
		bill.getOrders().size();
		bill.getPayments().size();
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