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

public class PSEsearch_eServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String Eid;
	private String Name;

	private String SStartdatetime;
	private String EStartdatetime;

	// private static final String nextJSP = "PSEsearch.jsp";

	public PSEsearch_eServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String dep=session.getAttribute("Identity").toString();
		String url = request.getParameter("url");
		PrintWriter out = response.getWriter();

		SStartdatetime = request.getParameter("sdate");
		EStartdatetime = request.getParameter("edate");

		Eid = (String) session.getAttribute("Employee");
		// Name = request.getParameter("Name");

		String[] Kind = request.getParameterValues("type");
		String[] Status = request.getParameterValues("status");

		JDBCPSEsearch db = new JDBCPSEsearch();
		List<SearchPSE> list = null;
		List<Hours> list2 = null;
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
		request.setAttribute("sdate", SStartdatetime);
		request.setAttribute("edate", EStartdatetime);

		try {
			
			if (SStartdatetime.equals("") && EStartdatetime.equals("") ) {
				list = db.SearchPSE2(Eid, null,Kind, Status,dep);

				request.setAttribute("SearchList", list);

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("PSEsearch_e.jsp");
				dispatcher.forward(request, response);
			} else if (Kind == null && Status == null && SStartdatetime.equals("")
					&& EStartdatetime.equals("")) {

				list = db.SearchPSE_E(Eid, null, null, null, null,dep);
				request.setAttribute("SearchList", list);

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("PSEsearch_e.jsp");
				dispatcher.forward(request, response);

			} else {
				list = db.SearchPSE_E(Eid, SStartdatetime, EStartdatetime,
						Kind, Status,dep);

				list2 = db.getYear();
				request.setAttribute("YearList", list2);

				if (list.size() > 0) {

					/*
					 * list = db.SearchPSE_E(Eid, SStartdatetime,
					 * EStartdatetime, Kind, Status);
					 */

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

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String dep=session.getAttribute("Identity").toString();
		Eid = (String) session.getAttribute("Employee");

		JDBCPSEsearch db = new JDBCPSEsearch();
		List<SearchPSE> list = null;
		List<Hours> list2 = null;

		try {
			list = db.SearchPSE_E(Eid, null, null, null, null,dep);
			list2 = db.getYear();

			request.setAttribute("SearchList", list);
			request.setAttribute("YearList", list2);

			RequestDispatcher dispatcher = request
					.getRequestDispatcher("PSEsearch_e.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
