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
import Bean.SearchHour_e;

import Db.JDBCPSEsearch;
import Db.JDBCSearchHour;

public class hoursearchServlete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String Year;
	private static final JDBCSearchHour db = null;

	public hoursearchServlete() {
		super();
	}

	protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();//建立Session物件
		String eid = (String) session.getAttribute("Employee");
		response.setCharacterEncoding("UTF-8");
		String dep=session.getAttribute("Identity").toString();

		String url = request.getParameter("url");

		Year = request.getParameter("Year");

		JDBCSearchHour ee = new JDBCSearchHour();
		JDBCPSEsearch db2 = new JDBCPSEsearch();

		List<Hours> list2 = null;
		try {
			int i = 0;
			List<SearchHour_e> list = ee.SearchHour_e(Year, eid,dep);
			list2 = db2.getYear();
			
			request.setAttribute("Year", Year);

			request.setAttribute("YearList", list2);
			request.setAttribute("SearchList", list);

			RequestDispatcher dispatcher = request
					.getRequestDispatcher("searchhour_e.jsp");
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