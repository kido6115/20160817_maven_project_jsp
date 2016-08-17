<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Bean.edit"%>
<%@ page import="Bean.view_sub"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List,java.util.ArrayList"%>
<%@ page import="Db.SearchHour"%>
<%@ page import="Bean.edit"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>請假系統-查看假單</title>

</head>

<body>


	<div id="wrapper">

		<jsp:include page="Home.jsp">
			<jsp:param name="status" value="editPSE" />
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
						<h1>查看假單</h1>
						<form>
		    <table width="697" class="CSSTableGenerator">
			<tr>
										<td colspan="2" scope="col"><label for="textfield3">姓名
												:</label></td>
										<td colspan="3" scope="col"><%=session.getAttribute("Name")%></td>
									</tr>
									<tr>
										<td colspan="2" scope="row"><label for="textfield4">員工編號:</label></td>
										<td colspan="3"><%=session.getAttribute("Employee")%></td>
									</tr>
						
						<%          ArrayList<view_sub> view = (ArrayList<view_sub>) request.getAttribute("PCList");
			
																		//editJDBC的ArrayList<edit> showed		
											
				                         	for(view_sub pc : view) {//for(Bean名 pc : view) 
											
								%>
								
			
									
									<tr>
										<td width="23" rowspan="5" scope="row"><p>
												子假單<%=pc.getPcid()%></p></td><!-- Attribute是從Servlet get -->
										<td width="140" scope="row">假別</td>
										<td colspan="3">
											<%=pc.getKid()%>
										</td>
									</tr>
									<tr>
										<td scope="row">假別起始日期:</td>
										<td width="180"><%=pc.getStartDate()%></td>
										<td width="140">假別開始時間:</td>
										<td width="180"><%=pc.getStartTime()%></td>
									</tr>
									<tr>
										<td scope="row">假別結束日期:</td>
										<td><%=pc.getEndDate()%></td>
										<td>假別結束時間:</td>
										<td><%=pc.getEndTime()%></td>
									</tr>
									<tr>
										<td scope="row">請假時數:</td>
										<td colspan="3"><%=pc.getPctatol()%></td>
									</tr>
									<tr>
										<td scope="row">備註：</td>
										<td colspan="3"><%if (pc.getPS()==null){
											out.print('無');
										}else{%><%=pc.getPS()%></td>
										<%} %>		
			
			               <% }	%>	
			       
						</table>
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

