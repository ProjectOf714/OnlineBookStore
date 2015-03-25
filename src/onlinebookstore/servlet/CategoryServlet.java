/*
 *
 */
package onlinebookstore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onlinebookstore.dao.CategoryDao;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/ShowCategory")
public class CategoryServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		CategoryDao categoryLst = (CategoryDao) request.getSession(true)
				.getAttribute("categorylist");
		if (categoryLst == null) {
			try {
				categoryLst = new CategoryDao();
			} catch (Exception e) {
				log.error("", e);
			}
			categoryLst.RetrieveFromDB();
		}

		getServletContext().setAttribute("categorylist1", categoryLst);
		request.getSession().setAttribute("categorylist", categoryLst);
		categoryLst.getLstCategory().forEach(s -> log.debug(s.toString()));

		getServletContext().getRequestDispatcher("/ListCategory.jsp").forward(
				request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
