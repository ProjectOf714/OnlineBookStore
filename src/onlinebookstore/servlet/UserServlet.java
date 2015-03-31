/*
 *
 */
package onlinebookstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String strEmail = request.getParameter("Email");
		if (action.equals("CheckUserName")) {
			UserDao ud = new UserDao();
			if (ud.CheckUserName(strUserName)) {
				out.print("<b>Sorry,the user is exist</b>");
			} else {
				out.print("This name you can use");
			}
		} else if (action.equals("CheckEmail")) {
			UserDao ud = new UserDao();
			if (ud.CheckEmail(strEmail)) {
				// Return 1 stands for exists.
				out.print("<b>Sorry,the email is exist</b>");
			} else {
				out.print("This email you can use");
			}
		} else if (action.equals("Login")) {
			UserDao ud = new UserDao();
			String strUserPwd = request.getParameter("Password");
			UserInfo ui = ud.Login(strUserName, strUserPwd);
			if (ui.getStatus() == 1) {
				HttpSession session = request.getSession(true);
				session.setAttribute("CurrentUserInfo", ui);
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("/index.html");
				dispatcher.forward(request, response);
			} else {
				out.print(0);
			}

			request.getSession().setAttribute("LoginUserInfo", ui);
		} else if (action.equals("Register")) {
			String[] item = new String[] { "UserName", "Address", "Email",
					"Newsletter", "Password" };
			StringBuilder sb = new StringBuilder();
			for (String strItem : item) {
				sb.append(String.format("%s:%s", strItem,
						request.getParameter(strItem)));
			}

			log.debug(sb.toString());
			UserInfo ui = new UserInfo();
			ui.setUserName(request.getParameter("UserName"));
			ui.setAddress(request.getParameter("Address"));
			ui.setEmail(request.getParameter("Email"));
			ui.setPassword(request.getParameter("Password"));
			if (request.getParameter("Newsletter") != null
					&& request.getParameter("Newsletter") != "")
				ui.setNewsLetter(Integer.parseInt(request
						.getParameter("Newsletter")));
			UserDao ud = new UserDao();
			if (ud.Register(ui)) {
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("/login.html");
				dispatcher.forward(request, response);
			} else {
				out.print("<br /><b>Register failed, please try again.</b>");
			}
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
