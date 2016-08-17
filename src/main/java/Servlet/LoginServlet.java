/*package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Db.JDBCLogin;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String Account;
	private String Password;
	private static final String nextJSP = "index2Servlet";
	private static final String lastJSP = "index.jsp#Login";

	public LoginServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String url = request.getParameter("url");

		Account = request.getParameter("Eid");
		Password = request.getParameter("Pwd");

		JDBCLogin db = new JDBCLogin();
		int status = db.CheckEmployee(Account, Password);
		if (status == 1) {
			
			request.setAttribute("Account", Account);
			session.setAttribute("Employee", Account);
			int identity=db.getStatus(Account);
			
			session.setAttribute("Identity", identity);
			
			String eName = db.getName(Account);
			session.setAttribute("Name", eName);
			response.sendRedirect(nextJSP);

		} else {
			request.setAttribute("Status", status);

			response.sendRedirect("index.jsp?status=" + status + "#Login");

		}

	}
}
 */

package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Db.JDBCLogin;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String Account;
	private String Password;
	private static final String nextJSP = "index2Servlet";
	private static final String lastJSP = "index.jsp#Login";

	public LoginServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String url = request.getParameter("url");

		Account = request.getParameter("Eid");
		Password = request.getParameter("Pwd");

		JDBCLogin db = new JDBCLogin();
		int status = db.CheckEmployee(Account, Password);
		if (status == 1) {
			int identity = db.getStatus(Account);
			int JOB_ID = db.getJobId(Account);

			request.setAttribute("Account", Account);
			session.setAttribute("Employee", Account);
			session.setAttribute("Identity", identity);
			
			session.setAttribute("JOB_ID", JOB_ID);

			String JOB = db.getJob(Account);
			String DEP = db.getDep(Account);
			session.setAttribute("JOB", JOB);
			session.setAttribute("DEP", DEP);
			String eName = db.getName(Account);
			session.setAttribute("Name", eName);
			response.sendRedirect(nextJSP);

		} else {
			request.setAttribute("Status", status);

			response.sendRedirect("index.jsp?status=" + status + "#Login");

		}

	}
}
