/*
 *
 */
package onlinebookstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Optional;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import onlinebookstore.dao.CartDao;
import onlinebookstore.entity.ShoppingCart;
import onlinebookstore.entity.UserInfo;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddToCartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		RequestDispatcher dispatcher;

		// if session does not exist, forward to index.jsp
		if (session == null) {
			dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		} else {
			// Must Login First Before add to cart
			UserInfo currentUser = (UserInfo) session
					.getAttribute("CurrentUserInfo");
			if (currentUser == null) {
				// Set the response message's MIME type
				response.setContentType("text/html;charset=UTF-8");
				// Allocate a output writer to write the response message into
				// the
				// network socket
				PrintWriter out = response.getWriter();
				// Write the response message, in an HTML page
				try {
					out.println("<!DOCTYPE html>");
					out.println("<html>");
					out.println("<head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
					out.println("<title>Login</title></head><body>");
					out.println("<p>Please login first before add book to shopping cart.</p>");
					out.println("<p><a href='login.jsp'>Back to Login Menu</a></p>");
					out.println("</body></html>");
				} finally {
					out.close(); // Always close the output writer
				}
			} else {
				String action = request.getParameter("Action");
				if (action == null || action == "") {
					action = "Add";
				}

				CartDao cd = (CartDao) session.getAttribute("cart");
				if (cd == null) {
					cd = new CartDao();
					cd.RetrieveByUserID(currentUser);
					// set session attribute "cart"
					session.setAttribute("cart", cd);
				}

				int isbn = Integer.valueOf(request.getParameter("isbn"));
				ShoppingCart cartIns = new ShoppingCart();
				Optional<ShoppingCart> findCart = cd.getLstCart().stream()
						.filter(ss -> ss.getISBN() == isbn).findFirst();
				if (findCart != null && findCart.isPresent()) {
					cartIns = findCart.get();
					if (action.equals("updateQty")) {
						int qty = Integer.valueOf(request
								.getParameter("txtQty"));
						cartIns.setQuantity(qty);
					} else if (action.equals("remove")) {
						cd.Remove(cartIns);
					} else {
						cartIns.setQuantity(cartIns.getQuantity() + 1);
					}
				} else if (action.equals("Add")) {
					cartIns.setISBN(isbn);
					cartIns.setUserInfo(currentUser);
					cartIns.setQuantity(1);
				}

				if (!action.equals("remove")) {
					cd.SaveToDB(cartIns);
				}
				cd.RetrieveByUserID(currentUser);
				session.setAttribute("cart", cd);
				// send the user to cart.jsp
				dispatcher = request.getRequestDispatcher("/cart.jsp");
				dispatcher.forward(request, response);
			}
		}

	}
}
