package com.base.test.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Bill")
public class Bill {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public long id;
	
	private String tableNumber;
	private double amount;
	private double taxAmount;
	private double totalAmount;
	private String paymentMode;
	private String cardNumber;
	
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
}
