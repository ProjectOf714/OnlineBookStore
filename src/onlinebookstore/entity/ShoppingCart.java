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
	private UserInfo userInfo;
	private BookInfo bookItem;
	private int quantity;

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
	 * @return the userInfo
	 */
	public UserInfo getUserInfo() {
		return userInfo;
	}

	/**
	 * @return the bookItem
	 */
	public BookInfo getBookItem() {
		return bookItem;
	}

	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}
}
