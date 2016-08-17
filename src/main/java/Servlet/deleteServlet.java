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

import Bean.edit;
import Db.deleteJDBC;

import com.sun.corba.se.pept.transport.Connection;

public class deleteServlet extends HttpServlet {

	private static final ServletRequest request = null;
	private String Pid;
	private String Time;
	private String Reply;
	private String eid;
	private String[] check;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String url = request.getParameter("url");
		PrintWriter out = response.getWriter();

		/*
		 * deleteServlet db = new deleteServlet(); 不是宣告servlet 是要宣告JDBC
		 */
		deleteJDBC db = new deleteJDBC();
		if(request.getParameterValues("checkbox")==null) {
			response.sendRedirect("editServlet1");

		}else {
		String[] check = request.getParameterValues("checkbox");
		if (check.length != 0) {
			try {

				int status = db.checkbox(check);
				if (status == 3) {
					out.println("失敗");
				}
				response.sendRedirect("editServlet1");

			} catch (Exception e) {
				// TODO Auto-generated catch blockdfg
				e.printStackTrace();
			}
			
		}

		}
		/*
		 * protected void doPost(HttpServletRequest request, HttpServletResponse
		 * response) throws ServletException, IOException {
		 * response.setCharacterEncoding("UTF-8"); HttpSession session =
		 * request.getSession();
		 * 
		 * eid = (String) session.getAttribute("Employee"); deleteJDBC db = new
		 * deleteJDBC(); try{ List<edit> ed = db.edit(eid);// List<bean>
		 * 
		 * request.setAttribute("edit", ed);//("值,名") RequestDispatcher
		 * dispatcher = request .getRequestDispatcher("editPSE.jsp");
		 * dispatcher.forward(request, response); }
		 */

	}
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
