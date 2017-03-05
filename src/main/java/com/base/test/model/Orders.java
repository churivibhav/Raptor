package com.base.test.model;

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
	long id;
	
	String orderItem; 
	double cost;
	int quantity;
	String type;
	String kot;
	
	
	@ManyToOne
    @JoinColumn(name = "bill_id")
	private Bill bill;
	
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
				+ type + ", kot=" + kot + ", bill_id=" +  "]";
	}
	
	
    public Bill getCategory() {
        return bill;
    }
}
