<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>請假系統-更改密碼</title>


</head>



<body>
<%
if(session.getAttribute("Employee")==null)
{
	response.sendRedirect("index.jsp?Login=1#Login");	

}


if(request.getParameter("status")!=null)
{
 int status=Integer.parseInt(request.getParameter("status"));
 
 if(status==1)
 {
	 %>
<script>
sweetAlert("請重新輸入", "所輸入的新密碼不一致喔!!", "error");
</script>	 

<%
 }
 else if(status==2)
 {
	 %>
	 <script>
	 sweetAlert("請重新輸入", "舊密碼和新密碼不可以一樣喔!!", "error");
	 </script>	 

	 <% 
 }
 else if(status==3)
 {
	 %>
	 <script>
	 sweetAlert("請重新輸入", "舊密碼輸入錯誤!!", "error");
	 </script>	 

	 <% 
 }
 else 
 {
	 %>
	 <script>
	 sweetAlert("發生錯誤", "請重新輸入!!", "error");
	
	 </script>	 

	 <% 
 }
}
	

%>
	<div id="wrapper">

		<jsp:include page="Home.jsp">
			<jsp:param name="status" value="changepwd" />
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
						<h1><img src="img/PDW.png"></h1>

						<form method="post" action="ChangepwdServlet" name="form1" >
							<table class="mytable" align="center" border="0" width="50%">
								<tr><td><p align="center">
								<br>
									輸入舊密碼:&nbsp;&nbsp;
									<input type="password" name="oldpwd" 
										required>
								<br>
								<br>
							
									輸入新密碼:&nbsp;&nbsp;
							<input type="password" id="pwd" name="newpwd"  style="width:220px"
										maxlength="12" size="14"
										pattern="(?=^[a-z0-9]{6,12}$)((?=.*[a-z])(?=.*[0-9]))^.*$"
										placeholder="6~12英數字組合" required>
							<br>
							<br>
								
								重新輸入密碼:
								<input type="password"  name="checkpwd" style="width:100"
										required>
								<br>
							
							<br> <button class="btn btn-primary" type="submit">
								<img src="img/paper-plane.png">&nbsp;更新</button>
								</p></td></tr>
								</table>
						</form>
						<h2>&nbsp;</h2>

						<script>
							function check() {
								with (document.all) {
									
									if (pwd.value == pwd2.value) {
										alert("舊密碼與新密碼不可以相同!")
										pwd.value = "";
										pwd2.value = "";
										pwd3.value = "";
									}

									if (pwd2.value != pwd3.value) {
										alert("所輸入的密碼不一致喔 請重新輸入")
										pwd2.value = "";
										pwd3.value = "";
									} else {
										document.forms[0].submit();

									}
									
									
									
								}
							}
						</script>





						<br>
						<p>&nbsp;</p>
					
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


</body>

</html>
