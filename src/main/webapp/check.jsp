<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ page import="java.sql.*"%>
<%@ page import="java.util.List,java.util.ArrayList"%>
<%@ page import="Bean.CheckPSE"%>

<%@ page import="Db.JDBCCheckPSE"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>請假系統-審核假單</title>



</head>

<body>
	<%
		JDBCCheckPSE db = new JDBCCheckPSE();
		int pid = Integer.parseInt(request.getParameter("pid"));
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
						<p></p>
						<div id="form">
							<table class="CSSTableGenerator" border="1">
								<tbody>
									<tr>
										<td colspan="2" scope="col"><label for="textfield3">姓名
												:</label></td>
										<td colspan="3" scope="col"><%=request.getParameter("name")%></td>
									</tr>
									<tr>
										<td colspan="2" scope="row"><label for="textfield4">員工編號:</label></td>
										<td colspan="3"><%=request.getParameter("eid")%></td>
									</tr>
									<%
										for (int i = 0; i < db.ListPSE(pid).size(); i++) {

											//	SimpleDateFormat sf = new SimpleDateFormat("yyyy/M/d HH:mm:ss");
											//	String sDate=db.ListPSE(pid).get(i).getstartdatetime();

											//	java.util.Date utilDate = new java.util.Date();

											//		  Date date = DateFormat.getDateTimeInstance().parse(sDate);
									%>


									<tr>
										<td rowspan="5" scope="row"><p>
												假別<%=(i + 1)%></p></td>
										<td scope="row">假別</td>
										<td colspan="3"><%=db.ListPSE(pid).get(i).getkname()%></td>
									</tr>
									<tr>
										<td scope="row">假別起始日期:</td>
										<td><%=db.ListPSE(pid).get(i).getstartdate()%></td>
										<td>假別起始時間:</td>
										<td><%=db.ListPSE(pid).get(i).getstarttime()%></td>
									</tr>
									<tr>
										<td scope="row">假別結束日期:</td>
										<td><%=db.ListPSE(pid).get(i).getenddate()%></td>
										<td>假別結束時間:</td>
										<td><%=db.ListPSE(pid).get(i).getendtime()%></td>
									</tr>
									<tr>
										<td scope="row">請假時數:</td>
										<td colspan="3"><%=db.ListPSE(pid).get(i).getpctotal()%></td>
									</tr>
									<tr>
										<td scope="row">備註：</td>
										<td colspan="3">
											<%
												if (db.ListPSE(pid).get(i).getps() == null) {
														out.println("無");
													} else {
														out.println(db.ListPSE(pid).get(i).getps());
													}
											%>
										</td>

									</tr>
									<%
										}
									%>

								</tbody>

							</table>
							<br>
							<form name="form1" action="CheckpseServlet" method="post">
								<input type="hidden" name="pid" value="<%=pid%>"> <input
									type="hidden" name="status" value="back"> <font
									style="font-size: 20px; font-weight: 900;">訊息回覆</font>:<br>
								<textarea placeholder="字數不可超過200字" rows="4" cols="50"
									name="comment" style="width: 100%"
									onkeyup="this.value = this.value.slice(0, 200)">
</textarea>
								<br>
								<div style="float: right">
									<button class="btn-lg btn-info" type="submit" name="submit"
										id="submit" ><img src="img/notok.png">&nbsp;退回</button>
								</div>


							</form>


							<form name="form2" action="CheckpseServlet" method="post">
								<input type="hidden" name="status" value="pass"> <input
									type="hidden" name="pid" value="<%=pid%>">
								<div style="float: right">

									<button class="btn-lg btn-danger" type="submit" name=""
										id="submit" ><img src="img/ok.png">&nbsp;通過</button>

								</div>
							</form>
							<div style="float: right">
								<button class="btn-lg btn-primary" type="button" name="button"
									id="button"  onclick="history.back();"><img src="img/previous.png">&nbsp;返回</button>
							</div>


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
