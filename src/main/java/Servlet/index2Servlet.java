package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.RemainHour;
import Db.JDBCIndex2;

/**
 * Servlet implementation class index2Servlet
 */
public class index2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public index2Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
	   HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("Employee")==null){
			response.sendRedirect("index.jsp?Login=1#Login");
		}else {
		String eid = (String) session.getAttribute("Employee");
		
		JDBCIndex2 db = new JDBCIndex2();

		List<RemainHour> credit = db.getcredit(eid);
		Float[] remain = db.takeoff(eid);
		
		request.setAttribute("Credit", credit);
		request.setAttribute("Remain", remain);

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("index2.jsp");
		dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
