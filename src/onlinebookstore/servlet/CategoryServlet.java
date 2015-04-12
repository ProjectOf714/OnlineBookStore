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
			// try {
			// String xmlFileNameRelativeWebPath = "/WEB-INF/Category.xml";
			// String xmlFileName = getServletContext().getRealPath(
			// xmlFileNameRelativeWebPath);
			// System.out.println("Current:" + xmlFileName);
			// System.out
			// .println("getRealPathByRelativeWebPath:"
			// + getRealPathByRelativeWebPath(xmlFileNameRelativeWebPath));
			//
			// categoryLst = new CategoryDao();
			// Dictionary<Category, List<Subcategory>> tmpDic = categoryLst
			// .parseFromXML(xmlFileName);
			//
			// Enumeration<Category> key = tmpDic.keys();
			// while (key.hasMoreElements()) {
			// Category currCate = key.nextElement();
			// log.debug(currCate.toString());
			// List<Subcategory> subCate = tmpDic.get(currCate);
			// subCate.forEach(s -> log.debug(s.toString()));
			// }
			// } catch (Exception e) {
			// log.error("", e);
			// }

			categoryLst = new CategoryDao(true);
			// getServletContext().setAttribute("categorylist1", categoryLst);
			session.setAttribute("categorylist", categoryLst);
			// categoryLst.getLstCategory().forEach(s ->
			// log.debug(s.toString()));
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
		} else
			doGet(request, response);
	}

}
