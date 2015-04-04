/*
 *
 */
package onlinebookstore.entity;

import java.io.Serializable;

public class ShoppingCart implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 3857382596435224972L;
	private int cartNo;
	private int userID, iSBN;
	private UserInfo userInfo;
	private BookInfo bookItem;
	private int quantity;

	public ShoppingCart() {
	}

	public ShoppingCart(int iCartNo, UserInfo user, BookInfo pBook, int iQty) {
		super();
		cartNo = iCartNo;
		userInfo = user;
		bookItem = pBook;
		quantity = iQty;
	}

	/**
	 * @return the cartNo
	 */
	public int getCartNo() {
		return cartNo;
	}

	/**
	 * @param cartNo
	 *            the cartNo to set
	 */
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	/**
	 * @return the userID
	 */
	public int getUserID() {
		return userID;
	}

	/**
	 * @param userID
	 *            the userID to set
	 */
	public void setUserID(int userID) {
		this.userID = userID;
	}

	/**
	 * @return the iSBN
	 */
	public int getISBN() {
		return iSBN;
	}

	/**
	 * @param iSBN
	 *            the iSBN to set
	 */
	public void setISBN(int iSBN) {
		this.iSBN = iSBN;
	}

	/**
	 * @return the userInfo
	 */
	public UserInfo getUserInfo() {
		return userInfo;
	}

	/**
	 * @param userInfo
	 *            the userInfo to set
	 */
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	/**
	 * @return the bookItem
	 */
	public BookInfo getBookItem() {
		return bookItem;
	}

	/**
	 * @param bookItem
	 *            the bookItem to set
	 */
	public void setBookItem(BookInfo bookItem) {
		this.bookItem = bookItem;
	}

	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity
	 *            the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
