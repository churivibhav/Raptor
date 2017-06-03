package com.base.test.Services;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import com.base.test.model.Menu;
import com.base.test.model.Orders;
import com.base.test.model.Payments;
import com.base.test.model.Tables;
import com.base.test.model.TaxDetail;

@Service("billService")
public class BillService extends AbstractService<Bill> {

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

	@Autowired
	ServiceInterface<Menu> menuService;

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
		String chalanID = Integer.toString(dailyTransactionService.getActiveEntity().get(0).getSequence() + 1);
		dailyTransactionService.getActiveEntity().get(0).setSequence(Integer.parseInt(chalanID));
		bill.setModificationDate(new Date());
		for (Orders order : bill.getOrders()) {
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
		PrintWriter writer;
		try {
			writer = new PrintWriter("/home/print.txt", "UTF-8");
			StringBuilder sb = new StringBuilder();
			sb.append("Chalan ID " + chalanID + "\n\n");
			for (Orders order : bill.getOrders()) {
				if (order.getChalanID().equals(chalanID)) {
					sb.append(
							menuService.findByID(order.getOrderItemID()).getName() + " " + order.getQuantity() + "\n");
				}
			}
			writer.println(sb.toString());
			writer.close();
		} catch (FileNotFoundException | UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}

	}

	@Override
	@Transactional
	public Bill update(Long id, Bill bill) {
		String chalanID = Integer.toString(dailyTransactionService.getActiveEntity().get(0).getSequence() + 1);
		dailyTransactionService.getActiveEntity().get(0).setSequence(Integer.parseInt(chalanID));
		Bill bill_old = findByID(bill.getId());
		bill_old.setModificationDate(new Date());
		bill_old.setStatus(bill.getStatus());
		bill_old.setWaiterID(bill.getWaiterID());
		bill_old.setDiscount(bill.getDiscount());

		if (bill.getIsActive() == true) {
			for (Orders order : bill.getOrders()) {
				if (order.getId() == 0) {
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
			if (bill_old != null)
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
						TransactionType.DEBIT, bill_old.getUserID());
				payemnt.setTransactionID(cardHistoryID);
			}
		}

		calculateTax(bill_old);
		applyDiscount(bill_old);
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
		for (Orders order : bill.getOrders()) {
			if (order.getId() == 0) {
				calculateTax(order);
			}
			bill.setAmount(bill.getAmount() + order.getCost());
			bill.setTotalAmount(bill.getTotalAmount() + order.getTotalAmount());
		}
		return bill;
	}

	public void calculateTax(Orders order) {

		TaxDetail taxDetail = taxDetailDAO.getTaxDetail(menuService.findByID(order.getOrderItemID()).getTaxType());

		double amount = menuService.findByID(order.getOrderItemID()).getCost() * order.getQuantity();
		double serviceCharge = amount * (taxDetail.getServiceCharge() / 100);
		double serviceTax = (amount + serviceCharge) * (taxDetail.getServiceTax() / 100);
		double vat = (amount + serviceCharge) * (taxDetail.getVAT() / 100);

		order.setServiceCharge(serviceCharge);
		order.setServiceTax(serviceTax);
		order.setVat(vat);
	}

	private void applyDiscount(Bill bill_old) {
		double discount = bill_old.getDiscount();
		double discountAmount = bill_old.getTotalAmount() * (discount / 100);
		double totalAmount = bill_old.getTotalAmount() - discountAmount;
		bill_old.setDiscountAmount(discountAmount);
		bill_old.setTotalAmount(totalAmount);

	}

	private void canCreate(Bill bill) {
		if (dailyTransactionService.getActiveEntity().isEmpty()) {
			throw new RuntimeException("First Start New Day.....");
		}
	}
}