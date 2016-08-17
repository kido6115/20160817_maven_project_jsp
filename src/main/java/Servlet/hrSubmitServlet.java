package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.Hours;
import Bean.SearchHour;
import Bean.hr;
import Db.JDBC_hr;


public class hrSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String Eid;
	private String dep_id;
	private String job_id;
	
	private int i = 0;
       
    
    public hrSubmitServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String url = request.getParameter("url");
		
		try {
		int count=Integer.parseInt(request.getParameter("count"));
		ArrayList<String[] > list = new ArrayList<String[]>();

		for(int i=0;i<count;i++) {
   String[] depChange=new String[5];
   depChange[0]= request.getParameter("Eid"+i);
   depChange[1]= request.getParameter("oldDep"+i);
   depChange[2]= request.getParameter("oldJob"+i);
   depChange[3]= request.getParameter("depID"+i);
   depChange[4]= request.getParameter("jobID"+i);
   list.add(depChange);


		}
	
		JDBC_hr db = new JDBC_hr();
		
		
			
			List list2 = db.hrChange(list);
			
			request.setAttribute("notPass", list2);
			

			RequestDispatcher dispatcher=request.getRequestDispatcher("hr.jsp");
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	   int k=0;


		

}
}
