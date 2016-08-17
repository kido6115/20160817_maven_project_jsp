<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List,java.util.ArrayList"%>
<%@ page import="Bean.SearchHour_m"%>
<%@ page import="Bean.Hours"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
<title>請假系統-調職申請</title>
</head>
<body>
<%
if(session.getAttribute("Employee")==null)
{
	response.sendRedirect("index.jsp?Login=1#Login");	

}
if(request.getParameter("status")!=null){
	
	int status=Integer.parseInt(request.getParameter("status"));
	
	if(status==4){
		 %>
		 <script>
		 sweetAlert("提出申請", "您已提出調職申請，近期將開會決定!!", "success");
		 </script>	 

		 <%
	
	}else {
		
			 %>
			 <script>
			 sweetAlert("錯誤", "請正確填寫,欄位不得為空白!!", "error");
			 </script>	 

			 <%
		
		
	}
	}
	%>
	


<div id="wrapper">

	<jsp:include page="Home.jsp">
<jsp:param name="status" value="applychange" />
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
				<h1><img src="img/apply.png"></h1>

				<form name="form2" action="applychange_Servlet" method="post"
				
					class="fontstyle">

					<table border="0" align="center" width="60%"><tr><td><table align="center"><tr><td>
											
										<label for="textfield3">員工姓名:</label>
										<%=(String) session.getAttribute("Name")%>
								<br>
								<br>
									
								
								<label for="textfield4">員工編號:</label>
									<%=(String) session.getAttribute("Employee")%>
							
										<br>
										<br>
										
					
				原部門:
				<%=session.getAttribute("DEP")%><input type="hidden" name="dep_old" value="<%=session.getAttribute("Identity")%>">
					<br>
					<br>
					原職稱: <%=session.getAttribute("JOB")%><input type="hidden" name="job_old" value="<%=session.getAttribute("JOB_ID")%>">
					<br>
					<br>
					
					</td></tr></table></td>
					
					
					<td><table align="center"><tr><td>
					
				請調部門: <select name="apartment" size="1"
								id="time">
								
								<option value="1">HR部門</option>
								<option value="2">SALE部門</option>
								<option value="3">IT部門</option>
								<option value="4">FINANCE部門</option>
								<option value="5">MARKETING部門</option>

							</select>&nbsp; &nbsp;
					<br>
					<br>
					
					
					請調職位:&nbsp;<select name="identity" size="1" id="time">
								
								<option value="4">專員</option>
								<option value="2">部門經理</option>
								<option value="1">助理</option>

							</select>&nbsp; &nbsp;
					<br>
					<br>
					
					請調原因:
					<br>
					
										
										<textarea name="ps" id="ps" cols="40"
												rows="2" id="ps"></textarea>
									
					
				<br>
				<br>
				
				
								</td></tr></table></td></tr>
								
								
								
								
							</table>
							<p align="center"><button class="btn btn-primary" type="submit"
								onClick="return switchAndSubmit()"><img src="img/paper-plane.png">&nbsp;提交</button> </p>
						</form>
<h2></h2>

						<script language="javascript">
							function switchAndSubmit() {
								var formObj = document.form2;

								formObj.action = "applychange_Servlet";
								formObj.submit();
								return false;
							}
							
						</script>
					<br>



			
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
