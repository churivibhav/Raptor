package com.base.test.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.base.test.serializer.LocalDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Entity
@Table(name = "DailyTransaction")
public class DailyTransaction {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(insertable = false, updatable = false)
	@JsonSerialize(using = LocalDateSerializer.class)
	private Date startTime;

	@Temporal(TemporalType.TIMESTAMP)
	@JsonSerialize(using = LocalDateSerializer.class)
	private Date endTime;

	@Temporal(TemporalType.TIMESTAMP)
	@JsonSerialize(using = LocalDateSerializer.class)
	private Date businessDay;

	private double totalSale;
	private double barSale;
	private double foodSale;
	private double totalTax;
	private double barTax;
	private double foodTax;
	private double cashPayment;
	private double cardPayment;
	private double yoyocardPayment;
	private int isActive;

	private byte[] reportFile;

	/**
	 * @return the reportFile
	 */
	public byte[] getReportFile() {
		return reportFile;
	}

	/**
	 * @param reportFile
	 *            the reportFile to set
	 */
	public void setReportFile(byte[] reportFile) {
		this.reportFile = reportFile;
	}

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return the startTime
	 */
	public Date getStartTime() {
		return startTime;
	}

	/**
	 * @param startTime
	 *            the startTime to set
	 */
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	/**
	 * @return the endTime
	 */
	public Date getEndTime() {
		return endTime;
	}

	/**
	 * @param endTime
	 *            the endTime to set
	 */
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	/**
	 * @return the businessDay
	 */
	public Date getBusinessDay() {
		return businessDay;
	}

	/**
	 * @param businessDay
	 *            the businessDay to set
	 */
	public void setBusinessDay(Date businessDay) {
		this.businessDay = businessDay;
	}

	/**
	 * @return the totalSale
	 */
	public double getTotalSale() {
		return totalSale;
	}

	/**
	 * @param totalSale
	 *            the totalSale to set
	 */
	public void setTotalSale(double totalSale) {
		this.totalSale = totalSale;
	}

	/**
	 * @return the barSale
	 */
	public double getBarSale() {
		return barSale;
	}

	/**
	 * @param barSale
	 *            the barSale to set
	 */
	public void setBarSale(double barSale) {
		this.barSale = barSale;
	}

	/**
	 * @return the foodSale
	 */
	public double getFoodSale() {
		return foodSale;
	}

	/**
	 * @param foodSale
	 *            the foodSale to set
	 */
	public void setFoodSale(double foodSale) {
		this.foodSale = foodSale;
	}

	/**
	 * @return the totalTax
	 */
	public double getTotalTax() {
		return totalTax;
	}

	/**
	 * @param totalTax
	 *            the totalTax to set
	 */
	public void setTotalTax(double totalTax) {
		this.totalTax = totalTax;
	}

	/**
	 * @return the barTax
	 */
	public double getBarTax() {
		return barTax;
	}

	/**
	 * @param barTax
	 *            the barTax to set
	 */
	public void setBarTax(double barTax) {
		this.barTax = barTax;
	}

	/**
	 * @return the foodTax
	 */
	public double getFoodTax() {
		return foodTax;
	}

	/**
	 * @param foodTax
	 *            the foodTax to set
	 */
	public void setFoodTax(double foodTax) {
		this.foodTax = foodTax;
	}

	/**
	 * @return the cashPayment
	 */
	public double getCashPayment() {
		return cashPayment;
	}

	/**
	 * @param cashPayment
	 *            the cashPayment to set
	 */
	public void setCashPayment(double cashPayment) {
		this.cashPayment = cashPayment;
	}

	/**
	 * @return the cardPayment
	 */
	public double getCardPayment() {
		return cardPayment;
	}

	/**
	 * @param cardPayment
	 *            the cardPayment to set
	 */
	public void setCardPayment(double cardPayment) {
		this.cardPayment = cardPayment;
	}

	/**
	 * @return the yoyocardPayment
	 */
	public double getYoyocardPayment() {
		return yoyocardPayment;
	}

	/**
	 * @param yoyocardPayment
	 *            the yoyocardPayment to set
	 */
	public void setYoyocardPayment(double yoyocardPayment) {
		this.yoyocardPayment = yoyocardPayment;
	}

	public boolean getIsActive() {
		return (isActive == 1) ? true : false;
	}

	public void setIsActive(boolean isActive) {
		this.isActive = (isActive == true) ? 1 : 0;
	}

}
