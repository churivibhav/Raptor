package com.base.test.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.BillDao;
import com.base.test.DAO.DaoInterface;
import com.base.test.DAO.TaxDetailDAO;
import com.base.test.model.Bill;
import com.base.test.model.Orders;
import com.base.test.model.TaxDetail;

@Service("billService")
public class BillService extends AbstractService<Bill> {

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
	
	public List<Bill> getActiveBills(){
		return billDAO.getActiveBills();
	}
	
	public void create(Bill bill) {
		bill = calculateTax(bill);
		super.create(bill);
	}
	
	public Bill update(Long id, Bill bill){
		bill = calculateTax(bill);
		super.update(id, bill);
		return findByID(id);
	}
	
	private Bill calculateTax(Bill bill){
		double amount = 0;
		double serviceChargePercent = 0;
		double serviceTaxPercent = 0;
		double vatPercent = 0;
		double serviceChargeAmount = 0;
		double serviceTaxAmount = 0;
		double vatAmount = 0;
		double totalAmount = 0;
		
		
		/*double taxAmount = amount * (taxPercent / 100);
		bill.setTaxAmount(taxAmount);*/
		
		for(Orders order : bill.getOrders()){
			List<TaxDetail> taxList = taxDetailDAO.getTaxList(order.getType());
			for(TaxDetail list : taxList){
				if(list.getTaxType().equalsIgnoreCase("VAT"))
					vatPercent = list.getTaxValue();
				if(list.getTaxType().equalsIgnoreCase("SERVICE CHARGE"))
					serviceChargePercent = list.getTaxValue();
				if(list.getTaxType().equalsIgnoreCase("SERVICE TAX"))
					serviceTaxPercent = list.getTaxValue();
			}
			amount = bill.getAmount();
			serviceChargeAmount = amount * (serviceChargePercent / 100);
			amount = amount + serviceChargeAmount;
			serviceTaxAmount = amount * (serviceTaxPercent / 100);
			vatAmount = amount * (vatPercent / 100);
			
			totalAmount = vatAmount + serviceTaxAmount + amount;
		}
		bill.setTaxAmount(vatAmount + serviceTaxAmount);
		bill.setCharges(serviceChargeAmount);
		bill.setTotalAmount(Math.ceil(totalAmount));
		return bill;
	}
}