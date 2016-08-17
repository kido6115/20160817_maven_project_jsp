<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>員工請假系統-忘記密碼</title>

<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/freelancer.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
</head>
<style>
.littlebox {
	width: 100%;
	height: 260px;
	text-align: center;
}

.boxtext {
	font-size: 8rem;
	font-family: Microsoft JhengHei;
}

.boxtext2 {
	font-size: 4rem;
	font-family: Microsoft JhengHei;
}

.intext {
	text-align: left;
	font-size: 2.4rem;
	fonr-weight: 500;
}
</style>

<body id="page-top" class="index">
	<%
		request.setCharacterEncoding("UTF-8");
		if (request.getParameter("status") != null) {
			int status = Integer.parseInt(request.getParameter("status"));
			if (status == 2) {
	%>
	<script>
		sweetAlert("請重新輸入", "信箱輸入錯誤", "error");
	</script>

	<%
		} else if (status == 3) {
	%>
	<script>
		sweetAlert("請重新輸入", "查無員工編號", "error");
	</script>

	<%
		} else if (status == 4) {
				String Mail = request.getParameter("Mail");
	%>
	<script>
		swal('已傳送新密碼至<%=Mail%>,\n\n請重新登入並修改密碼!');
	</script>
	<%
		} else {
	%>
	<script>
		sweetAlert("請重新輸入", "系統發生不可預期的錯誤QAQ", "error");
	</script>

	<%
		}

		}
	%>
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="ForgetPwd.jsp"><img src="img/forget.png"></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1"></div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- Header -->
	<header>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<img class="img-responsive" src="img/profile.png" alt="">
					<div class="intro-text"></div>
				</div>
			</div>

			<hr class="star-light">
			<form action="ForgetPwdServlet" id="Form1" method="post">
				<p>
					請輸入員工編號：<input style="color: black" type="text" name="Eid" required>
				</p>
				<p>
					請輸入電子郵件：<input style="color: black" type="text" name="Email"
						required>
				</p>
				<br>
				<button type="button" class="btn btn-default"
					onclick="history.back();">回上一頁</button>
				<button type="submit" class="btn btn-warning">送出</button>

			</form>
		</div>

	</header>

	<!-- Footer -->
	<footer class="text-center">
		<div class="footer-above">
			<div class="container">
				<div class="row">
					<div class="footer-col col-md-4">
						<h3>地址</h3>
						<p>242新北市新莊區中正路510號</p>
					</div>
					<div class="footer-col col-md-4">
						<h3>IISI</h3>
						資拓宏宇
					</div>
					<div class="footer-col col-md-4">
						<h3>關於 IISI第四組</h3>
						<p>我們是由五位同學所組成的團體 致力於寫出一個完美的簡易請假系統</p>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-below">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">Copyright &copy; Your Website 2016</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div class="scroll-top page-scroll visible-xs visible-sm">
		<a class="btn btn-primary" href="#page-top"> <i
			class="fa fa-chevron-up"></i>
		</a>
	</div>

	<!-- Portfolio Modals -->
	<div class="portfolio-modal modal fade" id="portfolioModal1"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="modal-body">
							<h2>假單管理</h2>
							<hr class="star-primary">
							<img
								src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE2LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPgo8IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMjU2cHgiIGhlaWdodD0iMjU2cHgiIHZpZXdCb3g9IjAgMCAxMjggMTI4IiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCAxMjggMTI4IiB4bWw6c3BhY2U9InByZXNlcnZlIj4KPGc+Cgk8Zz4KCQk8cGF0aCBkPSJNMTIwLDBIMjRjLTQuNDIyLDAtOCwzLjU4Mi04LDh2MjIuMjM0YzIuMzY3LTIuMTMzLDUuMDYzLTMuNzM4LDgtNC43ODFWOGg5NnYxMTJIMjR2LTE3LjQ1MyAgICBjLTIuOTM4LTEuMDQzLTUuNjMzLTIuNjQ4LTgtNC43ODFWMTIwYzAsNC40MTgsMy41NzgsOCw4LDhoOTZjNC40MjIsMCw4LTMuNTgyLDgtOFY4QzEyOCwzLjU4MiwxMjQuNDIyLDAsMTIwLDB6IE04OCwxNnY5NmgyNFYxNiAgICBIODh6IE0xMDQsMTA0aC04VjI0aDhWMTA0eiBNMzIsOTZjNC4yNzMsMCw4LjI4OS0xLjY2NCwxMS4zMTMtNC42ODhjMy4xMTctMy4xMTcsNC42OC03LjIxNSw0LjY4LTExLjMxM0g2NCAgICBjOC44MiwwLDE2LTcuMTc2LDE2LTE2YzAtOC44Mi03LjE4LTE2LTE2LTE2SDQ3Ljk5MmMwLTQuMDk4LTEuNTYzLTguMTk1LTQuNjgtMTEuMzEzQzQwLjI4OSwzMy42NjQsMzYuMjczLDMyLDMyLDMyICAgIHMtOC4yODksMS42NjQtMTEuMzEzLDQuNjg4bC0xNiwxNkMxLjY2NCw1NS43MTEsMCw1OS43MjcsMCw2NHMxLjY2NCw4LjI4OSw0LjY4OCwxMS4zMTNsMTYsMTZDMjMuNzExLDk0LjMzNiwyNy43MjcsOTYsMzIsOTZ6ICAgICBNMTAuMzQ0LDU4LjM0NGwxNi0xNkMyNy45MDYsNDAuNzgxLDI5Ljk1Myw0MCwzMiw0MHM0LjA5NCwwLjc4MSw1LjY1NiwyLjM0NGMzLjEyNSwzLjEyNSwzLjEyNSw4LjE4OCwwLDExLjMxM0wzNS4zMTMsNTZINjQgICAgYzQuNDIyLDAsOCwzLjU4Miw4LDhzLTMuNTc4LDgtOCw4SDM1LjMxM2wyLjM0NCwyLjM0NGMzLjEyNSwzLjEyNSwzLjEyNSw4LjE4OCwwLDExLjMxM0MzNi4wOTQsODcuMjE5LDM0LjA0Nyw4OCwzMiw4OCAgICBzLTQuMDk0LTAuNzgxLTUuNjU2LTIuMzQ0bC0xNi0xNkM3LjIxOSw2Ni41MzEsNy4yMTksNjEuNDY5LDEwLjM0NCw1OC4zNDR6IiBmaWxsPSIjOTMzRUM1Ii8+Cgk8L2c+CjwvZz4KPC9zdmc+Cg==" />
							<p class="intext" style="color: blue; text-align: center;">包含假單的新增、修改、刪除</p>
							<p class="intext">(1.)新增：員工在有限的時數內可以選擇假種及時數做請假的動作</p>
							<p class="intext">(2.)修改：對於狀態為“退回”的假單可以做修改的動作</p>
							<p class="intext">(3.)刪除：對於狀態為“刪除”的假單可以做刪除的動作</p>

							<br> <br>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">
								<i class="fa fa-times"></i> Close
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="portfolio-modal modal fade" id="portfolioModal2"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="modal-body">
							<h2>查詢時數</h2>
							<hr class="star-primary">
							<img
								src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjI1NnB4IiBoZWlnaHQ9IjI1NnB4IiB2aWV3Qm94PSIwIDAgOTY0LjggOTY0LjgiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDk2NC44IDk2NC44OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+CjxnPgoJPGc+CgkJPHBhdGggZD0iTTE2Ni40OCwzMjguOWM0LjQtNS42LDguOS0xMS4xLDEzLjYtMTYuNGM2LTYuOSwxMi4zLTEzLjcsMTguOS0yMC4yYzIzLjctMjMuNyw0OS45LTQ0LDc4LjQtNjAuOXYtNi42ICAgIGMwLTE1LjQtMTIuNS0yNy44LTI3LjgtMjcuOGgtMzAuOWMtNS41LDAtMTAuNiwyLjYtMTMuNyw3LjFsLTQ1LjYsNjQuNWwtMTEuMS0yMy40bDE3LjctMzcuMmMyLjQtNS4xLTEuMy0xMS02LjktMTFoLTM1LjQgICAgYy01LjYsMC05LjQsNS45LTYuOSwxMWwxNy43LDM3LjJsLTEwLjksMjNsLTQ0LjUtNjMuOWMtMy4xLTQuNS04LjMtNy4zLTEzLjgtNy4zaC0zMi41Yy0xNS40LDAtMjcuOCwxMi41LTI3LjgsMjcuOHYxODQuOWgxMTIuNyAgICBDMTMwLjc4LDM4MC44LDE0Ny4wODEsMzUzLjgsMTY2LjQ4LDMyOC45eiIgZmlsbD0iI0Q4MDAyNyIvPgoJCTxwYXRoIGQ9Ik01MS40OCw4OS42YzAsNDkuNCw0MC4yLDg5LjYsODkuNiw4OS42czg5LjYtNDAuMiw4OS42LTg5LjZjMC00OS40LTQwLjItODkuNi04OS42LTg5LjZTNTEuNDgsNDAuMiw1MS40OCw4OS42eiIgZmlsbD0iI0Q4MDAyNyIvPgoJCTxwYXRoIGQ9Ik04OTYuMjgsMTk3Yy01LjUsMC0xMC42LDIuNi0xMy43LDcuMWwtNDUuNiw2NC41bC0xMS4xLTIzLjRMODQzLjU4LDIwOGMyLjQtNS4xLTEuMy0xMS02Ljg5OS0xMWgtMzUuNCAgICBjLTUuNiwwLTkuMzk5LDUuOS02Ljg5OSwxMWwxNy42OTksMzcuMmwtMTAuODk5LDIzbC00NC40LTYzLjljLTMuMS00LjUtOC4zLTcuMy0xMy44LTcuM2gtMzIuNWMtMTUuNCwwLTI3LjgsMTIuNS0yNy44LDI3Ljh2Ny4xICAgIGMyOC4xLDE2LjcsNTQsMzYuOSw3Ny4zOTksNjAuM2M2LjgwMSw2LjgsMTMuMzAxLDEzLjgsMTkuNSwyMC45YzQuNCw1LjEsOC44MDEsMTAuNCwxMi45LDE1LjdjMTkuNCwyNC45LDM1LjgsNTEuOSw0OC44LDgwLjggICAgaDExMy43VjIyNC44YzAtMTUuNC0xMi41LTI3LjgtMjcuOC0yNy44SDg5Ni4yOEw4OTYuMjgsMTk3eiIgZmlsbD0iI0Q4MDAyNyIvPgoJCTxwYXRoIGQ9Ik03MjkuMTgxLDg5LjZjMCw0OS40LDQwLjIsODkuNiw4OS42LDg5LjZjNDkuNCwwLDg5LjYwMS00MC4yLDg5LjYwMS04OS42YzAtNDkuNC00MC4yLTg5LjYtODkuNjAxLTg5LjYgICAgQzc2OS4zODEsMCw3MjkuMTgxLDQwLjIsNzI5LjE4MSw4OS42eiIgZmlsbD0iI0Q4MDAyNyIvPgoJCTxwYXRoIGQ9Ik05NDAuMjgsODc1LjJMODE3LjM4MSw3ODFjLTE2LjEwMSwyNi4yLTM1LjMwMSw1MC4zOTktNTcuMzAxLDcyLjM5OWMtMS44LDEuODAxLTMuNjk5LDMuNjAxLTUuNiw1LjRsMTI0LjksOTUuNyAgICBjOS4xLDcsMTkuOCwxMC4zLDMwLjM5OSwxMC4zYzE1LDAsMjkuOS02LjcsMzkuNy0xOS42Qzk2Ni4yOCw5MjMuMzk5LDk2Mi4xODEsODkyLDk0MC4yOCw4NzUuMnoiIGZpbGw9IiNEODAwMjciLz4KCQk8cGF0aCBkPSJNNjE2LjA4LDU3MWMwLTE1LjQtMTIuNS0yNy44LTI3LjgtMjcuOGgtMzAuODk5Yy01LjUsMC0xMC42MDEsMi42LTEzLjcsNy4xbC00NS42MDEsNjQuNWwtMTEuMS0yMy40bDE3LjctMzcuMTk5ICAgIGMyLjM5OS01LjEwMS0xLjMtMTEtNi45LTExaC0zNS4zOTljLTUuNjAxLDAtOS40LDUuODk5LTYuOSwxMWwxNy43LDM3LjE5OWwtMTAuOSwyM2wtNDQuMy02My44OTljLTMuMS00LjUtOC4zLTcuMy0xMy44LTcuMyAgICBoLTMyLjVjLTE1LjQsMC0yNy44LDEyLjUtMjcuOCwyNy44djE4NC44OTloMjcyLjNWNTcxSDYxNi4wOHoiIGZpbGw9IiNEODAwMjciLz4KCQk8cGF0aCBkPSJNNDc5Ljk4LDUyNS41YzQ5LjQsMCw4OS42LTQwLjIsODkuNi04OS42MDFjMC00OS4zOTktNDAuMTk5LTg5LjYtODkuNi04OS42cy04OS42LDQwLjItODkuNiw4OS42ICAgIEMzOTAuMzgxLDQ4NS4zLDQzMC41OCw1MjUuNSw0NzkuOTgsNTI1LjV6IiBmaWxsPSIjRDgwMDI3Ii8+CgkJPHBhdGggZD0iTTMzNC43OCw5MTUuMzk5YzQ1LjksMTkuNCw5NC42MDEsMjkuMiwxNDQuNywyOS4yYzUwLjIsMCw5OC45LTkuOCwxNDQuNy0yOS4yYzQwLjg5OS0xNy4zLDc3Ljg5OS00MS41LDExMC4yLTcxLjg5OSAgICBjMi42OTktMi41LDUuMzk5LTUuMTAxLDgtNy43YzIxLjE5OS0yMS4yLDM5LjYtNDQuNyw1NS03MGM5LjMtMTUuNSwxNy42LTMxLjUsMjQuNi00OC4yYzE5LjQtNDUuODk5LDI5LjItOTQuNiwyOS4yLTE0NC43ICAgIGMwLTUwLjEtOS44LTk4Ljg5OS0yOS4yLTE0NC42OTljLTIuNi02LjItNS40LTEyLjQtOC40LTE4LjRjLTE4LTM2LjktNDEuODk5LTcwLjQtNzEuMy05OS44Yy0xOC4zLTE4LjMtMzguMy0zNC41LTU5LjctNDguNSAgICBjLTE4LjUtMTIuMS0zOC0yMi41LTU4LjUtMzEuMmMtNDUuODk5LTE5LjQtOTQuNi0yOS4yLTE0NC42OTktMjkuMmMtNTAuMiwwLTk4LjksOS44LTE0NC43LDI5LjJjLTIwLjEwMSw4LjUtMzkuMywxOC43LTU3LjUsMzAuNSAgICBjLTIxLjgsMTQuMS00Mi4xLDMwLjUtNjAuNyw0OS4xYy0yOS4zLDI5LjMtNTMuMiw2Mi44LTcxLjMsOTkuOGMtMi45LDYtNS44LDEyLjE5OS04LjQsMTguMzk5Yy0xOS40LDQ1LjktMjkuMiw5NC42MDEtMjkuMiwxNDQuNyAgICBzOS44LDk4LjksMjkuMiwxNDQuN2MxOC43LDQ0LjMsNDUuNSw4NCw3OS43LDExOC4yQzI1MC42ODEsODY5LjgsMjkwLjQ4LDg5Ni42LDMzNC43OCw5MTUuMzk5eiBNMjcxLjE4MSw0MDkuN2MyLTIuNSw0LTUsNi4xLTcuNCAgICBjNC44LTUuNyw5LjgtMTEuMiwxNS4yLTE2LjVjNTAtNTAsMTE2LjQtNzcuNSwxODcuMS03Ny41YzcwLjcsMCwxMzcuMTAxLDI3LjUsMTg3LDc3LjVjNS43LDUuNywxMS4xMDEsMTEuNiwxNi4yLDE3LjcgICAgYzEuNywyLjEsMy40LDQuMSw1LjEwMSw2LjNjMzYuNSw0Ni40LDU2LjE5OSwxMDMuMiw1Ni4xOTksMTYzLjFjMCw3MC43LTI3LjUsMTM3LjEwMS03Ny41LDE4Ny4xMDFzLTExNi4zOTksNzcuNS0xODcsNzcuNSAgICBjLTcwLjYsMC0xMzcuMS0yNy41LTE4Ny03Ny41Yy01MC01MC03Ny41LTExNi40LTc3LjUtMTg3LjEwMUMyMTQuOTgsNTEyLjg5OSwyMzQuNzgsNDU2LjEsMjcxLjE4MSw0MDkuN3oiIGZpbGw9IiNEODAwMjciLz4KCTwvZz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K" />
							<p class="intext">(1.)員工查詢自己各年度時數額度及每筆假單資訊</p>
							<p class="intext">(2.)主管查詢所有員工各年度時數額度及每筆假單資訊</p>
							<br> <br>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">
								<i class="fa fa-times"></i> Close
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="portfolio-modal modal fade" id="portfolioModal3"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="modal-body">
							<h2>修改密碼</h2>
							<hr class="star-primary">
							<img
								src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTguMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDIxOC4wNjMgMjE4LjA2MyIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgMjE4LjA2MyAyMTguMDYzOyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgd2lkdGg9IjI1NnB4IiBoZWlnaHQ9IjI1NnB4Ij4KPHBhdGggZD0iTTIxNS44NjYsMTcwLjgxNWwtMjMuNTA3LTIzLjUwN2MtMC4wMTctMC4wMTctMC4wMy0wLjAzNi0wLjA0Ny0wLjA1M3MtMC4wMzYtMC4wMy0wLjA1Mi0wLjA0OGwtMzYuNTg1LTM2LjU4NCAgbDYwLjE2MS02MC4xNjFjMi45MjktMi45MjksMi45MjktNy42NzgsMC4wMDEtMTAuNjA2TDE3OC4yMDksMi4yMTljLTEuNDA3LTEuNDA2LTMuMzE0LTIuMTk3LTUuMzA0LTIuMTk3aDAgIGMtMC4yNDksMC0wLjQ5NiwwLjAxMi0wLjc0MSwwLjAzN2MtMS43MTcsMC4xNy0zLjMzMSwwLjkyOS00LjU2MiwyLjE1OWwtMzcuNjMxLDM3LjYyOWMtMC4wMDUsMC4wMDUtMC4wMDgsMC4wMS0wLjAxMywwLjAxNSAgTDEwNy40Myw2Mi4zODlMOTQuMzU3LDQ5LjMxNWMtMC4wMDItMC4wMDItMC4wMDMtMC4wMDMtMC4wMDUtMC4wMDVjLTAuMDAyLTAuMDAyLTAuMDAzLTAuMDAzLTAuMDA1LTAuMDA1TDcwLjg2LDI1LjgxNyAgYy0wLjAyMi0wLjAyMy0wLjA0LTAuMDQ3LTAuMDYzLTAuMDY5Yy0wLjAyMi0wLjAyMi0wLjA0Ni0wLjA0LTAuMDY4LTAuMDYyTDQ3LjI0MywyLjE5OGMtMS40MDYtMS40MDctMy4zMTQtMi4xOTctNS4zMDMtMi4xOTcgIHMtMy44OTcsMC43OS01LjMwNCwyLjE5N0wyLjE5NywzNi42NDRjLTIuOTI5LDIuOTI5LTIuOTI4LDcuNjc4LDAsMTAuNjA2bDYwLjE4Niw2MC4xODVMMi4xOTcsMTY3LjYyICBDMC43OSwxNjkuMDI4LDAsMTcwLjkzNSwwLDE3Mi45MjR2MzcuNjM4YzAsMS45ODksMC43OSwzLjg5NywyLjE5Nyw1LjMwNGMxLjQwNywxLjQwNiwzLjMxNSwyLjE5Niw1LjMwNCwyLjE5NmwzNy42MzUtMC4wMDcgIGMxLjk4OSwwLDMuODk1LTAuNzksNS4zMDItMi4xOTZsNjAuMTgxLTYwLjE4Mmw2MC4xODksNjAuMTg4YzEuNDY0LDEuNDY0LDMuMzg0LDIuMTk2LDUuMzAzLDIuMTk2YzEuOTE5LDAsMy44MzgtMC43MzIsNS4zMDMtMi4xOTYgIGwzNC40NTEtMzQuNDQzYzEuNDA3LTEuNDA2LDIuMTk3LTMuMzE0LDIuMTk3LTUuMzA0QzIxOC4wNjMsMTc0LjEyOSwyMTcuMjczLDE3Mi4yMjIsMjE1Ljg2NiwxNzAuODE1eiBNMTcyLjg5OCw3Mi4xOCAgTDE0NS44OCw0NS4xNTNsMjcuMDIzLTI3LjAyM2wyNy4wMjEsMjcuMDI4TDE3Mi44OTgsNzIuMTh6IE0xOC4xMDcsNDEuOTQ2TDQxLjk0LDE4LjEwOWwxMi45NDUsMTIuOTQ2bC0xMS45MiwxMS45MjMgIGMtMi45MjgsMi45My0yLjkyOCw3LjY3OSwwLjAwMSwxMC42MDZjMS40NjUsMS40NjUsMy4zODMsMi4xOTYsNS4zMDMsMi4xOTZjMS45MTksMCwzLjg0LTAuNzMyLDUuMzA0LTIuMTk3bDExLjkxOC0xMS45MjEgIGwxMi45NSwxMi45NUw2MS45NzgsNzEuMDc1Yy0yLjkyOSwyLjkyOS0yLjkyOSw3LjY3OCwwLDEwLjYwN2MxLjQ2NCwxLjQ2NSwzLjM4NCwyLjE5Nyw1LjMwMywyLjE5NyAgYzEuOTE5LDAsMy44MzktMC43MzIsNS4zMDMtMi4xOTZMODkuMDQ5LDY1LjIybDcuNzc1LDcuNzc0TDcyLjk5MSw5Ni44MjhMMTguMTA3LDQxLjk0NnogTTQyLjAyOCwyMDMuMDU2TDE1LDIwMy4wNjF2LTI3LjAzICBMMTM1LjI3Myw1NS43NTlsMjcuMDIxLDI3LjAzTDQyLjAyOCwyMDMuMDU2eiBNMTc2LjExMiwxOTkuOTU1bC01NC44ODUtNTQuODg1bDIzLjg0LTIzLjg0MWw3Ljc3Niw3Ljc3NmwtMTYuNDY3LDE2LjQ2NyAgYy0yLjkyOSwyLjkzLTIuOTI5LDcuNjc4LDAsMTAuNjA3YzEuNDY0LDEuNDY0LDMuMzg0LDIuMTk2LDUuMzAzLDIuMTk2YzEuOTE5LDAsMy44MzktMC43MzIsNS4zMDMtMi4xOTZsMTYuNDY3LTE2LjQ2NyAgbDEyLjk0OSwxMi45NDhsLTExLjkxOSwxMS45MmMtMi45MjksMi45MjktMi45MjksNy42NzgsMCwxMC42MDZjMS40NjQsMS40NjQsMy4zODQsMi4xOTYsNS4zMDMsMi4xOTYgIGMxLjkxOSwwLDMuODM5LTAuNzMyLDUuMzAzLTIuMTk3bDExLjkxOS0xMS45MTlsMTIuOTUsMTIuOTQ5TDE3Ni4xMTIsMTk5Ljk1NXoiIGZpbGw9IiM5MURDNUEiLz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPC9zdmc+Cg==" />
							<p class="intext" style="text-align: center; color: blue">就是修改密碼啊！！</p>
							<br> <br>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">
								<i class="fa fa-times"></i> Close
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="portfolio-modal modal fade" id="portfolioModal5"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="modal-body">
							<h2>審核假單</h2>
							<hr class="star-primary">
							<img
								src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjI1NnB4IiBoZWlnaHQ9IjI1NnB4IiB2aWV3Qm94PSIwIDAgNDIyLjA3NCA0MjIuMDczIiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCA0MjIuMDc0IDQyMi4wNzM7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4KPGc+Cgk8Zz4KCQk8Zz4KCQkJPHBhdGggZD0iTTIyOS4wMDEsMzkyLjcyOUg0NC41MjJWMjcuMjc0aDE5OC45MDdWODIuNjljMCw1LjYsNC41MzQsMTAuMTMzLDEwLjEzMSwxMC4xMzNoNTMuNzkxbDAuMDA5LDE4MS41NjQgICAgIGM5LjQxOCwwLjIxNSwxOC42MDIsMS45NjMsMjcuMjY2LDUuMTg4Vjc3Ljc0M2MwLTIuMTY4LTAuODYzLTQuMjQ4LTIuMzk2LTUuNzg3TDI2Mi42NjcsMi4zOTUgICAgIEMyNjEuMTMzLDAuODYyLDI1OS4wNTMsMCwyNTYuODgxLDBINDEuNzk2QzI4LjI2MiwwLDE3LjI1LDExLjAwOCwxNy4yNSwyNC41NDN2MzcwLjkxNWMwLDEzLjUzMywxMS4wMTIsMjQuNTQzLDI0LjU0NywyNC41NDMgICAgIGgyMDYuOTczQzI0MC40NjYsNDEyLjM4NCwyMzMuNzE0LDQwMy4xMTQsMjI5LjAwMSwzOTIuNzI5eiIgZmlsbD0iI2YwOWMwMCIvPgoJCQk8cGF0aCBkPSJNNDA0LjgyNCwzMTEuNjQ4YzAtNC41ODYtMS43ODUtOC44OTYtNS4wMjctMTIuMTQybC0xMi44NDQtMTIuODQ0Yy0zLjI0NC0zLjI0Mi03LjU1NS01LjAyNy0xMi4xMzktNS4wMjcgICAgIGMtNC41ODIsMC04Ljg5NiwxLjc4NS0xMi4xNDEsNS4wMjlsLTE5LjYwMiwxOS42Yy0xMC40Ny03LjUwNi0yMy4zMDQtMTEuOTI4LTM3LjE2OC0xMS45MjggICAgIGMtMzUuMjczLDAtNjMuODY3LDI4LjU5Ni02My44NjcsNjMuODY5YzAsMzUuMjcxLDI4LjU5NCw2My44NjcsNjMuODY3LDYzLjg2N2MzNS4yNzEsMCw2My44NjctMjguNTk3LDYzLjg2Ny02My44NjcgICAgIGMwLTEuNDMtMC4wNTEtMi44NDgtMC4xNDUtNC4yNTRsMzAuMTY2LTMwLjE2NkM0MDMuMDM5LDMyMC41NDYsNDA0LjgyNCwzMTYuMjMyLDQwNC44MjQsMzExLjY0OHogTTM4NS44NTcsMzE1LjQ2NyAgICAgbC02MS40Myw2MS40MjhjLTEuMjk1LDEuMjk2LTMuMDUxLDIuMDIxLTQuODgxLDIuMDIxaC0wLjAwMmMtMS44MzIsMC0zLjU4OC0wLjcyOS00Ljg4MS0yLjAyM2wtMjguNDY1LTI4LjUxICAgICBjLTIuNjkxLTIuNjkzLTIuNjg5LTcuMDYyLDAuMDAyLTkuNzU4bDUuNDgzLTUuNDc5YzIuNjktMi42OTMsNy4wNTgtMi42OTUsOS43NTUtMC4wMDdsMTguMTA0LDE4LjA1OGw1MS4wMTktNTEuMDIxICAgICBjMS4yOTYtMS4yOTYsMy4wNTItMi4wMjEsNC44ODItMi4wMjFzMy41ODYsMC43MjcsNC44ODEsMi4wMjFsNS41MzEsNS41M0MzODguNTUyLDMwOC40LDM4OC41NTIsMzEyLjc3LDM4NS44NTcsMzE1LjQ2N3oiIGZpbGw9IiNmMDljMDAiLz4KCQkJPHBhdGggZD0iTTE4OC4xNDEsMTA4Ljk1MWwtNTcuNDM4LDEzLjE0OGwxMy4xNDktNTcuNDM4Yy0yMC4xMjUtNS4wNDctNDIuMzE5LDAuMjk2LTU4LjA1OSwxNi4wMzUgICAgIGMtMjMuODM1LDIzLjgzNC0yMy44MzUsNjIuNDc4LDAsODYuMzEyYzIzLjgzNSwyMy44MzUsNjIuNDc4LDIzLjgzNSw4Ni4zMTMsMEMxODcuODQzLDE1MS4yNjksMTkzLjE4NywxMjkuMDc1LDE4OC4xNDEsMTA4Ljk1MXogICAgICIgZmlsbD0iI2YwOWMwMCIvPgoJCQk8cGF0aCBkPSJNMTg4LjY4OSw2NC4xMTNjLTguMDk3LTguMDk2LTE3LjkwMS0xMy40MzktMjguMjU0LTE2LjAzNWwtMTMuMTQ5LDU3LjQzN2w1Ny40MzgtMTMuMTQ5ICAgICBDMjAyLjEyOCw4Mi4wMTQsMTk2Ljc4NSw3Mi4yMDksMTg4LjY4OSw2NC4xMTN6IiBmaWxsPSIjZjA5YzAwIi8+CgkJCTxnPgoJCQkJPHBhdGggZD0iTTg5LjE2MSwyNDkuOTQ1aDIwLjk5M2M1LjgxMywwLDEwLjU0Mi00LjcyOSwxMC41NDItMTAuNTQzYzAtNS44MTQtNC43MjktMTAuNTQzLTEwLjU0Mi0xMC41NDNIODkuMTYxICAgICAgYy01LjgxMywwLTEwLjU0Myw0LjcyOS0xMC41NDMsMTAuNTQzQzc4LjYxOCwyNDUuMjE2LDgzLjM0OCwyNDkuOTQ1LDg5LjE2MSwyNDkuOTQ1eiIgZmlsbD0iI2YwOWMwMCIvPgoJCQkJPHBhdGggZD0iTTE3MC4xNTMsMjY3Ljg1OUg4OS4xNjFjLTUuODEzLDAtMTAuNTQzLDQuNzI5LTEwLjU0MywxMC41NDNjMCw1LjgxMyw0LjcyOSwxMC41NDMsMTAuNTQzLDEwLjU0M2g4MC45OTMgICAgICBjNS44MTMsMCwxMC41NDItNC43MjksMTAuNTQyLTEwLjU0M0MxODAuNjk1LDI3Mi41ODgsMTc1Ljk2NiwyNjcuODU5LDE3MC4xNTMsMjY3Ljg1OXoiIGZpbGw9IiNmMDljMDAiLz4KCQkJCTxwYXRoIGQ9Ik0xNTguMTUzLDMwNi44NTlIODkuMTYxYy01LjgxMywwLTEwLjU0Myw0LjcyOS0xMC41NDMsMTAuNTQzYzAsNS44MTMsNC43MjksMTAuNTQzLDEwLjU0MywxMC41NDNoNjguOTkzICAgICAgYzUuODEzLDAsMTAuNTQyLTQuNzI5LDEwLjU0Mi0xMC41NDNDMTY4LjY5NSwzMTEuNTg4LDE2My45NjYsMzA2Ljg1OSwxNTguMTUzLDMwNi44NTl6IiBmaWxsPSIjZjA5YzAwIi8+CgkJCTwvZz4KCQk8L2c+Cgk8L2c+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPC9zdmc+Cg==" />
							<p class="intext">(1.)主管審核員工假單審核完成後電子郵件通知員工</p>
							<p class="intext">(2.)假單狀態為審核中：員工送出假單,等待主管審核</p>
							<p class="intext">(3.)假單為通過：經主管審核無誤後通過,允許員工請假</p>
							<p class="intext">(4.)假單狀態為退回：主管因某些原因不允許員工請假,主管可以在附註欄位中做備註</p>
							<br> <br>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">
								<i class="fa fa-times"></i> Close
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="portfolio-modal modal fade" id="portfolioModal4"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="modal-body">
							<h2>設定時數</h2>
							<hr class="star-primary">
							<img
								src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTcuMS4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDIzMS4yMzMgMjMxLjIzMyIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgMjMxLjIzMyAyMzEuMjMzOyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgd2lkdGg9IjI1NnB4IiBoZWlnaHQ9IjI1NnB4Ij4KPHBhdGggZD0iTTIzMC41MDUsMTAyLjc4Yy0wLjM2NS0zLjI1LTQuMTU2LTUuNjk1LTcuNDM0LTUuNjk1Yy0xMC41OTQsMC0xOS45OTYtNi4yMTgtMjMuOTM5LTE1Ljg0MiAgYy00LjAyNS05Ljg1NS0xLjQyOC0yMS4zNDYsNi40NjUtMjguNTg3YzIuNDg2LTIuMjczLDIuNzg5LTYuMDc5LDAuNzA1LTguNzIxYy01LjQyNC02Ljg4Ni0xMS41ODYtMTMuMTA3LTE4LjMxNi0xOC40OTggIGMtMi42MzMtMi4xMTItNi41MDItMS44MTgtOC43ODcsMC43MTFjLTYuODkxLDcuNjMyLTE5LjI3LDEwLjQ2OC0yOC44MzYsNi40NzdjLTkuOTUxLTQuMTg3LTE2LjIzMi0xNC4yNzQtMTUuNjE1LTI1LjEwMSAgYzAuMjAzLTMuNDAzLTIuMjg1LTYuMzYtNS42NzYtNi43NTVjLTguNjM3LTEtMTcuMzUtMS4wMjktMjYuMDEyLTAuMDY4Yy0zLjM0OCwwLjM3LTUuODM0LDMuMjU3LTUuNzIzLDYuNjE3ICBjMC4zNzUsMTAuNzIxLTUuOTc3LDIwLjYzLTE1LjgzMiwyNC42NjdjLTkuNDUxLDMuODYxLTIxLjc0NCwxLjA0Ni0yOC42MjEtNi41MTljLTIuMjczLTIuNDkyLTYuMDc0LTIuNzk4LTguNzI1LTAuNzMxICBjLTYuOTI4LDUuNDM3LTEzLjIyOSwxMS42NjItMTguNzAzLDE4LjQ5MmMtMi4xMzMsMi42NTUtMS44MTgsNi41MDMsMC42ODksOC43ODRjOC4wNDksNy4yODksMTAuNjQ0LDE4Ljg3OSw2LjQ2NSwyOC44NDkgIGMtMy45OSw5LjUwNS0xMy44NTksMTUuNjI4LTI1LjE1NiwxNS42MjhjLTMuNjY2LTAuMTE4LTYuMjc1LDIuMzQ1LTYuNjgsNS42NzljLTEuMDE2LDguNjgzLTEuMDI3LDE3LjUzNS0wLjA0OSwyNi4yODkgIGMwLjM2NSwzLjI2NCw0LjI2OCw1LjY4OCw3LjU4Miw1LjY4OGMxMC4wNy0wLjI1NiwxOS43MzIsNS45NzQsMjMuNzkxLDE1Ljg0MWM0LjAzOSw5Ljg1NSwxLjQzOSwyMS4zNDEtNi40NjcsMjguNTkyICBjLTIuNDczLDIuMjczLTIuNzg5LDYuMDctMC43MDEsOC43MDljNS4zNjksNi44NDMsMTEuNTM3LDEzLjA2OCwxOC4yODcsMTguNTA1YzIuNjUsMi4xMzQsNi41MDQsMS44MzUsOC44MDEtMC42OTcgIGM2LjkxOC03LjY1LDE5LjI5NS0xMC40ODEsMjguODIyLTYuNDgyYzkuOTgsNC4xNzYsMTYuMjU4LDE0LjI2MiwxNS42NDUsMjUuMDkyYy0wLjIwMSwzLjQwMywyLjI5Myw2LjM2OSw1LjY3Miw2Ljc1NSAgYzQuNDIsMC41MTcsOC44NjMsMC43NzMsMTMuMzIsMC43NzNjNC4yMywwLDguNDYxLTAuMjMxLDEyLjY5Mi0wLjcwMmMzLjM1Mi0wLjM3LDUuODM0LTMuMjYsNS43MjEtNi42MjEgIGMtMC4zODctMTAuNzE2LDUuOTc5LTIwLjYyNiwxNS44MjItMjQuNjU1YzkuNTE0LTMuODg2LDIxLjc1Mi0xLjA0MiwyOC42MzMsNi41MTJjMi4yODUsMi40ODcsNi4wNjMsMi43ODksOC43MjUsMC43MyAgYzYuOTE2LTUuNDIzLDEzLjIwNS0xMS42NDUsMTguNzAzLTE4LjQ5M2MyLjEzNS0yLjY1LDEuODMyLTYuNTAzLTAuNjg5LTguNzg4Yy04LjA0Ny03LjI4NC0xMC42NTYtMTguODc5LTYuNDc3LTI4LjgzOSAgYzMuOTI4LTkuMzc3LDEzLjQzLTE1LjY3MywyMy42NS0xNS42NzNsMS40MywwLjAzOGMzLjMxOCwwLjI2OSw2LjM2Ny0yLjI4Niw2Ljc2OC01LjY3MSAgQzIzMS40NzYsMTIwLjM3OSwyMzEuNDg3LDExMS41MzcsMjMwLjUwNSwxMDIuNzh6IE0xMTUuNjE2LDE4Mi4yN2MtMzYuODEzLDAtNjYuNjU0LTI5Ljg0MS02Ni42NTQtNjYuNjUzICBzMjkuODQyLTY2LjY1Myw2Ni42NTQtNjYuNjUzczY2LjY1NCwyOS44NDEsNjYuNjU0LDY2LjY1M2MwLDEyLjQ5NS0zLjQ0NSwyNC4xODItOS40MjgsMzQuMTc2bC0yOS4xODYtMjkuMTg3ICBjMi4xMTMtNC45ODIsMy4yMjktMTAuMzgzLDMuMjI4LTE1Ljk1N2MwLTEwLjkxNS00LjI1MS0yMS4xNzYtMTEuOTctMjguODkzYy03LjcxNy03LjcxNy0xNy45NzgtMTEuOTY3LTI4Ljg5MS0xMS45NjcgIGMtMy42NDIsMC03LjI2NywwLjQ4NC0xMC43NzQsMS40MzljLTEuNTM2LDAuNDE5LTIuNzkyLDEuNjg1LTMuMjAxLDMuMjI0Yy0wLjQxOCwxLjU3NCwwLjA1MywzLjE4NywxLjI4Myw0LjQxOCAgYzAsMCwxNC40MDksMTQuNTIsMTkuMjMsMTkuMzRjMC41MDUsMC41MDUsMC41MDQsMS43MSwwLjQzMywyLjE0NGwtMC4wNDUsMC4zMTdjLTAuNDg2LDUuMy0xLjQyMywxMS42NjItMi4xOTYsMTQuMTA3ICBjLTAuMTA0LDAuMTAzLTAuMjAyLDAuMTktMC4zMDgsMC4yOTZjLTAuMTExLDAuMTExLTAuMjEzLDAuMjE4LTAuMzIsMC4zMjhjLTIuNDc3LDAuNzk1LTguOTM3LDEuNzQzLTE0LjMyMSwyLjIyNWwwLjAwMS0wLjAyOSAgbC0wLjI0MiwwLjA2MWMtMC4wNDMsMC4wMDUtMC4xMjMsMC4wMTEtMC4yMjksMC4wMTFjLTAuNTgyLDAtMS40MzgtMC4xNjMtMi4yMTYtMC45NGMtNS4wMTgtNS4wMTgtMTguODYyLTE4Ljc2My0xOC44NjItMTguNzYzICBjLTEuMjQyLTEuMjM4LTIuNTE2LTEuNDk4LTMuMzY1LTEuNDk4Yy0xLjk3OSwwLTMuNzUxLDEuNDMtNC4zMDksMy40ODFjLTMuODExLDE0LjEwMywwLjIyOSwyOS4yNzMsMTAuNTQ2LDM5LjU5MSAgYzcuNzE5LDcuNzE4LDE3Ljk4MSwxMS45NjgsMjguODk2LDExLjk2OGM1LjU3NCwwLDEwLjk3NS0xLjExNSwxNS45NTYtMy4yMjhsMjkuNTAzLDI5LjUwMyAgQzE0MS4xMjUsMTc4LjQxMiwxMjguODI1LDE4Mi4yNywxMTUuNjE2LDE4Mi4yN3oiIGZpbGw9IiMwMDZERjAiLz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPC9zdmc+Cg==" />
							<p class="intext">(1.)主管新增新年度所有員工各假別時數</p>
							<p class="intext">(2.)主管修改員工所有員工各年度各假別總時數</p>
							<br> <br>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">
								<i class="fa fa-times"></i> Close
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="portfolio-modal modal fade" id="portfolioModal6"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="modal-body">
							<h2>匯出價單</h2>
							<hr class="star-primary">
							<img
								src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTguMS4xLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDE2IDE2IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAxNiAxNjsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSIyNTZweCIgaGVpZ2h0PSIyNTZweCI+CjxnPgoJPHBvbHlnb24gcG9pbnRzPSIxMiwxMi41IDIsMTIuNSAyLDUuNSA0LjI1LDUuNSA2Ljc1LDMuNSAwLDMuNSAwLDE0LjUgMTQsMTQuNSAxNCw4LjkgMTIsMTAuNSAgIiBmaWxsPSIjZDY2ZmMzIi8+Cgk8cGF0aCBkPSJNMy45NjcsMTAuNTIzYzEuNjk0LTEuNjUsMy43LTMuMTM1LDcuMDMzLTMuMDE2VjkuNWw1LTRsLTUtNHYxLjk3NyAgIEM3LjQ2LDMuNTEyLDMuOTY3LDYuNjAxLDMuOTY3LDEwLjUyM3oiIGZpbGw9IiNkNjZmYzMiLz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K" />
							<p class="intext" style="text-align: center; color: blue">
								主管將所有員工各年度各假別時數匯出為EXCEL檔案</p>

							<button type="button" class="btn btn-default"
								data-dismiss="modal">
								<i class="fa fa-times"></i> Close
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>







	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="js/classie.js"></script>
	<script src="js/cbpAnimatedHeader.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/freelancer.js"></script>

</body>

</html>
