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
import Bean.Hours;
import Bean.SearchPSE;
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

import Bean.Hours;
import Bean.SearchPSE;
import Db.JDBCPSEsearch;

/**
 * Servlet implementation class exportServlet
 */
public class exportEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String Eid;
	private String Name;

	private String SStartdatetime;
	private String EStartdatetime;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public exportEmpServlet() {
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

		JDBCPSEsearch db = new JDBCPSEsearch();
		List<SearchPSE> list = null;
		List<Hours> list2 = null;
		HttpSession session = request.getSession();
		String dep=session.getAttribute("Identity").toString();
		try {
			list = db.SearchPSE(null, null, null, null, null, null,dep);
			list2 = db.getYear();

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
		SStartdatetime = request.getParameter("sdate");
		EStartdatetime = request.getParameter("edate");

		Eid = request.getParameter("Eid");

		String[] Kind = request.getParameterValues("type");
		String[] Status = request.getParameterValues("status");

		JDBCPSEsearch db = new JDBCPSEsearch();
		List<SearchPSE> list = null;

		request.setAttribute("sdate", SStartdatetime);
		request.setAttribute("edate", EStartdatetime);

		if (Kind != null) {
			for (int i = 0; i < Kind.length; i++) {
				request.setAttribute("Kind" + i, Kind[i]);

			}
		}
		if (Status != null) {
			for (int i = 0; i < Status.length; i++) {
				request.setAttribute("Status" + i, Status[i]);

			}
		}
		try {

			if (SStartdatetime.equals("") && EStartdatetime.equals("")) {

				list = db.SearchPSE(Eid, null, null, null, null,null,dep);
				db.Array2Csv(list);

				request.setAttribute("SearchList", list);

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("PSEsearch_e.jsp");
				dispatcher.forward(request, response);

			} else {

				list = db.SearchPSE(Eid, Name, SStartdatetime, EStartdatetime,
						Kind, Status,dep);

				if (db.SearchPSE(Eid, Name, SStartdatetime, EStartdatetime,
						Kind, Status,dep).size() > 0) {

					list = db.SearchPSE(Eid, Name, SStartdatetime,
							EStartdatetime, Kind, Status,dep);
					db.Array2Csv(list);

					request.setAttribute("SearchList", list);

					RequestDispatcher dispatcher = request
							.getRequestDispatcher("PSEsearch_e.jsp");
					dispatcher.forward(request, response);

				} else {
					request.setAttribute("SearchList", "ohno");

					RequestDispatcher dispatcher = request
							.getRequestDispatcher("PSEsearch_e.jsp");
					dispatcher.forward(request, response);

				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
