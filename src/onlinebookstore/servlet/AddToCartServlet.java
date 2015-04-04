/*
 *
 */
package onlinebookstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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

		// if session does not exist, forward to index.html
		if (session == null) {
			dispatcher = request.getRequestDispatcher("/index.html");
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
					out.println("<p><a href='login.html'>Back to Login Menu</a></p>");
					out.println("</body></html>");
				} finally {
					out.close(); // Always close the output writer
				}
			} else {
				CartDao cd = new CartDao();
				@SuppressWarnings("unchecked")
				List<ShoppingCart> lstCart = (List<ShoppingCart>) session
						.getAttribute("cart");
				if (lstCart == null) {
					// set session attribute "cart"
					session.setAttribute("cart",
							cd.RetrieveByUserID(currentUser));
				}

				int isbn = Integer.valueOf(request.getParameter("isbn"));
				ShoppingCart cartIns = new ShoppingCart();

				Optional<ShoppingCart> findCart = lstCart.stream()
						.filter(ss -> ss.getISBN() == isbn).findFirst();
				if (findCart != null && findCart.isPresent()) {
					cartIns = findCart.get();
					cartIns.setQuantity(cartIns.getQuantity() + 1);
				} else {
					cartIns.setISBN(isbn);
					cartIns.setUserInfo(currentUser);
					cartIns.setQuantity(1);
				}

				cd.SaveToDB(cartIns);
				session.setAttribute("cart", lstCart);
				// // determine if book is in cart
				// CartItemBean cartItem =
				// ( CartItemBean ) cart.get( book.getISBN() );
				//
				// // If book is already in cart, update its quantity.
				// // Otherwise, create an entry in the cart.
				// if ( cartItem != null )
				// cartItem.setQuantity( cartItem.getQuantity() + 1 );
				// else
				// cart.put( book.getISBN(), new CartItemBean( book, 1 ) );
				//
				// send the user to cart.jsp
				dispatcher = request.getRequestDispatcher("/cart.jsp");
				dispatcher.forward(request, response);
			}
		}

	}
}
