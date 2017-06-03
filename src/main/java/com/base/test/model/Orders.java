package com.base.test.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.base.test.serializer.LocalDateSerializer;
import com.base.test.serializer.OrderItemSerializer;
import com.base.test.serializer.WaiterNameSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Entity
@Table(name = "Orders")
public class Orders {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@JsonSerialize(using = OrderItemSerializer.class)
	private long orderItemID;

	private double cost;
	private int quantity;
	private String chalanID;
	private double vat;
	private double serviceTax;
	private double serviceCharge;
	private int isDelivered;

	@JsonSerialize(using = WaiterNameSerializer.class)
	private long waiterID;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(insertable = false, updatable = false)
	@JsonSerialize(using = LocalDateSerializer.class)
	private Date creationDate;

	@Temporal(TemporalType.TIMESTAMP)
	@JsonSerialize(using = LocalDateSerializer.class)
	private Date modificationDate;

	@ManyToOne
	@JoinColumn(name = "billID")
	private Bill bill;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getVat() {
		return vat;
	}

	public void setVat(double vat) {
		this.vat = vat;
	}

	public double getServiceTax() {
		return serviceTax;
	}

	public void setServiceTax(double serviceTax) {
		this.serviceTax = serviceTax;
	}

	public double getServiceCharge() {
		return serviceCharge;
	}

	public void setServiceCharge(double serviceCharge) {
		this.serviceCharge = serviceCharge;
	}

	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

	public long getWaiterID() {
		return waiterID;
	}

	public void setWaiterID(long waiterID) {
		this.waiterID = waiterID;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public Date getModificationDate() {
		return modificationDate;
	}

	public void setModificationDate(Date modificationDate) {
		this.modificationDate = modificationDate;
	}

	public long getOrderItemID() {
		return orderItemID;
	}

	public void setOrderItemID(long orderItemID) {
		this.orderItemID = orderItemID;
	}

	public String getChalanID() {
		return chalanID;
	}

	public void setChalanID(String chalanID) {
		this.chalanID = chalanID;
	}

	/**
	 * @return the isDelivered
	 */
	public int getIsDelivered() {
		return isDelivered;
	}

	/**
	 * @param isDelivered the isDelivered to set
	 */
	public void setIsDelivered(int isDelivered) {
		this.isDelivered = isDelivered;
	}

	public void addAmounts(Orders order) {
		cost = cost + order.getCost();
		serviceCharge = serviceCharge + order.getServiceCharge();
		serviceTax = serviceTax + order.getServiceTax();
		vat = vat + order.getVat();
	}

	public double getTotalAmount() {
		return cost + serviceCharge + serviceTax + vat;
	}

	@Override
	public boolean equals(Object obj) {
		return id == ((Orders) obj).getId();
	}

	@Override
	public String toString() {
		return "Orders [id=" + id + ", orderItemid=" + orderItemID + ", cost=" + cost + ", quantity=" + quantity
				+ ", bill=" + bill + "]";
	}

	@Override
	public Orders clone() throws CloneNotSupportedException {
		Orders order = new Orders();
		order.setBill(bill);
		order.setChalanID(chalanID);
		order.setCost(cost);
		order.setCreationDate(creationDate);
		order.setId(id);
		order.setModificationDate(modificationDate);
		order.setOrderItemID(orderItemID);
		order.setQuantity(quantity);
		order.setServiceCharge(serviceCharge);
		order.setServiceTax(serviceTax);
		order.setVat(vat);

		return order;
	}
}
