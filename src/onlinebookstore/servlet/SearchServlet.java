/*
 *
 */
package onlinebookstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import onlinebookstore.dao.BookDao;
import onlinebookstore.entity.BookInfo;
import onlinebookstore.entity.ShoppingCart;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet(description = "For Search book by keyword", urlPatterns = { "/Search" })
public class SearchServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see BaseServlet#BaseServlet()
	 */
	public SearchServlet() {
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
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		RequestDispatcher dispatcher;

		// if session does not exist, forward to index.jsp
		if (session == null) {
			dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		}

		String strSearchKeyword = request.getParameter("SearchKeyword");
		log.info(strSearchKeyword);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
			// Retrieve and process request parameters: "author" and "search"
			boolean hasSearchParam = strSearchKeyword != null
					&& (strSearchKeyword.length() > 0);

			out.println("<html><head><title>Search Results</title></head><body>");
			out.println("<h2>Search Results</h2>");

			if (!hasSearchParam) { // No params present
				out.println("<h3>Please input the key word!</h3>");
				out.println("<p><a href='index.jsp'>Back to Main page</a></p>");
			} else {
				BookDao bd = new BookDao();
				bd.getBookByKeyword(strSearchKeyword);
				if (bd.getLstBookInfo().isEmpty()) {
					out.println("<h3>No book found. Please try again!</h3>");
					out.println("<p><a href='index.jsp'>Back to Main page</a></p>");
				} else {
					boolean useServlet = false;
					if (useServlet) {
						// Print the result in an HTML form inside a table
						out.println("<form method='post' action='AddToCartServlet'>");
						out.println("<input type='hidden' name='todo' value='add' />");
						out.println("<table border='1' cellpadding='6'>");
						out.println("<tr>");
						out.println("<th>&nbsp;</th>");
						out.println("<th>AUTHOR</th>");
						out.println("<th>TITLE</th>");
						out.println("<th>PRICE</th>");
						out.println("<th>QTY</th>");
						out.println("</tr>");
						Iterator<BookInfo> iter = bd.getLstBookInfo()
								.iterator();
						while (iter.hasNext()) {
							BookInfo item = iter.next();
							// Print each row with a checkbox identified by
							// book's
							// id
							String isbn = String.valueOf(item.getISBN());
							out.println("<tr>");
							out.println("<td><input type='checkbox' name='isbn' value='"
									+ isbn + "' /></td>");
							out.println("<td>" + item.getAuthor() + "</td>");
							out.println("<td>" + item.getTitle() + "</td>");
							out.println("<td>$" + item.getPrice() + "</td>");
							out.println("<td><input type='text' size='3' value='1' name='qty"
									+ isbn + "' /></td>");
							out.println("</tr>");
						}

						out.println("</table><br />");

						// Submit and reset buttons
						out.println("<input type='submit' value='Add to My Shopping Cart' />");
						out.println("<input type='reset' value='CLEAR' /></form>");

						// Hyperlink to go back to main page
						out.println("<p><a href='index.jsp'>Back to Main page</a></p>");

						// Show "View Shopping Cart" if cart is not empty
						if (session != null) {
							synchronized (session) {
								// Retrieve the shopping cart for this session,
								// if
								// any. Otherwise, create one.
								@SuppressWarnings("unchecked")
								List<ShoppingCart> lstCart = (List<ShoppingCart>) session
										.getAttribute("cart");
								if (lstCart != null && !lstCart.isEmpty()) {
									out.println("<p><a href='cart.jsp'>View Shopping Cart</a></p>");
								}
							}
						}
						out.println("</body></html>");
					} else {
						session.setAttribute("serachResult", bd);
						dispatcher = request
								.getRequestDispatcher("/search.jsp");
						dispatcher.forward(request, response);
					}
				}
			}
		} catch (Exception ex) {
			out.println("<h3>Service not available. Please try again later!</h3></body></html>");
			log.error(ex.getMessage(), ex);
		} finally {
			out.close();
		}
	}
}
