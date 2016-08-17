<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/simple-sidebar.css" rel="stylesheet">
<link href="css/tableCss.css" rel="stylesheet">
<link href="css/myCss.css" rel="stylesheet">
<script src="js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/sweetalert.css">

<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<div id="sidebar-wrapper">
	<%
		String status = request.getParameter("status");

		if (session.getAttribute("Employee") == null) {
			response.sendRedirect("/#Login");
		}
		if (session.getAttribute("Identity") == null) {
			response.sendRedirect("/#Login");
		} else {

			int identity = Integer
					.parseInt((session.getAttribute("JOB_ID")).toString());
			int DEP = Integer.parseInt((session.getAttribute("Identity"))
					.toString());

			if (identity == 2 && DEP == 1) { //部門經理 &&人資
	%>
	<ul class="sidebar-nav">
		<li class="sidebar-brand"><a href="index2Servlet"> 請假系統 </a></li>

		<li id="manage"><a href="#">&nbsp;&nbsp;假單管理</a></li>
		<li id=""><a href="addPSE.jsp">&nbsp;&nbsp;&nbsp;-新增假單 <%
			if (status.equals("addPSE")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>

		</a></li>
		<li id=""><a href="editServlet1">&nbsp;&nbsp;&nbsp;-修改/刪除假單<%
			if (status.equals("editPSE")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href=hoursearchServlet1>&nbsp;&nbsp;查詢時數<%
			if (status.equals("PSEsearch_m")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="PSEsearchServlet">&nbsp;&nbsp;查詢假單<%
			if (status.equals("PSEsearch")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="changepwd.jsp">&nbsp;&nbsp;修改密碼<%
			if (status.equals("changepwd")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>

		<li><a href="checkPSE.jsp">&nbsp;&nbsp;審核假單<%
			if (status.equals("checkPSE")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>

		<li><a href="applychange.jsp">&nbsp;&nbsp;調職申請<%
			if (status.equals("applychange")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="hr.jsp">&nbsp;&nbsp;人事管理<%
			if (status.equals("hr")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="checkApply.jsp">&nbsp;&nbsp;審核調職申請<%
			if (status.equals("checkApply")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="sethour.jsp">&nbsp;&nbsp;設定時數<%
			if (status.equals("sethour")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>

	</ul>
	<%
		}else if (identity == 2) { //部門經理
	%>
	<ul class="sidebar-nav">
		<li class="sidebar-brand"><a href="index2Servlet"> 請假系統 </a></li>

		<li id="manage"><a href="#">&nbsp;&nbsp;假單管理</a></li>
		<li id=""><a href="addPSE.jsp">&nbsp;&nbsp;&nbsp;-新增假單 <%
			if (status.equals("addPSE")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>

		</a></li>
		<li id=""><a href="editServlet1">&nbsp;&nbsp;&nbsp;-修改/刪除假單<%
			if (status.equals("editPSE")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href=hoursearchServlet1>&nbsp;&nbsp;查詢時數<%
			if (status.equals("PSEsearch_m")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="PSEsearchServlet">&nbsp;&nbsp;查詢假單<%
			if (status.equals("PSEsearch")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="changepwd.jsp">&nbsp;&nbsp;修改密碼<%
			if (status.equals("changepwd")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>

		<li><a href="checkPSE.jsp">&nbsp;&nbsp;審核假單<%
			if (status.equals("checkPSE")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>

		<li><a href="applychange.jsp">&nbsp;&nbsp;調職申請<%
			if (status.equals("applychange")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>

	</ul>
	<%
		} else if (identity == 3) {//總經理
	%>
	<ul class="sidebar-nav">
		<li class="sidebar-brand"><a href="index2Servlet"> 請假系統 </a></li>

		<li id="manage"><a href="#">&nbsp;&nbsp;假單管理</a></li>
		<li id=""><a href="addPSE.jsp">&nbsp;&nbsp;&nbsp;-新增假單 <%
			if (status.equals("addPSE")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>

		</a></li>
		<li id=""><a href="editServlet1">&nbsp;&nbsp;&nbsp;-修改/刪除假單<%
			if (status.equals("editPSE")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href=hoursearchServlet1>&nbsp;&nbsp;查詢時數<%
			if (status.equals("PSEsearch_m")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="PSEsearchServlet">&nbsp;&nbsp;查詢假單<%
			if (status.equals("PSEsearch")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="changepwd.jsp">&nbsp;&nbsp;修改密碼<%
			if (status.equals("changepwd")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>





	</ul>
	<%
		} else if (DEP == 1) {//人資
	%>
	<ul class="sidebar-nav">
		<li class="sidebar-brand"><a href="index2Servlet"> 請假系統 </a></li>

		<li id="manage"><a href="#">&nbsp;&nbsp;假單管理</a></li>
		<li id=""><a href="addPSE.jsp">&nbsp;&nbsp;&nbsp;-新增假單 <%
			if (status.equals("addPSE")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>

		</a></li>
		<li id=""><a href="editServlet1">&nbsp;&nbsp;&nbsp;-修改/刪除假單<%
			if (status.equals("editPSE")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href=hoursearchServlete>&nbsp;&nbsp;查詢時數<%
			if (status.equals("PSEsearch_m")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="PSEsearch_eServlet">&nbsp;&nbsp;查詢假單<%
			if (status.equals("PSEsearch")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="changepwd.jsp">&nbsp;&nbsp;修改密碼<%
			if (status.equals("changepwd")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="applychange.jsp">&nbsp;&nbsp;調職申請<%
			if (status.equals("applychange")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="hr.jsp">&nbsp;&nbsp;人事管理<%
			if (status.equals("hr")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="checkApply.jsp">&nbsp;&nbsp;審核調職申請<%
			if (status.equals("checkApply")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="sethour.jsp">&nbsp;&nbsp;設定時數<%
			if (status.equals("sethour")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>

	</ul>
	<%
		} else {
	%>
	<ul class="sidebar-nav">
		<li class="sidebar-brand"><a href="index2Servlet"> 請假系統 </a></li>

		<li id="manage"><a href="#">&nbsp;&nbsp;假單管理</a></li>
		<li id=""><a href="addPSE.jsp">&nbsp;&nbsp;&nbsp;-新增假單 <%
			if (status.equals("addPSE")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>

		</a></li>
		<li id=""><a href="editServlet1">&nbsp;&nbsp;&nbsp;-修改/刪除假單<%
			if (status.equals("editPSE")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href=hoursearchServlete>&nbsp;&nbsp;查詢時數<%
			if (status.equals("PSEsearch_m")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="PSEsearch_eServlet">&nbsp;&nbsp;查詢假單<%
			if (status.equals("PSEsearch")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="changepwd.jsp">&nbsp;&nbsp;修改密碼<%
			if (status.equals("changepwd")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>
		<li><a href="applychange.jsp">&nbsp;&nbsp;調職申請<%
			if (status.equals("applychange")) {
		%><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>
				<%
					}
				%>
		</a></li>




	</ul>
	<%
		}
		}
	%>

	<img class="img-responsive" src="img/profile.png" alt=""
		style="position: absolute; bottom: 0%; right: 10%; width: 80%;">

</div>

<div id="page-content-wrapper" style="background-color: #C1FFE4">
	<jsp:include page="Logout.jsp">
		<jsp:param name="" value="" />

	</jsp:include>
	<div class="container-fluid">
		<div class="row"></div>
	</div>
</div>


<script src="js/jquery.js"></script>

<script src="js/bootstrap.min.js"></script>
<script src="js/myJS.js"></script>

<!-- Menu Toggle Script -->
<script>
	$("#menu-toggle").click(function(e) {
		$("#wrapper").toggleClass("toggled");
	});

	$("#menu-toggle2").click(function(e) {
		$("#wrapper").toggleClass("toggled");
	});
</script>


