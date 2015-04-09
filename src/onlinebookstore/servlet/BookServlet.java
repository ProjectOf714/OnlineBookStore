/*
 *
 */
package onlinebookstore.servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onlinebookstore.dao.BookDao;
import onlinebookstore.entity.BookInfo;

/**
 * Servlet implementation class BookServlet
 */
@WebServlet("/BookServlet")
public class BookServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see BaseServlet#BaseServlet()
	 */
	public BookServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {
			String xmlFileNameRelativeWebPath = "/WEB-INF/books.xml";
			String xmlFileName = getServletContext().getRealPath(
					xmlFileNameRelativeWebPath);

			BookDao bd = new BookDao();
			List<BookInfo> tmplist = bd.parseFromXML(xmlFileName);
			tmplist.forEach(s -> log.debug(s.toString()));
			Iterator<BookInfo> iter = tmplist.iterator();
			while (iter.hasNext()) {
				BookInfo item = iter.next();
				bd.Add(item);
			}
		} catch (Exception e) {
			log.error("", e);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// HttpSession session = request.getSession(false);
		//
		// // RequestDispatcher to forward client to bookstore home
		// // page if no session exists or no books are selected
		// RequestDispatcher dispatcher = request
		// .getRequestDispatcher("/index.html");
		//
		// // if session does not exist, forward to index.html
		// if (session == null)
		// dispatcher.forward(request, response);
		//
		// // get books from session object
		// List<BookBean> titles = (List<BookBean>)
		// session.getAttribute("titles");
		//
		// // locate BookBean object for selected book
		// Iterator<BookBean> iterator = titles.iterator();
		// BookBean book = null;
		//
		// String isbn = request.getParameter("isbn");
		//
		// while (iterator.hasNext()) {
		// book = (BookBean) iterator.next();
		//
		// if (isbn.equals(book.getISBN())) {
		//
		// // save the book in a session attribute
		// session.setAttribute("bookToAdd", book);
		// dispatcher = request.getRequestDispatcher("/singleBook.jsp");
		// dispatcher.forward(request, response);
		// }
		// }
		//
		// // if book is not in list, forward to index.html
		// if (book == null)
		// dispatcher.forward(request, response);
	}

}
