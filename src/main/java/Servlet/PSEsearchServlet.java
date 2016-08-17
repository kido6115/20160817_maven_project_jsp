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

public class PSEsearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String SYear;
	private String EYear;
	private String SMonth;
	private String EMonth;
	private String SDay;
	private String EDay;

	private String Eid;
	private String Name;

	private String SStartdatetime;
	private String EStartdatetime;

	// private static final String nextJSP = "PSEsearch.jsp";

	public PSEsearchServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		String url = request.getParameter("url");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String dep=session.getAttribute("Identity").toString();

		SStartdatetime = request.getParameter("sdate");
		EStartdatetime = request.getParameter("edate");

		Eid = request.getParameter("Eid");
		Name = request.getParameter("Name");

		String[] Kind = request.getParameterValues("type");
		String[] Status = request.getParameterValues("status");

		JDBCPSEsearch db = new JDBCPSEsearch();
		List<SearchPSE> list = null;
		List<Hours> list2 = null;

		request.setAttribute("sdate", SStartdatetime);
		request.setAttribute("edate", EStartdatetime);

		request.setAttribute("Eid", Eid);
		request.setAttribute("Name", Name);
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
			if (Kind == null && Status == null && SStartdatetime.equals("")
					&& EStartdatetime.equals("") && Eid==null && Name==null) {

				list = db.SearchPSE(null, null, null, null, null, null,dep);
				request.setAttribute("SearchList", list);

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("PSEsearch_e.jsp");
				dispatcher.forward(request, response);

			} 
			
			else {
			
			list = db.SearchPSE(Eid, Name, SStartdatetime, EStartdatetime,
					Kind, Status,dep);

			list2 = db.getYear();
			request.setAttribute("YearList", list2);

			if (SStartdatetime.equals("") && EStartdatetime.equals("") ) {
				list = db.SearchPSE2(Eid, Name,Kind, Status,dep);

				request.setAttribute("SearchList", list);

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("PSEsearch_m.jsp");
				dispatcher.forward(request, response);
			} else if (db.SearchPSE(Eid, Name, SStartdatetime, EStartdatetime,
					Kind, Status,dep).size() > 0) {

				list = db.SearchPSE(Eid, Name, SStartdatetime, EStartdatetime,
						Kind, Status,dep);

				request.setAttribute("SearchList", list);

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("PSEsearch_m.jsp");
				dispatcher.forward(request, response);

			} else {
				
				request.setAttribute("SearchList", "ohno");

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("PSEsearch_m.jsp");
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
		JDBCPSEsearch db = new JDBCPSEsearch();
		List<SearchPSE> list = null;
		List<Hours> list2 = null;

		try {
			list = db.SearchPSE(null, null, null, null, null, null,dep);
			list2 = db.getYear();

			request.setAttribute("SearchList", list);
			request.setAttribute("YearList", list2);

			RequestDispatcher dispatcher = request
					.getRequestDispatcher("PSEsearch_m.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
