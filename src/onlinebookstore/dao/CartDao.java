/*
 *
 */
package onlinebookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import onlinebookstore.entity.BookInfo;
import onlinebookstore.entity.ShoppingCart;
import onlinebookstore.entity.UserInfo;
import onlinebookstore.util.DBConnect;

public class CartDao extends BaseDao {

	public CartDao() {
		super();
	}

	private List<ShoppingCart> lstCart = new ArrayList<ShoppingCart>();

	public void RetrieveByUserID(UserInfo userInfo) {
		String sql = "select * from shoppingcart where UserID= ?;";
		try {
			DBConnect dbConn = new DBConnect(pool);
			dbConn.prepareStatement(sql);
			dbConn.setInt(1, userInfo.getUserID());
			ResultSet rset = dbConn.executeQuery(sql);
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

	public void SaveToDB(ShoppingCart cart) {
		String sql = "INSERT INTO shoppingcart(UserID,ISBN,Quantity)VALUES(?,?,?);";
		try {
			DBConnect dbConn = new DBConnect(pool);
			dbConn.prepareStatement(sql);
			dbConn.setInt(1, cart.getUserInfo().getUserID());
			dbConn.setInt(2, cart.getBookItem().getIsbn());
			dbConn.setInt(3, cart.getQuantity());
			dbConn.executeUpdate();
			dbConn.close();
		} catch (SQLException e) {
			log.error("", e);
		} catch (Exception e) {
			log.error(e.toString());
		}
	}
}
