/*
 *
 */
package onlinebookstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onlinebookstore.dao.UserDao;
import onlinebookstore.entity.UserInfo;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserSvr")
public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
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
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String action = request.getParameter("Action");
		String strUserName = request.getParameter("UserName");
		if (action.equals("CheckUserName")) {
			UserDao ud = new UserDao();
			if (ud.CheckUserName(strUserName)) {
				// Return 1 stands for exists.
				out.print(1);
			} else {
				out.print(0);
			}
		} else if (action.equals("Login")) {
			UserDao ud = new UserDao();
			String strUserPwd = request.getParameter("UserName");
			UserInfo ui = ud.Login(strUserName, strUserPwd);
			if (ui.getStatus() == 1) {
				// Return 1 stands for exists.
				out.print(1);
			} else {
				out.print(0);
			}

			request.getSession().setAttribute("LoginUserInfo", ui);
		}

		// if ("iamcrzay".equals(strUserName)) {
		// out.print("<br /><b>Sorry,the user is exist</b>");
		// } else {
		// out.print("<i><b>Congratulation,this accont you can use!!!!</b></i><a class=\"learn-more\" href=\"#\">learn more</a>");
		// }
		out.close();
		// TODO Return to the check
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
