package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Db.JDBCChangePwd;
import Db.JDBCForgetPwd;
import Db.JDBCLogin;

/**
 * Servlet implementation class ForgetPwdServlet
 */
public class ForgetPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String EID;
	String Email;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForgetPwdServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("BIG5");
		HttpSession session = request.getSession();

		EID = request.getParameter("Eid");
		Email = request.getParameter("Email");

		JDBCForgetPwd db = new JDBCForgetPwd();
		JDBCLogin db2 = new JDBCLogin();
		String name = db2.getName(EID);
		int status = db.ForgetPwd(EID, Email);
		if (status == 1) // 有查到信箱
		{
			int ss = db.sendMail(name, Email, EID);
			if (ss == 4) {
				response.sendRedirect("ForgetPwd.jsp?status=" +ss+"&Mail="+Email);
			}

		} else {
			response.sendRedirect("ForgetPwd.jsp?status=" + status);

		}

	}

}
