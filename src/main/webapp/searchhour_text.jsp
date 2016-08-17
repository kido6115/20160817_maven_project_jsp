<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List,java.util.ArrayList"%>
<%@ page import="Bean.SearchHour"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>

	<%
		if(session.getAttribute("Employee")==null)
			{
			response.sendRedirect("index.jsp?Login=1#Login");	
			}
	%>

	<%
	if(request.getAttribute("SearchList")!=null){
		ArrayList<SearchHour> list = (ArrayList<SearchHour>) request.getAttribute("SearchList");

		// print the information about every category of the list
		for(SearchHour searchhour : list) {
			 out.println(searchhour.getYear());
		    out.println(searchhour.getEid());
		    out.println(searchhour.getName());
		    out.println(searchhour.getCredit());
		    out.println(searchhour.getKname());
		}
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

						<form name="form2" action="hoursearchServlet1" method="post"
							class="fontstyle">

							<table>
								<tr style="height: 50px;">
									<td>年度 :</td>
									<td>&nbsp; <select name="Year">
											<option>2016</option>
											<option>2015</option>
											<option>2014</option>
											<option>2013</option>
											<option>2012</option>
											<option>2011</option>
									</select>
									</td>
								</tr>
								<tr style="height: 50px;">
									<td>員工編號 :</td>
									<td>&nbsp;<input type="text" name="Eid" id="Eid" value=""></td>
								</tr>

								<tr style="height: 50px;">
									<td>員工姓名 :</td>
									<td>&nbsp;<input type="text" name="Name" id="Name"
										value=""></td>
								</tr>

							</table>
							<br> <input class="btn btn-primary" type="submit" value="查詢">

							<!-- <a href="PSEsearch_m.jsp"><button type="button"
									class="btn btn-primary">顯示所有</button></a> -->
							<button class="btn btn-warning" style="float: right;">匯出excel檔</button>
						</form>

						<br>


						<form name="form4" method="post" class="fontstyle">

							<table class="CSSTableGenerator" border="1">
								<tr>
									<td>員工編號</td>
									<td>姓名</td>
									<td>年度</td>
									<td>假種</td>
									<td>上限</td>


								</tr>



							</table>

						</form>


						<form name="form4" method="post" class="fontstyle">

							<table border="1">
								<tr>
									<td>員工編號</td>
									<td>姓名</td>
									<td>年度</td>
									<td>假種</td>
									<td>上限</td>

								</tr>




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