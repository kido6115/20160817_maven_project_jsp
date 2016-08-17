package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Db.JDBCAddPSE;


public class addPSEServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int count = 0;
    private int Pid;
	
	public addPSEServlet() {
		super();
		
	}

	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		count = Integer.parseInt(request.getParameter("count"));
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String Eid=(String) session.getAttribute("Employee");
		
		java.text.SimpleDateFormat Formatr = new java.text.SimpleDateFormat("yyyy/MM/dd HH/mm");
		java.util.Date currentime= new java.util.Date();
		String ad=Formatr.format(currentime);
		JDBCAddPSE db = new JDBCAddPSE();	
		Pid = db.nPSE(Eid,ad);
			
		for(int i=1;i<=count;i++){
			int Pcid=i;
			String pkind=request.getParameter("pkind" + i);		
			String date_s=request.getParameter("date_s" + i);		
			String time_s=request.getParameter("time_s" + i);		
			String date_e=request.getParameter("date_e" + i);		
			String time_e=request.getParameter("time_e" + i);		
			String total=request.getParameter("total" + i);		
			String ps=request.getParameter("ps" + i);	
			
			
			
			db.nSubPSE(Pid,Pcid, pkind,date_s, date_e,
					time_s,time_e,total, ps);
			
			}
			
		session.setAttribute("check","2");

		response.sendRedirect("addPSE.jsp");
	
	}

}
