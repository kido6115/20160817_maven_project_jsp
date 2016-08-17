package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.Hours;
import Db.JDBCChangePwd;
import Db.JDBCCheckPSE;
import Db.JDBCLogin;

/**
 * Servlet implementation class CheckpseServlet
 */
public class CheckpseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String comment;
	private int pid;
	private String status;

	public CheckpseServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		pid = Integer.parseInt(request.getParameter("pid"));
		JDBCCheckPSE db = new JDBCCheckPSE();
		JDBCLogin db2 = new JDBCLogin();
		String status = request.getParameter("status");
		String eid=db.getEid(pid);
		String name=db2.getName(eid);
		String Email=db2.getMail(eid);
		if (status.equals("back")) {
			
		
			
			comment = request.getParameter("comment");
			int check = db.check(pid, comment, 2);
			
			int mail=db.sendMail2(name, Email, eid,"不通過,請再次確認",pid);
			if (check == 2) {
				response.sendRedirect("checkPSE.jsp?status=1"); // 已成功退回假單

			} else {
				response.sendRedirect("checkPSE.jsp?status=3"); // 發生錯誤
			}

		} else if (status.equals("pass")) {
			int mail=db.sendMail2(name, Email, eid,"通過,請安心請假",pid);

			int check = db.check(pid, null, 1);
			
			if (check == 2) {
				response.sendRedirect("checkPSE.jsp?status=2"); // 已成功審核假單

			} else {
				response.sendRedirect("checkPSE.jsp?status=3"); // 發生錯誤

			}

		}

	}
}
