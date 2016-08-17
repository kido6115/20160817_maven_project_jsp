package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

import Bean.view_sub;
import Db.JDBC_edit;

import com.sun.corba.se.pept.transport.Connection;

public class modifyPSEServlet extends HttpServlet {

	private static final ServletRequest request = null;
	private String Pid;
	private String Pcid;
	private String StartTime;
	private String StartDate;
	private String EndTime;
	private String EndDate;
	private String Pctatol;
	private String Kid;
	private String PS;
	

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String url = request.getParameter("url");
		PrintWriter out = response.getWriter();

		/*
		 * deleteServlet db = new deleteServlet(); 不是宣告servlet 是要宣告JDBC
		 */
		JDBC_edit db = new  JDBC_edit();
		
		int i=Integer.parseInt(request.getParameter("pid_n"));
		String pid = (String)session.getAttribute("PID"+i);
		List<view_sub> editPSe=db.view_sub(pid);
		
		try {
		
			request.setAttribute("PIDs", editPSe);//("值,名")
			session.setAttribute("PID", pid);
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("modifyPSE.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		
	
	}
}