<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@  page import="java.util.*"%>
<%@  page import="java.util.Date"%>
<%@  page import="Db.JDBC_hr"%>
<%@  page import="Bean.hr"%>


<%@  page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script type="text/javascript" language="javascript"
	src="js/searchHour.js"></script>
<title>請假系統-人力資源部門</title>
</head>

<body>




	<%
		if(session.getAttribute("Employee")==null)
		{
		response.sendRedirect("index.jsp?Login=1#Login");	
		}
		if(request.getAttribute("notPass")!=null) {
			List<String> alert=(ArrayList<String>)request.getAttribute("notPass");
			if(alert.size()!=0){
			for(String al:alert){
	%>
	<script>
			alert('<%=alert%>沒有通過')
	</script>
	<%
		}
			}
			else if(alert.size()==0){
	%>
	<script>
		alert('調職成功');
	</script>
	<%
		}}
	%>
	<div id="wrapper">

		<jsp:include page="Home.jsp">
			<jsp:param name="status" value="hr" />
		</jsp:include>

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">

						<a href="#menu-toggle" id="menu-toggle"><img
							src="img/right.png"></a> <a href="#menu-toggle2"
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
						<h1>
							<img src="img/people.png">
						</h1>

						<form name="form1" class="fontstyle" method="post"
							action="hrServlet">
							<table border="0" width="80%" align="center">
								<tr>
									<td><table align="center">
											<tr>
												<td>員工編號 &nbsp;:&nbsp; <%
 	if(request.getAttribute("Eid")==null){
 %> <input type="text" name="Eid" id="Eid" value=""> <%
 	} else {
 %> <input type="text" name="Eid" id="Eid"
	value="<%=request.getAttribute("Eid")%>"> <%
 	}
 %> <br> <br>員工姓名 &nbsp;:&nbsp;<%
 	if(request.getAttribute("Name")==null){
 %> <input type="text" name="Name" id="Name" value="">
													<%
														} else {
													%> <input type="text" name="Name" id="Name"
													value="<%=request.getAttribute("Name")%>"> <%
 	}
 %>
												</td>
											</tr>
										</table>
									<td><table align="center">
											<tr>
												<td>部門：&nbsp; <select name="dep" size="1" id="time">
														<%
															if(request.getAttribute("dep")!=null){
														%>


														<option value="">任意部門</option>
														<option value="1"
															<%if(request.getAttribute("dep").equals("1")){%> selected
															<%}%>>HR</option>
														<option value="2"
															<%if(request.getAttribute("dep").equals("2")){%> selected
															<%}%>>SALE</option>
														<option value="3"
															<%if(request.getAttribute("dep").equals("3")){%> selected
															<%}%>>IT</option>
														<option value="4"
															<%if(request.getAttribute("dep").equals("4")){%> selected
															<%}%>>FINANCE</option>
														<option value="5"
															<%if(request.getAttribute("dep").equals("5")){%> selected
															<%}%>>MARKETING</option>



														<%
															}else {
														%>
														<option value="">任意部門</option>
														<option value="1">HR</option>
														<option value="2">SALE</option>
														<option value="3">IT</option>
														<option value="4">FINANCE</option>
														<option value="5">MARKETING</option>
														<%
															}
														%>

												</select> &nbsp; &nbsp; <br> <br>職稱：&nbsp; <select
													name="job" size="1" id="time">

														<%
															if(request.getAttribute("job")!=null){
														%>


														<option value="">任意職稱</option>
														<option value="4"
															<%if(request.getAttribute("job").equals("4")){%> selected
															<%}%>>專員</option>
														<option value="2"
															<%if(request.getAttribute("job").equals("2")){%> selected
															<%}%>>部門經理</option>
														<option value="1"
															<%if(request.getAttribute("job").equals("1")){%> selected
															<%}%>>助理</option>




														<%
															}else {
														%>

														<option value="">任意職稱</option>
														<option value="4">專員</option>
														<option value="2">部門經理</option>
														<option value="1">助理</option>
														<%
															}
														%>
												</select> &nbsp;


												</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td colspan=2>
										<button style="float: right" class="btn btn-primary"
											type="submit">
											<img src="img/interface.png">查詢
										</button>
									</td>
								</tr>
							</table>

						</form>

						<br>

						<form name="form4" method="post" class="fontstyle"
							action="hrSubmitServlet">
							<%
								if(request.getAttribute("hrList")!=null){
							%>
							<table class="CSSTableGenerator" border="1">


								<tr>
									<td>員工編號</td>
									<td>員工姓名</td>
									<td>部門</td>
									<td>職稱</td>
									<td>調動</td>

								</tr>
								<%
									int i=0;																																								

																						ArrayList<hr> list = (ArrayList<hr>)request.getAttribute("hrList");

																						if(list.size()!=0){
																						for(hr hr : list) {
								%>
								<tr>
									<td><input type="hidden" name="Eid<%=i%>"
										value="<%=hr.geteid()%>"><%=hr.geteid()%></td>
									<td><%=hr.getname()%></td>
									<td><input type="hidden" name="oldDep<%=i%>"
										value="<%=hr.getdepID()%>"><%=hr.getdepName()%></td>
									<td><input type="hidden" name="oldJob<%=i%>"
										value="<%=hr.getjobID()%>"><%=hr.getjobName()%></td>
									<td><select name="depID<%=i%>">
											<option value="1" <%if(hr.getdepID().equals("1")){%> selected
												<%}%>>HR</option>
											<option value="2" <%if(hr.getdepID().equals("2")){%> selected
												<%}%>>SALE</option>
											<option value="3" <%if(hr.getdepID().equals("3")){%> selected
												<%}%>>IT</option>
											<option value="4" <%if(hr.getdepID().equals("4")){%> selected
												<%}%>>FINANCE</option>
											<option value="5" <%if(hr.getdepID().equals("5")){%> selected
												<%}%>>MARKETING</option>
									</select><select name="jobID<%=i%>">
											<option value="4" <%if(hr.getjobID().equals("4")){%> selected
												<%}%>>專員</option>
											<option value="2" <%if(hr.getjobID().equals("2")){%> selected
												<%}%>>部門經理</option>
											<option value="1" <%if(hr.getjobID().equals("1")){%> selected
												<%}%>>助理</option>
									</select></td>
								</tr>
								<%
									i++;
																																												
																				}
																						
																					}
								%>
							</table>
							<input type="hidden" name="count" value=<%=i%>> <br>
							<button class="btn btn-primary" type="submit" name="confirm"
								id="confirm">
								<img src="img/paper-plane.png">&nbsp;確認
							</button>
							<%
								}else{
							%>
							<table class="CSSTableGenerator" border="1">
								<tr>
									<td>員工編號</td>
									<td>員工姓名</td>
									<td>部門</td>
									<td>職稱</td>
									<td>調動</td>

								</tr>
								<tr>
									<td colspan="8">查無資料</td>
								</tr>
							</table>
							<%
								}
							%>

						</form>


						<br> <br>
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


	<script>
		$(function() {
			$(".a1").click(function() {
				var _this = $(this).attr("href");
				if ($(_this).css("display") == "none") {
					$(_this).fadeIn();
					$(this).html("-");
				} else {
					$(_this).fadeOut();
					$(this).html("+");
				}
				return false;
			});
		});
	</script>



</body>

</html>
