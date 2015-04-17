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
import javax.servlet.http.HttpSession;

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
		HttpSession session = request.getSession(true);
		CategoryDao categoryLst = (CategoryDao) session
				.getAttribute("categorylist");
		if (categoryLst == null) {
			categoryLst = new CategoryDao(true);
			session.setAttribute("categorylist", categoryLst);
		}

		String cateID = request.getParameter("cateID");
		String subCateID = request.getParameter("subCateID");
		if (cateID == null || subCateID == null || cateID == ""
				|| subCateID == "") {
			// Set some error message as a Session attribute.
			request.getSession()
					.setAttribute("errorMessage",
							"Can not get parameter value of CategoryID or SubCategoryID.Please try again.");
			String strRef = request.getHeader("Referer");
			if (strRef == null || strRef == "")
				strRef = "index.jsp";
			// get back to the referer page using redirect
			response.sendRedirect(strRef);
		} else {
			request.setAttribute("choosedCategoryID", cateID);
			request.setAttribute("choosedSubCategoryID", subCateID);
			request.getRequestDispatcher("/product.jsp").forward(request,
					response);
		}
	}
}
