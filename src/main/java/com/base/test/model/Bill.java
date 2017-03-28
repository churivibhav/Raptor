package com.base.test.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "Bill")
public class Bill {
	@Id
	@Column(name = "billID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	private String tableNumber;
	private double amount;
	private double taxAmount;
	private double totalAmount;
	private String paymentMode;
	private String cardNumber;
	private int isActive;
	private long waiterID;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(insertable = false, updatable = false)
	private Date creationDate;

	@Temporal(TemporalType.TIMESTAMP)
	private Date modificationDate;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "bill", cascade = CascadeType.ALL)
	private Set<Orders> orders;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTableNumber() {
		return tableNumber;
	}

	public void setTableNumber(String tableNumber) {
		this.tableNumber = tableNumber;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public double getTaxAmount() {
		return taxAmount;
	}

	public void setTaxAmount(double taxAmount) {
		this.taxAmount = taxAmount;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	@Override
	public String toString() {
		return "Bill [id=" + id + ", tableNumber=" + tableNumber + ", amount=" + amount + ", taxAmount=" + taxAmount
				+ ", totalAmount=" + totalAmount + ", paymentMode=" + paymentMode + ", cardNumber=" + cardNumber + "]";
	}

	public Set<Orders> getOrders() {
		return orders;
	}

	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}

	public void addOrder(Orders order) {
		this.orders.add(order);
	}

	public boolean getIsActive() {
		return (isActive == 1) ? true : false;
	}

	public void setIsActive(boolean isActive) {
		this.isActive = (isActive == true) ? 1 : 0;
	}

	public long getWaiterID() {
		return waiterID;
	}

	public void setWaiterID(long waiterID) {
		this.waiterID = waiterID;
	}

	public Date getModificationDate() {
		return modificationDate;
	}

	public void setModificationDate(Date modificationDate) {
		this.modificationDate = modificationDate;
	}
}
