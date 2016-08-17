/*package Servlet;

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

import Bean.SearchHour;
import Bean.SearchHour_e;
import Bean.Hours;
import Bean.SearchPSE;
import Db.JDBCSearchHour;
import Db.JDBCPSEsearch;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import Bean.SearchHour_e;
import Db.JDBCSearchHour;

*//**
 * Servlet implementation class exportServlet
 *//*
public class exportServlet_hour_E extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String Eid;
	private String Name;

	private String Year;
	private String EStartdatetime;


	*//**
	 * @see HttpServlet#HttpServlet()
	 *//*
	public exportServlet_hour_E() {
		super();
		// TODO Auto-generated constructor stub
	}

	*//**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *//*

	*//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *//*

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		JDBCSearchHour db = new JDBCSearchHour();
		JDBCPSEsearch db2 = new JDBCPSEsearch();

		List<SearchHour_e> list = null;
		List<Hours> list2 = null;
		HttpSession session = request.getSession();
		String dep=session.getAttribute("Identity").toString();
		try {
			list = db.SearchHour_e(Year, null,dep);//數量是根據?
			list2 = db2.getYear();

			request.setAttribute("SearchList", list);
			request.setAttribute("YearList", list2);

			RequestDispatcher dispatcher = request
					.getRequestDispatcher("test.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String dep=session.getAttribute("Identity").toString();

		Year = request.getParameter("Year");
		

		Eid = (String) session.getAttribute("Employee");

		

		JDBCSearchHour db = new JDBCSearchHour();
		List<SearchHour_e> list = null;

	


		
		
		try {

			if (Year.equals("") ) {

				list = db.SearchHour_e(Year, Eid,dep);
				db.ArrayCsv(list);
				String file=db.ArrayCsv(list);
			    response.sendRedirect("test.jsp?file="+file); 
		request.setAttribute("SearchList", list);

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("PSEsearch_m.jsp");
				dispatcher.forward(request, response);
			}else 
				if(!Year.equals("") ) {
					list = db.SearchHour_e(Year,Eid,dep);
					String file=db.ArrayCsv(list);
					    response.sendRedirect("test.jsp?file="+file); 
						request.setAttribute("SearchList", list);

						RequestDispatcher dispatcher = request
								.getRequestDispatcher("PSEsearch_m.jsp");
						dispatcher.forward(request, response);
	
					} else {
					request.setAttribute("SearchList", "ohno");
					RequestDispatcher dispatcher = request
							.getRequestDispatcher("searchhour_e.jsp");
					dispatcher.forward(request, response);

				}
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
*/


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

import Bean.SearchHour;
import Bean.SearchHour_e;
import Bean.Hours;
import Bean.SearchPSE;
import Db.JDBCSearchHour;
import Db.JDBCPSEsearch;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import Bean.SearchHour_e;
import Db.JDBCSearchHour;

/**
 * Servlet implementation class exportServlet
 */
public class exportServlet_hour_E extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String Eid;
	private String Name;

	private String Year;
	private String EStartdatetime;


	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public exportServlet_hour_E() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		JDBCSearchHour db = new JDBCSearchHour();
		JDBCPSEsearch db2 = new JDBCPSEsearch();

		List<SearchHour_e> list = null;
		List<Hours> list2 = null;
		HttpSession session = request.getSession();
		String dep=session.getAttribute("Identity").toString();
		try {
			list = db.SearchHour_e(Year, null,dep);//數量是根據?
			list2 = db2.getYear();

			request.setAttribute("SearchList", list);
			request.setAttribute("YearList", list2);

			RequestDispatcher dispatcher = request
					.getRequestDispatcher("test.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String dep=session.getAttribute("Identity").toString();

		Year = request.getParameter("Year");
		

		Eid = (String) session.getAttribute("Employee");

		

		JDBCSearchHour db = new JDBCSearchHour();
		List<SearchHour_e> list = null;

	


		
		
		try {

			if (Year.equals("") ) {

				list = db.SearchHour_e(Year, Eid,dep);
				//csv
				/*db.ArrayCsv(list);
				String file=db.ArrayCsv(list);*/
				//excel
				db.exporthour_e(list);
				String file = db.exporthour_e(list);
				
			    response.sendRedirect("test.jsp?file="+file); 
		
			}else 
				if(!Year.equals("") ) {
					list = db.SearchHour_e(Year,Eid,dep);
					//csv
					/*String file=db.ArrayCsv(list);*/
					//excel
					String file = db.exporthour_e(list);
					
					    response.sendRedirect("test.jsp?file="+file); 
									} else {
					request.setAttribute("SearchList", "ohno");
					RequestDispatcher dispatcher = request
							.getRequestDispatcher("searchhour_e.jsp");
					dispatcher.forward(request, response);

				}
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
