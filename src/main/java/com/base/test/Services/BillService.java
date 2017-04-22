package com.base.test.Services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.BillDao;
import com.base.test.DAO.DaoInterface;
import com.base.test.DAO.TaxDetailDAO;
import com.base.test.enums.TransactionType;
import com.base.test.model.Bill;
import com.base.test.model.Cards;
import com.base.test.model.DailyTransaction;
import com.base.test.model.Orders;
import com.base.test.model.Payments;
import com.base.test.model.Tables;
import com.base.test.model.TaxDetail;

@Service("billService")
public class BillService extends AbstractService<Bill> {

	private static final String BAR_SERVICE_TAX = "BAR_SERVICE_TAX";

	private static final String BAR_SERVICE_CHARGE = "BAR_SERVICE_CHARGE";

	private static final String BAR_VAT = "BAR_VAT";

	private static final String FOOD_SERVICE_TAX = "FOOD_SERVICE_TAX";

	private static final String FOOD_SERVICE_CHARGE = "FOOD_SERVICE_CHARGE";

	private static final String FOOD_VAT = "FOOD_VAT";

	public static final String ITEM_TYPE_BAR = "BAR";

	public static final String ITEM_TYPE_FOOD = "FOOD";

	@Autowired
	private BillDao billDAO;

	@Autowired
	private TaxDetailDAO taxDetailDAO;

	@Autowired
	private ServiceInterface<Cards> cardService;

	@Autowired
	ServiceInterface<Tables> tablesService;

	@Autowired
	ServiceInterface<DailyTransaction> dailyTransactionService;

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

	@Override
	@Transactional
	public long create(Bill bill) {
		canCreate(bill);
		String chalanID = UUID.randomUUID().toString().replaceAll("-", "");
		bill.setModificationDate(new Date());
		for (Orders order : bill.getOrders()) {
			if (order.getType().equals(ITEM_TYPE_FOOD))
				order.setOrderItemID("F-" + order.getOrderItemID());
			else if (order.getType().equals(ITEM_TYPE_BAR))
				order.setOrderItemID("B-" + order.getOrderItemID());
			order.setModificationDate(new Date());
			order.setBill(bill);
			order.setChalanID(chalanID);
		}
		bill = calculateTax(bill);
		bill.setBusinessDay(dailyTransactionService.getActiveEntity().get(0).getBusinessDay());
		super.create(bill);

		/**
		 * Activating Table.
		 */
		Tables table = tablesService.getByTableNumber(bill.getTableNumber());
		table.setIsActive(true);
		tablesService.update(table.getId(), table);

		printOrderTicket(bill, chalanID);

		return bill.getId();
	}

	private void printOrderTicket(Bill bill, String chalanID) {
		/*
		 * iterate on orders and generate KOT/Bill for all orders with given
		 * chalanID.
		 */
		for (Orders order : bill.getOrders()) {
			if (order.getChalanID().equals(chalanID)) {
				// add to print string.
			}
		}
	}

	@Override
	@Transactional
	public Bill update(Long id, Bill bill) {
		String chalanID = UUID.randomUUID().toString().replaceAll("-", "");
		Bill bill_old = findByID(bill.getId());
		bill_old.setModificationDate(new Date());
		bill_old.setIsActive(bill.getIsActive());
		bill_old.setWaiterID(bill.getWaiterID());
		bill_old.setDiscount(bill.getDiscount());

		if (bill.getIsActive() == true) {
			for (Orders order : bill.getOrders()) {
				if (order.getId()==0) {
					if (order.getType().equals(ITEM_TYPE_FOOD))
						order.setOrderItemID("F-" + order.getOrderItemID());
					else if (order.getType().equals(ITEM_TYPE_BAR))
						order.setOrderItemID("B-" + order.getOrderItemID());
					order.setModificationDate(new Date());
					order.setBill(bill_old);
					order.setChalanID(chalanID);
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
			if(bill_old != null)
				payemnt.setBill(bill_old);
			if (payemnt.getCardNumber() != null) {
				payemnt.setCardNumber(payemnt.getCardNumber().substring(14, 19));
				/**
				 * updating card balance.
				 */
				Cards card = cardService.getByName(payemnt.getCardNumber());
				Double bal_old = card.getBalance();
				card.setBalance(card.getBalance() - payemnt.getCost());
				cardService.update(card.getId(), card);
				/**
				 * Add to history.
				 */
				long cardHistoryID = cardService.addToCardHistory(card, card.getBalance() - bal_old, card.getBalance(),
						TransactionType.DEBIT);
				payemnt.setTransactionID(cardHistoryID);
			}
		}
		
		calculateTax(bill_old);
		lazyLoadToEgar(bill_old);
		super.update(id, bill_old);

		/**
		 * Deactivating table.
		 */
		if (bill.getIsActive() == false) {
			Tables table = tablesService.getByTableNumber(bill.getTableNumber());
			table.setIsActive(false);
			tablesService.update(table.getId(), table);
		}

		printOrderTicket(bill_old, chalanID);

		return bill_old;
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

		/**
		 * reducing amount with discount for tax and total amount calculations.
		 */
		double discount = bill.getDiscount();
		amountFood = amountFood - amountFood * (discount / 100);
		amountBar = amountBar - amountBar * (discount / 100);

		/**
		 * Calculate tax for FOOD.
		 */
		Map<String, TaxDetail> taxList = taxDetailDAO.getTaxList();
		vatPercent = taxList.get(FOOD_VAT).getTaxValue();
		serviceChargePercent = taxList.get(FOOD_SERVICE_CHARGE).getTaxValue();
		serviceTaxPercent = taxList.get(FOOD_SERVICE_TAX).getTaxValue();

		double serviceChargeFood = amountFood * (serviceChargePercent / 100);
		serviceTaxAmount += (amountFood + serviceChargeFood) * (serviceTaxPercent / 100);
		vatAmount += (amountFood + serviceChargeFood) * (vatPercent / 100);
		serviceChargeAmount += serviceChargeFood;

		/**
		 * Calculate tax for BAR.
		 */
		vatPercent = taxList.get(BAR_VAT).getTaxValue();
		serviceChargePercent = taxList.get(BAR_SERVICE_CHARGE).getTaxValue();
		serviceTaxPercent = taxList.get(BAR_SERVICE_TAX).getTaxValue();

		double serviceChargeBar = amountBar * (serviceChargePercent / 100);
		serviceTaxAmount += (amountBar + serviceChargeBar) * (serviceTaxPercent / 100);
		vatAmount += (amountBar + serviceChargeBar) * (vatPercent / 100);
		serviceChargeAmount += serviceChargeBar;

		totalAmount += vatAmount + serviceTaxAmount + amountFood + amountBar + serviceChargeAmount;

		bill.setTaxAmount(vatAmount + serviceTaxAmount);
		bill.setCharges(serviceChargeAmount);
		bill.setTotalAmount(totalAmount);

		return bill;
	}

	private void canCreate(Bill bill) {
		if (dailyTransactionService.getActiveEntity().isEmpty()) {
			throw new RuntimeException("First Start New Day.....");
		}
	}
}