package com.base.test.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "DailyTransaction")
public class DailyTransaction {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	private Date startTime;
	private Date endTime;
	private double totalSale;
	private double barSale;
	private double foodSale;
	private double totalTax;
	private double barTax;
	private double foodTax;
	private double cashPayment;
	private double cardPayment;
	private double yoyocardPayment;
	private int active;
	private String label;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public double getTotalSale() {
		return totalSale;
	}
	public void setTotalSale(double totalSale) {
		this.totalSale = totalSale;
	}
	public double getBarSale() {
		return barSale;
	}
	public void setBarSale(double barSale) {
		this.barSale = barSale;
	}
	public double getFoodSale() {
		return foodSale;
	}
	public void setFoodSale(double foodSale) {
		this.foodSale = foodSale;
	}
	public double getTotalTax() {
		return totalTax;
	}
	public void setTotalTax(double totalTax) {
		this.totalTax = totalTax;
	}
	public double getBarTax() {
		return barTax;
	}
	public void setBarTax(double barTax) {
		this.barTax = barTax;
	}
	public double getFoodTax() {
		return foodTax;
	}
	public void setFoodTax(double foodTax) {
		this.foodTax = foodTax;
	}
	public double getCashPayment() {
		return cashPayment;
	}
	public void setCashPayment(double cashPayment) {
		this.cashPayment = cashPayment;
	}
	public double getCardPayment() {
		return cardPayment;
	}
	public void setCardPayment(double cardPayment) {
		this.cardPayment = cardPayment;
	}
	public double getYoyocardPayment() {
		return yoyocardPayment;
	}
	public void setYoyocardPayment(double yoyocardPayment) {
		this.yoyocardPayment = yoyocardPayment;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
}
