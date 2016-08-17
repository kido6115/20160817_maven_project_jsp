package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Date;
import Db.JDBCSetHour;

/**
 * Servlet implementation class AddNextYear
 */
public class AddNextYearServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AddNextYearServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Date sysdate = new Date();
		   JDBCSetHour db2 = new JDBCSetHour();
		int nowdate= sysdate.getYear()+1901;
		if (db2.MaxYear()<nowdate){
		JDBCSetHour db = new JDBCSetHour();
		int year=db.MaxYear();//HOURS中YEAR最大值
		int nyear=year+1;//
		int a = db.AddNextYear(year, nyear);
		};
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("sethour.jsp");
		dispatcher.forward(request, response);
	}

}
