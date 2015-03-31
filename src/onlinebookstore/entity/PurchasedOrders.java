/*
 *
 */
package onlinebookstore.entity;

import java.io.Serializable;

public class PurchasedOrders implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 6730951923677596167L;
	private int orderNo;
	private int userID;
	private int isbn;
	private int quantity;
	private float Price;

	/**
	 * @param orderNo
	 * @param userID
	 * @param isbn
	 * @param quantity
	 * @param price
	 */
	public PurchasedOrders(int orderNo, int userID, int isbn, int quantity,
			float price) {
		super();
		this.orderNo = orderNo;
		this.userID = userID;
		this.isbn = isbn;
		this.quantity = quantity;
		Price = price;
	}

	/**
	 * @return the orderNo
	 */
	public int getOrderNo() {
		return orderNo;
	}

	/**
	 * @return the userID
	 */
	public int getUserID() {
		return userID;
	}

	/**
	 * @return the isbn
	 */
	public int getIsbn() {
		return isbn;
	}

	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}

	/**
	 * @return the price
	 */
	public float getPrice() {
		return Price;
	}
}
