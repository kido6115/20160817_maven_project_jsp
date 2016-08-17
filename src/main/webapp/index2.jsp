<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Db.*"%>
<%@  page import="Bean.RemainHour"%>
<%@  page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>請假系統</title>
</head>
<%
	if (session.getAttribute("Employee") == null) {
		response.sendRedirect("index.jsp?Login=1#Login");

	}
	String Eid = (String) session.getAttribute("Employee");
	JDBCIndex2 db = new JDBCIndex2();
	ArrayList<RemainHour> list = (ArrayList<RemainHour>) request.getAttribute("Credit");
	//ArrayList<RemainHour> list2 = (ArrayList<RemainHour>) request.getAttribute("Remain");
	Float[] remain=(Float[])request.getAttribute("Remain");
%>
<body>

	<div id="wrapper">

		<!-- 左邊menue -->
		<jsp:include page="Home.jsp">
			<jsp:param name="status" value="main" />
		</jsp:include>


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
						<h1><%=session.getAttribute("Name")%>,您好！&nbsp;歡迎登入請假系統
						</h1>
						<br>
						<div class="CSSTableGenerator">
							<table>
							
								<tr>
									<td colspan=6>本年度剩餘請假時數</td>
								</tr>


								<tr>
								<td></td>
									<td>事假</td>
									<td>病假</td>
									<td>喪假</td>
									<td>產假</td>
									<td>特休</td>

								</tr>
								<tr>
								<td>請假額度</td>
								<td>-</td>
									<%
										
										for(RemainHour Credit:list){ 
											%>
											<td>
											<%=Credit.getremainHour() %>
											</td>
											<% 
											
										}
										

									%>
								</tr>
								<tr>
																<td>已請時數</td>
								
								
								 <%for(int i=0;i<remain.length;i++){
									 %>
									 <td><%=remain[i] %></td>
									 <%
								
								 }
									 %>
								 
								</tr>
								
								<tr>
								<td>剩餘額度</td>
								<td>-</td>
								<%for(int i=0;i<4;i++){
								
								%>
								<td><%=list.get(i).getremainHour()-remain[i+1] %></td>
								<%
								
								}	%>
								
							
								
								</tr>
								
							

							</table>
						</div>

						<br> <br>
						
						
						 
						<p>
						<p></p>
					</div>
				</div>
			</div>
		</div>

	</div>


	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/myJS.js"></script>

	<!-- Menu Toggle Script -->
	
	

</body>

</html>
