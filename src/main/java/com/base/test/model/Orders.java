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
	private String type;
	private String kot;
	private String chalanID;

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

	@Override
	public boolean equals(Object obj) {
		return id == ((Orders) obj).getId();
	}

	@Override
	public String toString() {
		return "Orders [id=" + id + ", orderItemid=" + orderItemID + ", cost=" + cost + ", quantity=" + quantity
				+ ", type=" + type + ", kot=" + kot + ", bill=" + bill + "]";
	}
}
