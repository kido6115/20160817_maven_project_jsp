package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




public class addPSEViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    	
	public addPSEViewServlet() {
		super();
		
	}

	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String count;
		count = request.getParameter("count");
				
		HttpSession session = request.getSession();
		
		PrintWriter out = response.getWriter();
		
		
		for(int i=1;i<=Integer.parseInt(request.getParameter("count"));i++){
			
			String pkind=request.getParameter("pkind" + i);	
			String date_s=request.getParameter("date_s" + i);		
			String time_s=request.getParameter("time_s" + i);		
			String date_e=request.getParameter("date_e" + i);		
			String time_e=request.getParameter("time_e" + i);		
			String total=request.getParameter("total" + i);		
			String ps=request.getParameter("ps" + i);	
			
			
			request.setAttribute("pkind" + i,pkind);	
            request.setAttribute("date_s" + i,date_s);		
			request.setAttribute("time_s" + i,time_s);		
			request.setAttribute("date_e" + i,date_e);		
			request.setAttribute("time_e" + i,time_e);		
			request.setAttribute("total" + i,total);		
			request.setAttribute("ps" + i,ps);	
			
			
		}
		request.setAttribute("count",count);
		RequestDispatcher dispatcher=request.getRequestDispatcher("addPSE.jsp");
		dispatcher.forward(request, response);
	}

}
