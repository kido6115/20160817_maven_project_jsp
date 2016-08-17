<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>請假系統-查詢時數</title>
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

						<h1><img src="img/searchPSE.png"></h1>

						<form name="form2" action="PSEsearch_m.jsp" class="fontstyle">
							年度 : <select>
								<option>2016</option>
								<option>2015</option>
								<option>2014</option>
								<option>2013</option>
								<option>2012</option>
								<option>2011</option>
							</select>&nbsp;&nbsp; 員工編號 : <input type="text" name="Eid" id="Eid"
								value=""> &nbsp; &nbsp; 員工姓名 : &nbsp;<input type="text"
								name="Name" id="Name" value="">&nbsp;&nbsp; <input
								class="btn btn-primary" type="submit" value="查詢">&nbsp;
								<button class="btn btn-warning">匯出excel檔</button>
								<br>
							<!-- <table>
								<tr style="height: 50px;">
									<td>年度 :</td>
									<td>&nbsp;
									<select>
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

							</table> -->
							<br>

							<!-- <a href="PSEsearch_m.jsp"><button type="button"
									class="btn btn-primary">顯示所有</button></a> -->
							
						</form>

						<br>

						<%
							if (request.getParameter("year") == null
									|| request.getParameter("year").equals("")) {
						%>
						<form name="form4" method="post" class="fontstyle">

							<table class="CSSTableGenerator" border="1">
								<tr>
									<td>年度</td>
									<td>員工編號</td>
									<td>姓名</td>
									<td>事假</td>
									<td>病假</td>
									<td>喪假</td>
									<td>產假</td>
									<td>特休</td>

								</tr>
								<tr>

									<td>105</td>
									<td>123</td>
									<td>Amy</td>
									<td>59/-</td>
									<td>0/54</td>
									<td>0/60</td>
									<td>0/40</td>
									<td>54/54</td>


								</tr>

								<tr>

									<td>105</td>
									<td>456</td>
									<td>Daniel</td>
									<td>59/-</td>
									<td>0/54</td>
									<td>0/60</td>
									<td>0/40</td>
									<td>54/54</td>

								</tr>

								<tr>

									<td>105</td>
									<td>789</td>
									<td>Susu</td>
									<td>59/-</td>
									<td>0/54</td>
									<td>0/60</td>
									<td>0/40</td>
									<td>54/54</td>



								</tr>

								<tr>
									<td>105</td>
									<td>101</td>
									<td>Tom</td>
									<td>59/-</td>
									<td>0/54</td>
									<td>0/60</td>
									<td>0/40</td>
									<td>54/54</td>
								</tr>

							</table>

						</form>

						<%
							} else if (request.getParameter("year") != null) {
						%>
						<form name="form4" method="post" class="fontstyle">

							<table class="CSSTableGenerator" border="1">
								<tr>
									<td>年度</td>
									<td>員工編號</td>
									<td>姓名</td>
									<td>事假</td>
									<td>病假</td>
									<td>喪假</td>
									<td>產假</td>
									<td>特休</td>

								</tr>

								<tr>
									<td>105</td>
									<td>123</td>
									<td>Amy</td>
									<td>59/-</td>
									<td>0/54</td>
									<td>0/60</td>
									<td>0/40</td>
									<td>54/54</td>
								</tr>



							</table>

						</form>
						<%
							}
						%>


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
