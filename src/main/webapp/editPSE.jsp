<%-- <%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List,java.util.ArrayList"%>
<%@ page import="Db.SearchHour"%>
<%@ page import="Bean.edit"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="js/sweetalert.min.js"></script>
<title>請假系統-修改/刪除假單</title>


</head>

<body>
	<%
		if(session.getAttribute("echeck")!=null) {			
		if (((String)session.getAttribute("echeck")).equals("1")){
	%>
	<script>
		sweetAlert('請假時間已請!!!');
	</script>
	<%
		session.setAttribute("echeck","");}
	%>

	<%
		if (((String)session.getAttribute("echeck")).equals("2")){
	%>
	<script>
		sweetAlert('修改成功!!!');
	</script>
	<%
		session.setAttribute("echeck","");}
		}
	%>

	<div id="wrapper">

		<jsp:include page="Home.jsp">
			<jsp:param name="status" value="editPSE" />
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
							<img src="img/edit.png">
						</h1>
						<form action="deleteServlet" method="post">

							<table class="CSSTableGenerator">
								<tr>
									<td scope="col">選取</td>
									<td scope="col">主假單編號</td>
									<td scope="col">申請時間</td>
									<td scope="col">退回原因</td>
									<td scope="col">查看內容</td>
								</tr>



								<%
									ArrayList<edit> showed = (ArrayList<edit>) request.getAttribute("edit");
												for(edit ee : showed) {
								%>
								<tr>
									<td scope="row"><input type="checkbox" name="checkbox"
										value="<%=ee.getPid()%>" id="checkbox"></td>

									<td>
										<%
											out.println(ee.getPid());
										%>
									</td>
									<td>
										<%
											out.println(ee.getTime());
										%>
									</td>
									<td>
										<%
											if(ee.getReply()==null)
																																																										{out.println("無");}
																																																									else {out.println(ee.getReply());
																																																									}
										%>
									</td>
									<td width="20%"><table align="center">
										<form action="view_pseServlet" method="post"></form>
										<form action="view_pseServlet" method="post" style="float:left">
											<input type="hidden" name="pid" value="<%=ee.getPid()%>">

											<input class="btn btn-info" type="submit" value="查看內容">
										</form>
										&nbsp;&nbsp;&nbsp;&nbsp;
 
										<form action="modifyPSEServlet" method="post" style="float:left">
											<input type="hidden" name="pid" value="<%=ee.getPid()%>">

											<input class="btn btn-info" type="submit" value="修改假單">
										</form>
										</table>

									</td>
								</tr>
								<%
									}
								%>
							</table>

							<br> <input class="btn btn-primary" type="button"
								name="button2" id="button2" value="刪除假單"
								onclick="if(confirm('確認要刪除嗎？')) this.form.submit();">

						</form>

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
 --%>
 
 
 
 <%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List,java.util.ArrayList"%>
<%@ page import="Db.SearchHour"%>
<%@ page import="Bean.edit"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="js/sweetalert.min.js"></script>
<title>請假系統-修改/刪除假單</title>


</head>

<body>
<%
		if(session.getAttribute("echeck")!=null) {			
			
		if (((String)session.getAttribute("echeck")).equals("2")){
	%>
	<script>
sweetAlert('修改成功!!!');
</script>
	<%
		session.setAttribute("echeck","");}
			}
	%>

	<div id="wrapper">

		<jsp:include page="Home.jsp">
			<jsp:param name="status" value="editPSE" />
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
						<h1>修改/刪除假單</h1>
						<form action="deleteServlet" method="post">

							<table class="CSSTableGenerator">
								<tr>
									<td scope="col">選取</td>
									<td scope="col">主假單編號</td>
									<td scope="col">申請時間</td>
									<td scope="col">退回原因</td>
									<td scope="col">查看內容</td>
								</tr>



								<%
									ArrayList<edit> showed = (ArrayList<edit>) request.getAttribute("edit");
																						int i=0;					//editJDBC的ArrayList<edit> showed		
																		for(edit ee : showed) {
																			i++;
								%>
								<tr>
									<td scope="row"><input type="checkbox" name="checkbox"
										value="<%=ee.getPid()%>" id="checkbox"></td>

									<td>
										<%
											out.println(ee.getPid());
										%>
									</td>
									<td>
										<%
											out.println(ee.getTime());
										%>
									</td>
									<td>
										<%
											if(ee.getReply()==null)
																		{out.println("無");}
																	else {out.println(ee.getReply());
																	}
										%>
									</td>
									<td width="20%"><input class="btn btn-info" name="查看內容" type="button"
										id="查看內容" value="查看內容"
										onclick="javascript:location.href='view_pseServlet?pid_n=<%=i%>'"> 
										<input
										class="btn btn-info" type="button" name="button" id="button"
										value="修改假單"
										onclick="javascript:location.href='modifyPSEServlet?pid_n=<%=i%>'"></td>
										<%
										session.setAttribute("PID"+i,ee.getPid()); %>
								</tr>
								<%
									}
								%>
							</table>

							<br> <input class="btn btn-primary" type="button"
								name="button2" id="button2" value="刪除假單"
								onclick="if(confirm('確認要刪除嗎？')) this.form.submit();">
						</form>

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
 