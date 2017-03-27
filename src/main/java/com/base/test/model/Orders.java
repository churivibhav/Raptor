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

@Entity
@Table(name = "Orders")
public class Orders {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	private String orderItem;
	private double cost;
	private int quantity;
	private String type;
	private String kot;
	private long waiterID;
	private Date date;

	
	@ManyToOne
	@JoinColumn(name = "billID")
	private Bill bill;

	public Orders(){
		
	}
	
	public Orders(String orderItem, double cost, int quantity, String type, String kot, Bill bill, long waiterID) {
		super();
		this.orderItem = orderItem;
		this.cost = cost;
		this.quantity = quantity;
		this.type = type;
		this.kot = kot;
		this.bill = bill;
		this.waiterID = waiterID;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(String orderItem) {
		this.orderItem = orderItem;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKot() {
		return kot;
	}

	public void setKot(String kot) {
		this.kot = kot;
	}

	@Override
	public String toString() {
		return "Orders [id=" + id + ", orderItem=" + orderItem + ", cost=" + cost + ", quantity=" + quantity + ", type="
				+ type + ", kot=" + kot + ", bill=" + bill + "]";
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

}
