/*
 *
 */
package onlinebookstore.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import onlinebookstore.entity.BookInfo;

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
		}
		//
		// // session exists, get cart HashMap and book to add
		// Map<String,CartItemBean> cart = (Map<String,CartItemBean>)
		// session.getAttribute( "cart" );
		//
		BookInfo book = (BookInfo) session.getAttribute("bookToAdd");
		//
		// // if cart does not exist, create it
		// if ( cart == null ) {
		// cart = new HashMap<String,CartItemBean>();
		//
		// // set session attribute "cart"
		// session.setAttribute( "cart", cart );
		// }
		//
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
		// // send the user to viewCart.jsp
		// dispatcher =
		// request.getRequestDispatcher( "/viewCart.jsp" );
		// dispatcher.forward( request, response );
	}

}
