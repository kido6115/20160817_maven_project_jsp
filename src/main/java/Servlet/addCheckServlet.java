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




public class addCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int c = 0;
    	
	public addCheckServlet() {
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
		JDBCAddPSE db = new JDBCAddPSE();
		PrintWriter out = response.getWriter();
		int k = 0;
		int j = 0;
		for(int i=1;i<=c;i++){
			if (request.getParameterValues("pkind" + i) != null){
				j++;
			String pkind=request.getParameter("pkind" + i);	
			String date_s=request.getParameter("date_s" + i);		
			String time_s=request.getParameter("time_s" + i);		
			String date_e=request.getParameter("date_e" + i);		
			String time_e=request.getParameter("time_e" + i);		
			String total=request.getParameter("total" + i);		
			String ps=request.getParameter("ps" + i);	
			
			request.setAttribute("pkind" + j,pkind);	
            request.setAttribute("date_s" + j,date_s);		
			request.setAttribute("time_s" + j,time_s);		
			request.setAttribute("date_e" + j,date_e);		
			request.setAttribute("time_e" + j,time_e);		
			request.setAttribute("total" + j,total);		
			request.setAttribute("ps" + j,ps);
			
			int a=db.checkpse(1, date_s, time_s,date_e, time_e);
			int b=db.checkpse(3, date_s, time_s,date_e, time_e);
            k+=b;
            k+=a;
			
			}

		}
		request.setAttribute("count",Integer.toString(j));
		if(k!=0){
			session.setAttribute("check","1");
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("addPSE.jsp");
			dispatcher.forward(request, response);
		}
		else{
		 RequestDispatcher dispatcher=request.getRequestDispatcher("addPSEview.jsp");
			dispatcher.forward(request, response);}

	}

}
