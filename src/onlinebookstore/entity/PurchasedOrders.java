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
	private int iSBN;
	private int quantity;
	private float Price;

	// /**
	// * @param orderNo
	// * @param userID
	// * @param isbn
	// * @param quantity
	// * @param price
	// */
	// public PurchasedOrders(int orderNo, int userID, int isbn, int quantity,
	// float price) {
	// super();
	// this.orderNo = orderNo;
	// this.userID = userID;
	// iSBN = isbn;
	// this.quantity = quantity;
	// Price = price;
	// }

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
	public int getISBN() {
		return iSBN;
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

	/**
	 * @param iSBN
	 *            the iSBN to set
	 */
	public void setISBN(int iSBN) {
		this.iSBN = iSBN;
	}

	/**
	 * @param orderNo
	 *            the orderNo to set
	 */
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	/**
	 * @param userID
	 *            the userID to set
	 */
	public void setUserID(int userID) {
		this.userID = userID;
	}

	/**
	 * @param quantity
	 *            the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	/**
	 * @param price
	 *            the price to set
	 */
	public void setPrice(float price) {
		Price = price;
	}

}
