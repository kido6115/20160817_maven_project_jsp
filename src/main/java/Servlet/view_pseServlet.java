package Servlet;

import java.beans.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import Bean.view_sub;
import Db.JDBC_editview;

import com.sun.corba.se.pept.transport.Connection;

public class view_pseServlet extends HttpServlet {

	private static final ServletRequest request = null;
	private String Pid;
	private String Pcid;
	private String StartTime;
	private String StartDate;
	private String EndTime;
	private String EndDate;
	private String Pctatol;
	private String kid;
	private String PS;
	

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String url = request.getParameter("url");
		PrintWriter out = response.getWriter();

		/*
		 * deleteServlet db = new deleteServlet(); 不是宣告servlet 是要宣告JDBC
		 */
		JDBC_editview db = new  JDBC_editview();
		
		List<view_sub> list = null;
		try {
			int i = 0;
			
			int j=Integer.parseInt(request.getParameter("pid_n"));
			String pid = (String)session.getAttribute("PID"+j);
			List<view_sub> list1 = db.view_sub(pid);
			
			request.setAttribute("PCList", list1);

			RequestDispatcher dispatcher = request.getRequestDispatcher("viewPSE.jsp");
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
