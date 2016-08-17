package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.hr;
//import Db.JDBCPSEsearch;
import Db.JDBC_hr;

public class hrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String Eid;
	private String Name;
	private String dep_id;
	private String job_id;

	public hrServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		Eid = request.getParameter("Eid");
		Name = request.getParameter("Name");
		dep_id = request.getParameter("dep");
		job_id = request.getParameter("job");

		System.out.println(Eid);
		System.out.println(Name);
		request.setAttribute("Eid", Eid);
		request.setAttribute("Name", Name);
		request.setAttribute("dep", dep_id);
		request.setAttribute("job", job_id);

		JDBC_hr db = new JDBC_hr();
		List<hr> list = null;

		try {

			list = db.hr(Eid, Name, dep_id, job_id);

			if (list.size() > 0) {

				request.setAttribute("hrList", list);

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("hr.jsp");
				dispatcher.forward(request, response);

			} else {

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("hr.jsp");
				dispatcher.forward(request, response);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		/*
		 * Eid = (String) session.getAttribute("Employee");
		 * 
		 * JDBC_hr db = new JDBC_hr(); List<hr> list = null;
		 * 
		 * try { list = db.hr(Eid, null, null, null);
		 * 
		 * request.setAttribute("hrList", list);
		 * 
		 * RequestDispatcher dispatcher = request
		 * .getRequestDispatcher("hr.jsp"); dispatcher.forward(request,
		 * response);
		 * 
		 * } catch (Exception e) { e.printStackTrace(); }
		 */

	}

}
