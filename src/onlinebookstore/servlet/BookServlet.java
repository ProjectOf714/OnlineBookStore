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
import javax.servlet.http.HttpSession;

import onlinebookstore.dao.BookDao;
import onlinebookstore.entity.BookInfo;
import onlinebookstore.entity.UserInfo;

/**
 * Servlet implementation class BookServlet
 */
@WebServlet("/BookSrv")
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
		HttpSession session = request.getSession(false);
		String action = request.getParameter("Action");
		try {
			UserInfo currentUser = (UserInfo) session
					.getAttribute("CurrentUserInfo");
			if (currentUser != null && currentUser.getUsername() != ""
					&& currentUser.getUserRole() == 0) {
				if (action.equals("ImportFromXML")) {
					String xmlFileNameRelativeWebPath = "/WEB-INF/books.xml";
					String xmlFileName = getServletContext().getRealPath(
							xmlFileNameRelativeWebPath);

					BookDao bd = new BookDao();
					List<BookInfo> tmplist = bd.parseFromXML(xmlFileName);
					tmplist.forEach(s -> log.debug(s.toString()));
					Iterator<BookInfo> iter = tmplist.iterator();
					while (iter.hasNext()) {
						BookInfo item = iter.next();
						bd.DeleteByISBN(item.getISBN());
						bd.Add(item);
					}
				}
			}
		} catch (Exception e) {
			log.error("", e);
		}

		String strRef = request.getHeader("Referer");
		if (strRef == null || strRef == "")
			strRef = "index.jsp";
		// get back to the referer page using redirect
		response.sendRedirect(strRef);
	}
}
