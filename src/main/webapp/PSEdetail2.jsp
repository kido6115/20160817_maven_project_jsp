<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>請假系統-假單內容</title>


</head>

<body>

	<div id="wrapper">

		<jsp:include page="Home.jsp">
			<jsp:param name="status" value="PSEsearch" />
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
						<h1>假單內容</h1>
						<p></p>
						<div id="form">
							<table class="CSSTableGenerator" border="1">
								<tbody>
									<tr>
										<td colspan="2" scope="col"><label for="textfield3">假單編號</label></td>
										<td colspan="3" scope="col">111</td>
									</tr>
									<tr>
										<td colspan="2" scope="col"><label for="textfield3">姓名
												:</label></td>
										<td colspan="3" scope="col">Amy</td>
									</tr>
									<tr>
										<td colspan="2" scope="row"><label for="textfield4">員工編號:</label></td>
										<td colspan="3">123</td>
									</tr>
									<tr>
										<td rowspan="5" scope="row"><p>假別一</p></td>
										<tdscope="row">假別
										</td>
										<td colspan="3">病假</td>
									</tr>
									<tr>
										<td scope="row">假別起始日期:</td>
										<td>2015/08/19</td>
										<td>假別起始時間:</td>
										<td>09:00</td>
									</tr>
									<tr>
										<td scope="row">假別結束日期:</td>
										<td>2015/08/19</td>
										<td>假別結束時間:</td>
										<td>18:00</td>
									</tr>
									<tr>
										<td scope="row">請假時數:</td>
										<td colspan="3">8</td>
									</tr>
									<tr>
										<td scope="row">備註：</td>
										<td colspan="3">流感</td>

									</tr>

									<tr>
										<td rowspan="5" scope="row"><p>假別二</p></td>
										<td scope="row">假別</td>
										<td colspan="3">特休</td>
									</tr>
									<tr>
										<td scope="row">假別起始日期:</td>
										<td>2015/08/20</td>
										<td>假別起始時間:</td>
										<td>09:00</td>
									</tr>
									<tr>
										<td scope="row">假別結束日期:</td>
										<td>2015/08/20</td>
										<td>假別結束時間:</td>
										<td>下午 18:00</td>
									</tr>
									<tr>
										<td scope="row">請假時數:</td>
										<td colspan="3">8</td>
									</tr>
									<tr>
										<td scope="row">備註：</td>
										<td colspan="3">特休</td>

									</tr>

								</tbody>
							</table>
							<p>&nbsp;</p>
							<p>
								<input type="button" name="button" id="button" value="返回"
									class="btn btn-primary" onclick="history.back()">
							</p>
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