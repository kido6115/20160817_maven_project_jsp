package Servlet;

import java.io.IOException;
import java.sql.*;
import java.util.LinkedList;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.Hours;
import Bean.SearchHour_m;
import Db.JDBCPSEsearch;
import Db.JDBCSearchHour;

public class hoursearchServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String Eid;
	private String Name;
	private String Year;
	private static final JDBCSearchHour db = null;

	public hoursearchServlet1() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String url = request.getParameter("url");

		Year = request.getParameter("Year");
		Name = request.getParameter("Name");
		Eid = request.getParameter("Eid");
		JDBCSearchHour db = new JDBCSearchHour();
		JDBCPSEsearch db2 = new JDBCPSEsearch();
		request.setAttribute("Year",Year);

		String dep=session.getAttribute("Identity").toString();
		request.setAttribute("Eid",Eid);
		request.setAttribute("Name",Name);
		List<Hours> list2 = null;
		try {
			int i = 0;
			List<SearchHour_m> list = db.SearchHour_m(Year, Eid, Name,dep);

			list2 = db2.getYear();
			request.setAttribute("YearList", list2);
			request.setAttribute("SearchList", list);

			RequestDispatcher dispatcher = request
					.getRequestDispatcher("searchhour_m.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
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
