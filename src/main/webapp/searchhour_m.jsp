<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List,java.util.ArrayList"%>
<%@ page import="Bean.SearchHour_m"%>
<%@ page import="Bean.Hours"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>請假系統-查詢時數</title>
</head>
<body>


	<%
		if(session.getAttribute("Employee")==null)
		{
		response.sendRedirect("index.jsp?Login=1#Login");	
		}
	%>
	<%
		if (request.getParameter("SQL") != null)

			{
		out.println(request.getParameter("SQL"));
			}
	%>


	<div id="wrapper">

		<jsp:include page="Home.jsp">
			<jsp:param name="status" value="PSEsearch_m" />
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
						<h1>
							<img src="img/search.png">
						</h1>

						<form name="form2" action="hoursearchServlet1" method="post"
							class="fontstyle">

							<table align="center" border="0" width=100%>
								<tr>
									<td width=><p align="center">


											員工編號 :
											<%
										if(request.getAttribute("Eid")==null){
									%>
											<input type="text" name="Eid" id="Eid" value="">
											<%
												}else{
											%>
											<input type="text" name="Eid" id="Eid"
												value="<%=request.getAttribute("Eid")%>">
											<%
												}
											%>
											<br> <br> 員工姓名 :
											<%
 	if(request.getAttribute("Name")==null){
 %>
											<input type="text" name="Name" id="Name" value="">
											<%
												}else{
											%>
											<input type="text" name="Name" id="Name"
												value="<%=request.getAttribute("Name")%>">
											<%
												}
											%>
										</p></td>
									<td>
										<p align="left">
											年度 : <select name="Year">
												<%
													ArrayList<Hours> list2 = (ArrayList<Hours>) request.getAttribute("YearList");
																																					for(Hours hours:list2){
																																					if(request.getAttribute("Year")!=null) {
																																					if(request.getAttribute("Year").equals(hours.getYear())){
												%>
												<option value="<%=hours.getYear()%>" selected><%=hours.getYear()%></option>

												<%
													}else {
												%>
												<option value="<%=hours.getYear()%>" selected><%=hours.getYear()%></option>

												<%
													}
																																					
																																					}else {
												%>
												<option value="<%=hours.getYear()%>"><%=hours.getYear()%></option>

												<%
													}}
												%>
											</select> <br> <br>



											<button class="btn btn-primary" type="submit"
												onClick="return switchAndSubmit()">
												<img src="img/interface.png">查詢
											</button>
											&nbsp;&nbsp;
											<button class="btn btn-warning" id="excel" type="submit"
												onClick="return switchAndSubmit2()"><img src="img/download.png">&nbsp;匯出</button>
										</p>
									</td>
								<tr>
							</table>
						</form>
						<h2>&nbsp;</h2>


						<script language="javascript">
							function switchAndSubmit() {
								var formObj = document.form2;

								formObj.action = "hoursearchServlet1";
								formObj.submit();
								return false;
							}
							function switchAndSubmit2() {
								var formObj = document.form2;

								formObj.action = "exportServlet_hour_M";
								formObj.submit();
								return false;
							}
						</script>
						<br>


						<form name="form4" method="post" class="fontstyle">
							<table class="CSSTableGenerator" border="1">

								<tr>
									<td>員工編號</td>
									<td>員工姓名</td>
									<td>年度</td>
									<td>假種</td>
									<td>上限</td>

								</tr>
								<%
									ArrayList<SearchHour_m> list = (ArrayList<SearchHour_m>) request.getAttribute("SearchList");
								%>
								<script>
									$("#first> tr").remove();
									$("#first tr").remove();
									$("#first td").remove();
								</script>
								<%
									// print the information about every category of the list
																				for(SearchHour_m searchhour : list) {
								%>
								<tr>


									<td>
										<%
											out.println(searchhour.getEid());
										%>
									</td>
									<td>
										<%
											out.println(searchhour.getName());
										%>
									</td>
									<td>
										<%
											out.println(searchhour.getYear());
										%>
									</td>
									<td>
										<%
											out.println(searchhour.getKname());
										%>
									</td>
									<td>
										<%
											out.println(searchhour.getCredit());
										%>
									</td>


								</tr>
								<%
									}
								%>

							</table>

						</form>



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

	<!-- Menu Toggle Script -->
	
	<script>
		$(function() {
			$(".a1").click(function() {
				var _this = $(this).attr("href");
				if ($(_this).css("display") == "none") {
					$(_this).fadeIn();
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