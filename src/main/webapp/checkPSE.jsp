<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.List,java.util.ArrayList"%>
<%@ page import="Bean.CheckPSE"%>
<%@ page import="Db.JDBCCheckPSE"%>

<!DOCTYPE html>
<html lang="en">

<head>
<script src="js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>請假系統-管理員工假單</title>
</head>

<body>
	<%
		JDBCCheckPSE db=new JDBCCheckPSE();
	if(request.getParameter("status")!=null){
		int status=Integer.parseInt(request.getParameter("status"));
		
		if(status==1){
	%>
	<script>
		sweetAlert("退回", "已退回假單!!", "success");
	</script>

	<%
		}else if(status==2){
	%>
	<script>
		sweetAlert("審核成功", "已完成審核!!", "success");
	</script>

	<%
		}else {
	%>
	<script>
		sweetAlert("失敗", "系統發生錯誤,請重新嘗試!!", "error");
	</script>

	<%
		}
	}
	if (session.getAttribute("Employee") == null) {
		response.sendRedirect("index.jsp?Login=1#Login");

	}
	%>
	<div id="wrapper">

		<jsp:include page="Home.jsp">
			<jsp:param name="status" value="checkPSE" />
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
						<h1><img src="img/check.png"></h1>
						<table class="CSSTableGenerator" border="1">
							<tbody>
								<tr>
									<td scope="col">主假單編號</td>
									<td scope="col">員工編號</td>
									<td scope="col">姓名</td>
									<td scope="col">申請時間</td>
									<td scope="col">查進行審核</td>
								</tr>

								<%
									String dep=session.getAttribute("Identity").toString();
												   if(db.ListUnchecked(dep).size()!=0){
													   List<CheckPSE> list=db.ListUnchecked(dep);
													   
													   
													   for(CheckPSE checkpse:list){
								%>
								<tr>
									<td><%=checkpse.getpid()%></td>
									<td><%=checkpse.geteid()%></td>
									<td><%=checkpse.getname()%></td>

									<td><%=checkpse.getapplytime()%></td>


									<td>
									<form action="check.jsp" method="post">
									<input type="hidden" name="pid" value="<%=checkpse.getpid()%>">
									<input type="hidden" name="name" value="<%=checkpse.getname()%>">
									<input type="hidden" name="eid" value="<%=checkpse.geteid()%>">
									
									<input class="btn btn-info" name="進行審核" type="submit"
										value="進行審核">
										
										</form>
										</td>
								</tr>

								<%
									}}else {
								%>
								<tr>
									<td colspan=5>目前沒有可以審核的假單喔!</td>
								</tr>
								<%
									}
								%>






							</tbody>
						</table>
						<br> 
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
