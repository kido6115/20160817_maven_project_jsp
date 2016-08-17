<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,java.util.ArrayList"%>
<%@ page import="Bean.UseLeft"%>
<%@ page import="Bean.SearchHour"%>
<%@  page import="Db.JDBCPSEsearch"%>
<%@  page import="Bean.Hours"%>
<%@  page import="Bean.SearchPSE"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>請假系統-設定時數確認</title>


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
			<jsp:param name="status" value="sethour" />
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
						<h1><img src="img/sethour.png"></h1>
						<form name="form2" method="post" class="fontstyle" action="SubmitHourServlet">



							<table class="CSSTableGenerator" border="1">
								<tr>
									<td><div align="center">年度</div></td>
									<td><div align="center">員工編號</div></td>
									<td><div align="center">姓名</div></td>
									<td><div align="center">假別</div></td>
									<td><div align="center">本年度額度</div></td>
									<!-- <td><div align="center">剩餘額度</div></td> -->
									<td><div align="center">新額度</div></td>
								</tr>
								
								   <%  
								   String[] ucredit=request.getParameterValues("ucredit");
								   session.setAttribute("Ucredit",ucredit);
								   
								   int k=0;
								   if(session.getAttribute("ViewList")!=null){
					ArrayList<SearchHour> list = (ArrayList<SearchHour>) session.getAttribute("ViewList");%>
			

       
        
		
               			<%// print the information about every category of the list
               			
               			

               				
               				
               				for(SearchHour searchhour : list) {
               					
               					
               		%>
		<tr>
			<td name="uyear"><%out.println(searchhour.getYear());%></td>
		    <td ><div name="ueid"><%out.println(searchhour.getEid());%></div></td>
		    <td name="uname"><%out.println(searchhour.getName());%></td>
		    <td name="ukname"><%out.println(searchhour.getKname());%></td>
		    <td name="ucredit"><%out.println(searchhour.getCredit());%></td>
		    <td ><%out.println(ucredit[k]);
		    k++;%></td>
		   
		    
		    
		    
		    
	   </tr>
		    <% 
		}
	}
	%>
								
							</table>
							<br>
							<p>※請確認「新額度」欄位之值是否正確。</p>
							<p>
								<input class="btn btn-primary" type="submit" name="confirm"
									id="confirm" value="確認" > <input
									type="button" class="btn btn-primary" name="confirm"
									id="cancel" value="取消"
									onclick="history.back()">
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

	

</body>

</html>
