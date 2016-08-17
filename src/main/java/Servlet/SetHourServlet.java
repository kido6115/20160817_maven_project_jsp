package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.SearchHour;
import Bean.UseLeft;
import Db.JDBCSetHour;

public class SetHourServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String Eid;
	private String Name;
	private String Year;
	private String Sick;
	private String Death;
	private String Birth;
	private String Spe;

	public SetHourServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String url = request.getParameter("url");

		Year = request.getParameter("year");
		Name = request.getParameter("Name");
		Eid = request.getParameter("Eid");
		Sick = request.getParameter("sick");
		Death = request.getParameter("death");
		Birth = request.getParameter("birth");
		Spe = request.getParameter("spe");

		JDBCSetHour db = new JDBCSetHour();
		try {
			
			List<SearchHour> list=db.Searchhour(Year, Eid, Name,Sick,Death,Birth,Spe);
			List<UseLeft> use=db.SearchUseHour("1",Year);//STATUS=1 通過
			List<UseLeft> left=db.SearchUseHour("3",Year);//STATUS=3 待審核


            
			request.setAttribute("SearchList", list);
			session.setAttribute("ViewList", list);
			request.setAttribute("SearchListUse", use);
			request.setAttribute("SearchListLeft", left);
			request.setAttribute("Eid", Eid);
			request.setAttribute("Year", Year);
			request.setAttribute("Name", Name);
			request.setAttribute("Sick", Sick);
			request.setAttribute("Death", Death);
			request.setAttribute("Birth", Birth);
			request.setAttribute("Spe", Spe);
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("sethour.jsp");
			dispatcher.forward(request, response);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
