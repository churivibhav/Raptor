package com.base.test.model;

import java.util.Date;
import java.util.List;

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

import com.base.test.serializer.LocalDateSerializer;
import com.base.test.serializer.WaiterNameSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Entity
@Table(name = "Bill")
public class Bill {
	@Id
	@Column(name = "billID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	private String tableNumber;
	private double amount;
	private int discount;
	private double charges;
	private double taxAmount;
	private double totalAmount;
	private int isActive;
	private long userID;

	@JsonSerialize(using = WaiterNameSerializer.class)
	private long waiterID;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(insertable = false, updatable = false)
	@JsonSerialize(using = LocalDateSerializer.class)
	private Date creationDate;

	@Temporal(TemporalType.TIMESTAMP)
	@JsonSerialize(using = LocalDateSerializer.class)
	private Date modificationDate;

	@Temporal(TemporalType.TIMESTAMP)
	@JsonSerialize(using = LocalDateSerializer.class)
	private Date businessDay;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "bill", cascade = CascadeType.ALL)
	private List<Orders> orders;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "bill", cascade = CascadeType.ALL)
	private List<Payments> payments;

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

	public List<Orders> getOrders() {
		return orders;
	}

	public void setOrders(List<Orders> orders) {
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

	public List<Payments> getPayments() {
		return payments;
	}

	public void setPayments(List<Payments> payments) {
		this.payments = payments;
	}

	public double getCharges() {
		return charges;
	}

	public void setCharges(double charges) {
		this.charges = charges;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public long getUserID() {
		return userID;
	}

	public void setUserID(long userID) {
		this.userID = userID;
	}

	public Date getBusinessDay() {
		return businessDay;
	}

	public void setBusinessDay(Date businessDay) {
		this.businessDay = businessDay;
	}

	@Override
	public String toString() {
		return "Bill [id=" + id + ", tableNumber=" + tableNumber + ", amount=" + amount + ", taxAmount=" + taxAmount
				+ ", totalAmount=" + totalAmount + ", isActive=" + isActive + ", waiterID=" + waiterID + ", charges="
				+ charges + ", creationDate=" + creationDate + ", modificationDate=" + modificationDate + "]";
	}

}
