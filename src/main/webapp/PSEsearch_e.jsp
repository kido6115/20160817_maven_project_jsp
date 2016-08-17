<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@  page import="java.util.*"%>
<%@  page import="java.util.Date"%>
<%@  page import="Db.JDBCPSEsearch"%>
<%@  page import="Bean.Hours"%>
<%@  page import="Bean.SearchPSE"%>


<%@  page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script type="text/javascript" language="javascript"
	src="js/searchHour.js"></script>
<title>請假系統-查詢假單</title>


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
						<h1>
							<img src="img/searchPSE.png">
						</h1>

						<form name="form1" class="fontstyle" method="post">
							<table border="0" width="80%" align="center">
								<tr>
									<td><table align="center">
											<tr>
												<td><input type="hidden" name="Eid"
													value="<%=session.getAttribute("Employee")%>">
													請假開始時間&nbsp;:&nbsp;<input type="date" name="sdate"
													value="<%=request.getAttribute("sdate")%>">&nbsp; <br>
													<br> 請假結束時間&nbsp;:&nbsp;<input type="date"
													name="edate" value="<%=request.getAttribute("edate")%>">
													<br> <br>

													<button class="btn btn-primary" type="submit"
														onClick="return switchAndSubmit()">
														<img src="img/interface.png">查詢
													</button></td>
											</tr>
										</table></td>

									<td><table>
											<tr>
												<td>假別: &nbsp; <%
 	int k0=0;
        							int k1=0;
        							int k2=0;
        							int k3=0;
        							int k4=0;

        							if(request.getAttribute("Kind0")==null){
        								 k0=99;
        							}else {
        								 k0=Integer.parseInt((String)request.getAttribute("Kind0"));

        							}
        							if(request.getAttribute("Kind1")==null){
        								 k1=99;
        							}else {
        								 k1=Integer.parseInt((String)request.getAttribute("Kind1"));

        							}
        							if(request.getAttribute("Kind2")==null){
        								 k2=99;
        							}else {
        								 k2=Integer.parseInt((String)request.getAttribute("Kind2"));

        							}
        							if(request.getAttribute("Kind3")==null){
        								 k3=99;
        							}else {
        								 k3=Integer.parseInt((String)request.getAttribute("Kind3"));

        							}
        							if(request.getAttribute("Kind4")==null){
        								 k4=99;
        							}else {
        							 k4=Integer.parseInt((String)request.getAttribute("Kind4"));

        							}
        							
        							
        							
         	if(k0==1){
 %> <input type="checkbox" name="type" value="1" checked>事假 <%
 	}else {
 %> <input type="checkbox" name="type" value="1">事假 <%
 	}
          							if(k0==2 ||k1==2){
 %> <input type="checkbox" name="type" value="2" checked>病假 <%
 	}else {
 %> <input type="checkbox" name="type" value="2">病假 <%
 	}
          							if(k0==3 || k1==3 || k2==3){
 %> <input type="checkbox" name="type" value="3" checked>喪假 <%
 	}else {
 %> <input type="checkbox" name="type" value="3">喪假 <%
 	}
          							
          							if(k0==4 || k1==4 || k2==4 || k3==4){
 %> <input type="checkbox" name="type" value="4" checked>產假 <%
 	}else {
 %> <input type="checkbox" name="type" value="4">產假 <%
 	}
          							
          							
         if(k0==5 || k1==5 || k2==5 || k3==5 || k4==5){
 %> <input type="checkbox" name="type" value="5" checked>特休 <%
 	}else {
 %> <input type="checkbox" name="type" value="5">特休 <%
 	}
 %> <br> <br> 假單狀態: &nbsp; <%
 	int s0=0;
       							int s1=0;
       							int s2=0;
       							if(request.getAttribute("Status0")==null){
       		 								 s0=99;
       		 							}else {
       		 								 s0=Integer.parseInt((String)request.getAttribute("Status0"));

       		 							}
       		 							if(request.getAttribute("Status1")==null){
       		 								 s1=99;
       		 							}else {
       		 								 s1=Integer.parseInt((String)request.getAttribute("Status1"));

       		 							}
       		 							if(request.getAttribute("Status2")==null){
       		 								 s2=99;
       		 							}else {
       		 								 s2=Integer.parseInt((String)request.getAttribute("Status2"));

       		 							}
       		 							
       		 							
       		 							
       		 						  	if(s0==1){
 %> <input type="checkbox" name="status" value="1" checked>通過 <%
 	}else {
 %> <input type="checkbox" name="status" value="1">通過 <%
 	}
       		 						   							if(s0==2 ||s1==2){
 %> <input type="checkbox" name="status" value="2" checked>退回 <%
 	}else {
 %> <input type="checkbox" name="status" value="2">退回 <%
 	}
       		 						   							if(s0==3 || s1==3 || s2==3){
 %> <input type="checkbox" name="status" value="3" checked>待審核 <%
 	}else {
 %> <input type="checkbox" name="status" value="3">待審核 <%
 	}
 %> <br> <br>




													
														
														<button class="btn btn-warning" id="excel" type="submit"
															onClick="return switchAndSubmit2()"><img src="img/download.png">&nbsp;匯出</button>
												</td>
											</tr>
										</table align="center"></td>
								</tr>
							</table>
						</form>
						<h2></h2>

						<script language="javascript">
							function switchAndSubmit() {
								var formObj = document.form1;

								formObj.action = "PSEsearch_eServlet";
								formObj.submit();
								return false;
							}
							function switchAndSubmit2() {
								var formObj = document.form1;

								formObj.action = "exportServlet_E";
								formObj.submit();
								return false;
							}
						</script>



						<br>

						<form name="form4" method="post" class="fontstyle">

							<table class="CSSTableGenerator" border="1">


								<tr>
									<td>年度</td>
									<td>員工編號</td>
									<td>員工姓名</td>

									<td>假單編號</td>
									<td>假單種類</td>
									<td>開始時間</td>
									<td>結束時間</td>
									<td>假單狀態</td>

								</tr>



								<%
									if(request.getAttribute("SearchList")!=null){
																																																															if(request.getAttribute("SearchList").equals("ohno")==false){

																																																															ArrayList<SearchPSE> list = (ArrayList<SearchPSE>) request.getAttribute("SearchList");
								%>

								<%
									for(SearchPSE searchPSE : list) {
								%>



								<tr>
									<td><%=searchPSE.getapplytime()%></td>
									<td><%=searchPSE.geteid()%></td>
									<td><%=searchPSE.getname()%></td>
									<td><%=searchPSE.getpid()%></td>
									<td><%=searchPSE.getkname()%></td>
									<td><%=searchPSE.getstarttime()%></td>
									<td><%=searchPSE.getendtime()%></td>
									<td><%=searchPSE.getsname()%></td>

								</tr>

								<%
									}
																																												}else{
								%>


								<tr>
									<td colspan="8">查無資料</td>
								</tr>
								<%
									}
								%>


							</table>

						</form>





						<%
							}
						%>








						<br> <br> 
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
					$(this).html("-");
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
