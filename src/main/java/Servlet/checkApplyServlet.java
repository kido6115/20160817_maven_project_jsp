package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.Apply;
import Bean.Hours;
import Bean.SearchHour_e;
import Db.JDBCCheckApply;
import Db.JDBCLogin;
import Db.JDBCPSEsearch;
import Db.JDBCSearchHour;

/**
 * Servlet implementation class checkApplyServlet
 */
public class checkApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public checkApplyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");

		JDBCCheckApply db = new JDBCCheckApply();

		if (request.getParameter("pass") != null) {
			String Eid = request.getParameter("eid");
			JDBCLogin db2 = new JDBCLogin();

			int aPID = Integer.parseInt(request.getParameter("apid"));
			int depid = Integer.parseInt(request.getParameter("depid"));
			int jobid = Integer.parseInt(request.getParameter("jobid"));
			int ap_depid = Integer.parseInt(request.getParameter("ap_depid"));
			int ap_jobid = Integer.parseInt(request.getParameter("ap_jobid"));
			
			String Email = db2.getMail(Eid);
			List<Apply> list = db.ListUncheckApply(aPID);
			int status = db.PassApply(aPID, Eid, depid, jobid, ap_depid,
					ap_jobid);
			if (status == 2) {
				request.setAttribute("status", 3); // 部門主管只有一個

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("checkApply2.jsp");
				dispatcher.forward(request, response);
			} else if (status == 5) {

				int sendmail = db.sendMail_Pass(Email, Eid, list);

				request.setAttribute("status", 1); // 審核程公
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("checkApply.jsp");
				dispatcher.forward(request, response);
			}
			System.out.println("tatatat");

		} else if (request.getParameter("notpass") != null) {
			String Eid = request.getParameter("eid");
			JDBCLogin db2 = new JDBCLogin();

			int aPID = Integer.parseInt(request.getParameter("apid"));

			String Email = db2.getMail(Eid);
			List<Apply> list = db.ListUncheckApply(aPID);
			int status = db.notPassApply(aPID);
			if (status == 3) {
				int sendmail = db.sendMail(Email, Eid, list);

				request.setAttribute("status", 1); // 審核假單完成

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("checkApply.jsp");
				dispatcher.forward(request, response);
			} else {
				request.setAttribute("status", 2); // 系統錯誤

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("checkApply.jsp");
				dispatcher.forward(request, response);
			}
		} else {

		}

		/*
		 * String SQL=db.Searchhour(Year, Eid, Name);
		 *//*
			 * response.sendRedirect("searchhour_test.jsp?SQL="+SQL);
			 */

		/*
		 * }else { request.setAttribute("Status", status);
		 * 
		 * response.sendRedirect("index.jsp?Status="+status+"#Login");
		 */
	}

}
