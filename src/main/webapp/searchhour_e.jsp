<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List,java.util.ArrayList"%>
<%@ page import="Bean.SearchHour_e"%>
<%@ page import="Bean.SearchHour_m"%>
<%@ page import="Bean.Hours"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>叫安╰参-琩高计</title>
</head>
<body>

	<%
		if(session.getAttribute("Employee")==null)
			{
			response.sendRedirect("index.jsp?Login=1#Login");	
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

						<h1><img src="img/search.png"></h1>

						<form name="form2"  method="post"
							class="fontstyle">

							<table align="center">
								<tr style="height: 50px;">
									<td> :</td>
									<td>&nbsp;  <select name="Year">
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
										<option value="<%=hours.getYear()%>" ><%=hours.getYear()%></option>
										
										<%
									}
									
									}else {
								%>
								<option value="<%=hours.getYear()%>"><%=hours.getYear()%></option>
								
								<%}} %>
						</select>
						</td>
								


						<td>&nbsp;	
						
						<button  class="btn btn-primary" type="submit" 
								onClick="return switchAndSubmit()"><img src="img/interface.png">琩高</button>
					&nbsp;
								</td>
								<td>
							<button class="btn btn-warning" id="excel" type="submit"
												onClick="return switchAndSubmit2()"><img src="img/download.png">&nbsp;蹲</button>
								</td>
								</tr>
								</table>
						</form>
						<h2></h2>


						<script language="javascript">
							function switchAndSubmit() {
								var formObj = document.form2;

								formObj.action = "hoursearchServlete";
								formObj.submit();
								return false;
							}
							function switchAndSubmit2() {
								var formObj = document.form2;
								
								formObj.action = "exportServlet_hour_E";
								formObj.submit();
								return false;
							}
						</script>
						<br>


						<form name="form4" method="post" class="fontstyle">
							<table class="CSSTableGenerator" border="1">

								<tr>
									<td>絪腹</td>
									<td>﹎</td>
									<td></td>
									<td>安贺</td>
									<td></td>

								</tr>
								<%
									ArrayList<SearchHour_e> list = (ArrayList<SearchHour_e>) request.getAttribute("SearchList");
								%>
								<script>
									$("#first> tr").remove();
									$("#first tr").remove();
									$("#first td").remove();
								</script>
								<%
									// print the information about every category of the list
								for(SearchHour_e searchhour : list) {
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