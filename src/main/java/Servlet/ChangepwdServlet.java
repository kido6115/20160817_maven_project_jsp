package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Db.JDBCChangePwd;

/**
 * Servlet implementation class ChangepwdServlet
 */
public class ChangepwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String oldpwd;
	private String newpwd;
	private String checkpwd;


	public ChangepwdServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		oldpwd = request.getParameter("oldpwd");
		newpwd = request.getParameter("newpwd");
		checkpwd = request.getParameter("checkpwd");
		String Eid=(String) session.getAttribute("Employee");
		JDBCChangePwd db = new JDBCChangePwd();	
		int status = db.ChangePwd(Eid, oldpwd,newpwd);
		if(newpwd.equals(checkpwd)==false)
		{
			//所輸入的新密碼不一致喔!請重新輸入
			response.sendRedirect("changepwd.jsp?status=1");

		}
		else if(oldpwd.equals(newpwd)==true)
		{
			//舊密碼與新密碼不可以一樣喔
			response.sendRedirect("changepwd.jsp?status=2");
		}
		else if(status==4)
		{
			session.removeAttribute("Employee");
			response.sendRedirect("index.jsp?status="+status+"#Login");

		}
		else {
		
		response.sendRedirect("changepwd.jsp?status="+status);

		}
		

	}
}
