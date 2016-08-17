<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>請假系統-假單送出預覽</title>
<HR color="#00FF00" size="10" width="50%"  align="left">
</head>

<body>

	<div id="wrapper">

	<%
		if(session.getAttribute("Employee")==null)
			{
			response.sendRedirect("index.jsp?Login=1#Login");	
			}
	%>
		<%
			request.setCharacterEncoding("UTF-8");
		%>


		<jsp:include page="Home.jsp">
			<jsp:param name="status" value="addPSE" />
		</jsp:include>

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
					<a href="#menu-toggle" 
							id="menu-toggle"><img src="img/right.png"></a>
							
                          <a href="#menu-toggle2" 
							id="menu-toggle2"><img src="img/left.png"></a>
	<script>
	$("#menu-toggle").hide();

		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#menu-toggle").hide();
			$("#menu-toggle2").show();
			$("#wrapper").toggleClass("toggled");
		});
		
		$("#menu-toggle2").click(function(e) {
			e.preventDefault();
			$("#menu-toggle2").hide();
			$("#menu-toggle").show();
			$("#wrapper").toggleClass("toggled");
		});
	</script>
						<h1>假單修改送出預覽</h1>
						<p></p>
						<div id="form">
						<form action="editPSEServlet" method="post">
							<table width="697" class="CSSTableGenerator">
								<tbody>
									<tr>
										<td colspan="2" scope="col"><label for="textfield3">姓名
												:</label></td>
										<td colspan="3" scope="col"><%=session.getAttribute("Name")%></td>
									</tr>
									<tr>
										<td colspan="2" scope="row"><label for="textfield4">員工編號:</label></td>
										<td colspan="3"><%=session.getAttribute("Employee")%></td>
									</tr>
									<tr>
										<td colspan="2" scope="row"><label for="textfield4">假單編號:</label></td>
										<td colspan="3"><%=session.getAttribute("PID")%></td>
									</tr> 
									<%
									int j=0;
										for (int i = 1; i <= 5; i++) {
											if (request.getParameterValues("pk" + i) != null) {
												
									%>
									
									<tr>
										<td width="23" rowspan="5" scope="row"><p>
												子假單<%=i%></p></td>
										<td width="140" scope="row">假別</td>
										<td colspan="3">
											<%
												String type = request.getParameter("pk" + i);
														if (type.equals("1")) {
															out.println("事假");
														} else if (type.equals("2")) {
															out.println("病假");
														} else if (type.equals("3")) {
															out.println("喪假");
														} else if (type.equals("4")) {
															out.println("產假");
														} else if (type.equals("5")) {
															out.println("特休");
														}
											%>
										</td>
									</tr>
									<tr>
										<td scope="row">假別起始日期:</td>
										<td width="180"><%=request.getParameter("date_s" + i)%></td>
										<td width="140">假別開始時間:</td>
										<td width="180"><%=request.getParameter("time_s" + i)%></td>
									</tr>
									<tr>
										<td scope="row">假別結束日期:</td>
										<td><%=request.getParameter("date_e" + i)%></td>
										<td>假別結束時間:</td>
										<td><%=request.getParameter("time_e" + i)%></td>
									</tr>
									<tr>
										<td scope="row">請假時數:</td>
										<td colspan="3"><%=request.getParameter("tot" + i)%></td>
									</tr>
									<tr>
										<td scope="row">備註：</td>
										<td colspan="3"><%if(request.getParameter("ps" + i)==null){%>無<%} else{%><%=request.getParameter("ps" + i)%><%}%>
										
							 <input type="hidden" name="pkind<%=i%>" value="<%=request.getParameter("pkind" + i)%>" >
                             <input type="hidden" name="date_s<%=i%>" value="<%=request.getParameter("date_s" + i)%>" >
                             <input type="hidden" name="time_s<%=i%>" value="<%=request.getParameter("time_s" + i)%>" >
                             <input type="hidden" name="date_e<%=i%>" value="<%=request.getParameter("date_e" + i)%>" >
                             <input type="hidden" name="time_e<%=i%>" value="<%=request.getParameter("time_e" + i)%>" >
                             <input type="hidden" name="tot<%=i%>" value="<%=request.getParameter("total" + i)%>" >
                             <input type="hidden" name="ps<%=i%>" value="<%=request.getParameter("ps" + i)%>" >
                               
										</td>
								
									</tr>
									
									<%
									j++;
										}
									
										}
									%>
								</tbody>
							</table>
							<p>&nbsp;</p>
							<p>
								<input type="submit" class=" btn btn-primary " name="submit"
									id="submit" value="送出" > 
									<input type="button" class="btn btn-primary " name="button"
									id="button" value="返回" onclick="history.back()">
							</p>
					  <input type="hidden" name="count" value="<%=j %>" >
							
							
</form>

							<p>&nbsp;</p>
							<p>&nbsp;</p>
							<p>
							<p></p>
						</div>
					</div>
				</div>
			</div>
		</div>



		<!-- /#page-content-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>
	<script src="js/myJS.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	

</body>

</html>
