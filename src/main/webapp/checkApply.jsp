<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.List,java.util.ArrayList"%>
<%@ page import="Bean.CheckPSE"%>
<%@ page import="Db.JDBCCheckApply"%>
<%@ page import="Bean.Apply"%>

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

<title>請假系統-審核調職申請</title>
</head>

<body>
	<%
		JDBCCheckApply db=new JDBCCheckApply();
		if(request.getAttribute("status")!=null){
			int status=Integer.parseInt(request.getAttribute("status").toString());
			
			if(status==1){
	%>
	<script>
	sweetAlert("審核成功", "已完成審核!!", "success");

	</script>

	<%
		}else if(status==2){
	%>
	<script>
	sweetAlert("失敗", "系統錯誤!!", "error");
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
			<jsp:param name="status" value="checkApply" />
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
						<h1><img src="img/applpcheck.png"></h1>
						<table class="CSSTableGenerator" border="1">
							<tbody>
								<tr>
									<td scope="col">申請日期</td>
									<td scope="col">姓名</td>
									<td scope="col">員工編號</td>
									<td scope="col">部門</td>
									<td scope="col">職位</td>
									<td scope="col">申請部門</td>
									<td scope="col">申請職位</td>
									<td scope="col"></td>
								</tr>

								<%
									
									List<Apply> list=(ArrayList<Apply>)db.ListUncheckApply(0);
															
															
															for(Apply apply: list){
								%>
								
								<tr>
									<td><%=apply.getAp_date()%></td>
									<td><%=apply.getName()%></td>
									<td><%=apply.getEid()%></td>
									<td><%=apply.getDep_name()%></td>
									<td><%=apply.getJob_name()%></td>
									<td><%=apply.getAp_dep_name()%></td>
									<td><%=apply.getAp_job_name()%></td>
									<td><form action="checkApply2.jsp" method="post">
									
									<input type="hidden" name="apid" value="<%=apply.getaPID()%>">
									
									<button class="btn btn-danger" type="submit">審核</button>
					          		</form>
					          		</td>
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
