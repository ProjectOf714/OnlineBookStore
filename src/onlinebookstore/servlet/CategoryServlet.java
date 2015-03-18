/*
 *
 */
package onlinebookstore.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onlinebookstore.database.*;
import onlinebookstore.entity.*;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Servlet implementation class CategoryServlet
 */
// @WebServlet("/ShowCategory")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger log = LogManager.getLogger(CategoryServlet.class);

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		CategoryList categoryLst = (CategoryList) request.getSession(true)
				.getAttribute("categorylist");
		if (categoryLst == null) {
			categoryLst = new CategoryList();
		}

		String sql = "SELECT * FROM `category`;";
		try {
			DBConnect db = new DBConnect(sql);
			ResultSet result = db.executeQuery();
			while (result.next()) {
				Category cat = new Category(result.getInt(1),
						result.getString(2));
				categoryLst.addCategory(cat);
			}
		} catch (Exception e) {
			log.error(e.toString());
			e.printStackTrace();
		}

		categoryLst.getLstCategory().forEach(s -> log.debug(s.toString()));

		request.getSession().setAttribute("categorylist", categoryLst);
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
