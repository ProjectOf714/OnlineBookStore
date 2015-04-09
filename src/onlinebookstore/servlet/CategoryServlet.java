/*
 *
 */
package onlinebookstore.servlet;

import java.io.IOException;
import java.util.Dictionary;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import onlinebookstore.dao.CategoryDao;
import onlinebookstore.entity.Category;
import onlinebookstore.entity.Subcategory;

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
				String xmlFileNameRelativeWebPath = "/WEB-INF/Category.xml";
				String xmlFileName = getServletContext().getRealPath(
						xmlFileNameRelativeWebPath);
				System.out.println("Current:" + xmlFileName);
				System.out
						.println("getRealPathByRelativeWebPath:"
								+ getRealPathByRelativeWebPath(xmlFileNameRelativeWebPath));

				categoryLst = new CategoryDao();
				Dictionary<Category, List<Subcategory>> tmpDic = categoryLst
						.parseFromXML(xmlFileName);

				Enumeration<Category> key = tmpDic.keys();
				while (key.hasMoreElements()) {
					Category currCate = key.nextElement();
					log.debug(currCate.toString());
					List<Subcategory> subCate = tmpDic.get(currCate);
					subCate.forEach(s -> log.debug(s.toString()));
				}
			} catch (Exception e) {
				log.error("", e);
			}
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
		HttpSession session = request.getSession(false);
		RequestDispatcher dispatcher;

		// if session does not exist, forward to index.html
		if (session == null) {
			dispatcher = request.getRequestDispatcher("/index.html");
			dispatcher.forward(request, response);
		} else
			doGet(request, response);
	}

}
