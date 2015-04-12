/*
 *
 */
package onlinebookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import onlinebookstore.entity.BookInfo;
import onlinebookstore.entity.ShoppingCart;
import onlinebookstore.entity.UserInfo;
import onlinebookstore.util.DBConnect;

public class CartDao extends BaseDao {

	private List<ShoppingCart> lstCart = new ArrayList<ShoppingCart>();

	public CartDao() {
		super();
	}

	public void RetrieveByUserID(UserInfo userInfo) {
		lstCart.clear();
		String sql = "select * from shoppingcart where UserID =?;";
		try {
			DBConnect dbConn = new DBConnect(pool);
			dbConn.prepareStatement(sql);
			dbConn.setInt(1, userInfo.getUserID());
			ResultSet rset = dbConn.executeQuery();
			while (rset.next()) {
				int bookISBN = rset.getInt(3);
				BookDao bd = new BookDao();
				BookInfo book = bd.getBookByISBN(bookISBN);
				ShoppingCart cart = new ShoppingCart(rset.getInt(1), userInfo,
						book, rset.getInt(4));
				lstCart.add(cart);
			}

			dbConn.close();
		} catch (SQLException ex) {
			log.error(ex.toString());
		} catch (Exception e) {
			log.error(e.toString());
		}
	}

	/**
	 * @return the lstCart
	 */
	public List<ShoppingCart> getLstCart() {
		return lstCart;
	}

	public void SaveToDB(ShoppingCart cart) {
		try {
			DBConnect dbConn = new DBConnect(pool);
			String sqlCheck = "select count(1) from shoppingcart where UserID = ? and ISBN=?;";
			dbConn.prepareStatement(sqlCheck);
			dbConn.setInt(1, cart.getUserID());
			dbConn.setInt(2, cart.getISBN());
			boolean checkRslt = Integer.parseInt(dbConn.executeScalar()
					.toString()) == 1;
			String sql = "INSERT INTO shoppingcart(Quantity,UserID,ISBN)VALUES(?,?,?);";
			if (checkRslt)
				sql = "Update shoppingcart set Quantity=? where UserID = ? and ISBN=?;";

			dbConn.prepareStatement(sql);
			dbConn.setInt(1, cart.getQuantity());
			dbConn.setInt(2, cart.getUserID());
			dbConn.setInt(3, cart.getISBN());
			dbConn.executeUpdate();
			dbConn.close();
		} catch (SQLException e) {
			log.error("", e);
		} catch (Exception e) {
			log.error(e.toString());
		}
	}

	public void Remove(ShoppingCart cart) {
		try {
			DBConnect dbConn = new DBConnect(pool);
			String sqlCheck = "DELETE from shoppingcart where UserID = ? and ISBN=?;";
			dbConn.prepareStatement(sqlCheck);
			dbConn.setInt(1, cart.getUserID());
			dbConn.setInt(2, cart.getISBN());
			dbConn.executeUpdate();
			dbConn.close();
		} catch (SQLException e) {
			log.error("", e);
		} catch (Exception e) {
			log.error(e.toString());
		}
	}

	// Update the quantity for the given id
	public boolean update(int isbn, int newQty) {
		Iterator<ShoppingCart> iter = lstCart.iterator();
		while (iter.hasNext()) {
			ShoppingCart item = iter.next();
			if (item.getISBN() == isbn) {
				// id found, increase qtyOrdered
				item.setQuantity(newQty);
				return true;
			}
		}

		return false;
	}
}
