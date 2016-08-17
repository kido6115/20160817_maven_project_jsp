package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Db.JDBCApplyChange;

/**
 * Servlet implementation class applychange_Servlet
 */
public class applychange_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int Pid;
	private String comment;
	private int apply;
	private int count = 0;
	private String status;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public applychange_Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String Eid = (String) session.getAttribute("Employee");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		java.text.SimpleDateFormat Formatr = new java.text.SimpleDateFormat(
				"yyyy/MM/dd HH/mm");
		java.util.Date currentime = new java.util.Date();
		String ad = Formatr.format(currentime);// 抓現在時間

		int dep_old = Integer.parseInt(request.getParameter("dep_old"));
		int job_old = Integer.parseInt(request.getParameter("job_old"));

		int dep_new = Integer.parseInt(request.getParameter("apartment"));
		int job_new = Integer.parseInt(request.getParameter("identity"));
		String ps = request.getParameter("ps");

		JDBCApplyChange db = new JDBCApplyChange();
		apply = db.applyjob(Eid, ad, dep_old, job_old, dep_new, job_new, ps);



		RequestDispatcher dispatcher = request
				.getRequestDispatcher("applychange.jsp?status="+apply);
		dispatcher.forward(request, response);

	}

}
