package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.view_sub;
import Db.JDBCEditPSE;
import Db.JDBC_edit;
import Bean.view_sub;



public class editCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int c = 0;
    	
	public editCheckServlet() {
		super();
		
	}

	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		c = Integer.parseInt(request.getParameter("count"));
				
		HttpSession session = request.getSession();
		JDBCEditPSE db = new JDBCEditPSE();
		JDBC_edit db2 = new  JDBC_edit();
		PrintWriter out = response.getWriter();
		int k = 0;
		int j = 0;
		for(int i=1;i<c;i++){
			if (request.getParameterValues("pk" + i) != null){
				j++;
			String pkind=request.getParameter("pk" + i);	
			String date_s=request.getParameter("date_s" + i);		
			String time_s=request.getParameter("time_s" + i);		
			String date_e=request.getParameter("date_e" + i);		
			String time_e=request.getParameter("time_e" + i);		
			String total=request.getParameter("tot" + i);		
			String ps=request.getParameter("ps" + i);	
									
			int a=db.checkpse(1, date_s, time_s,date_e, time_e);
			int b=db.checkpse(3, date_s, time_s,date_e, time_e);
			k+=b;
            k+=a;
			}

		}
		request.setAttribute("count",Integer.toString(j));
		if(k!=0){
			session.setAttribute("echeck","1");
			String pid = (String)session.getAttribute("PID");
			List<view_sub> editPSe=db2.view_sub(pid);
			request.setAttribute("PIDs", editPSe);
			RequestDispatcher dispatcher=request.getRequestDispatcher("modifyPSE.jsp");
			dispatcher.forward(request, response);
		}
		else{
		 RequestDispatcher dispatcher=request.getRequestDispatcher("modifyPSEview.jsp");
			dispatcher.forward(request, response);}

	}

}
