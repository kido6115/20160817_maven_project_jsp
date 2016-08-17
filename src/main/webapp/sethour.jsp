<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,java.util.ArrayList,java.util.Date"%>
<%@ page import="java.lang.*"%>
<%@ page import="Bean.UseLeft"%>
<%@ page import="Bean.SearchHour"%>
<%@  page import="Db.JDBCPSEsearch"%>
<%@  page import="Db.JDBCSetHour"%>
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
<script src="js/jquery.js"></script>
<script src="js/myJS.js"></script>
<script src="js/sethourJS.js"></script>

<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
<title>請假系統-設定時數</title>


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
						
						<% Date sysdate = new Date();
						   JDBCSetHour db2 = new JDBCSetHour();
						int nowdate= sysdate.getYear()+1901;
						if (db2.MaxYear()<nowdate){%>  
						
						<form name="form3" method="post" action="AddNextYearServlet">
						<input style="float: right" class="btn btn-warning" type="submit" onclick="alert('新增成功')"
								name="button" id="button" value="新增下年度時數" 
								>
						</form>
						 <%}%> 
						<form name="form1" method="post" action="SetHourServlet" class="fontstyle">
						<table align="center" border="0" width="80%"><tr><td><table align="center"><tr><td>

							
						
							<p>
								年度:<label for="year" ></label> 
                             <select name="year" id="year">
                                  <%JDBCPSEsearch db= new JDBCPSEsearch();
									for (int i = 0; i < db.getYear().size(); i++) {
								%>
								<%if(db.getYear().get(i).getYear().equals(request.getAttribute("Year"))){ %>
							    <option selected="selected" value="<%=db.getYear().get(i).getYear()%>"><%=db.getYear().get(i).getYear()%></option>
							    <%}else{ %>
					            <option  value="<%=db.getYear().get(i).getYear()%>"><%=db.getYear().get(i).getYear()%></option>
					            <%} %>
							    
								
								<%
									}
								%> 
								
                             </select>
							</p>
							<p>
								員工編號:<label for="userid"></label> 
								 <%
								if(request.getAttribute("Eid")==null){
							%>
							<input pattern="[A-Z]{1}[0-9]{3}" title="111" type="text" name="Eid" id="Eid" value="">
							<%
								} else {
							%>
							<input pattern="[A-Z]{1}[0-9]{3}" title="111" type="text" name="Eid" id="Eid"
								value="<%=request.getAttribute("Eid")%>">
							<%
								}
							%>
								
							</p>
							
							<p>
								員工姓名:<label for="username"></label> 
								<%
								if(request.getAttribute("Name")==null){
							%>
							<input type="text" name="Name" id="Name" value="">
							<%
								} else {
							%>
							<input type="text" name="Name" id="Name"
								value="<%=request.getAttribute("Name")%>">
							<%
								}
							%>
							</p>
							
							</td></tr></table ></td><td>&nbsp;</td>
							<td><table align="center"><tr><td>
							<p>
								假別 :&nbsp;
								<%
								if(request.getAttribute("Sick")==null){
							%>
							<input type="checkbox" name="sick"  id="sick"  value="2"> 病假
							<%
								} else {
							%>
							<input checked type="checkbox" name="sick"  id="sick"  value="2"> 病假
							<%
								}
							%>
							
							<%
								if(request.getAttribute("Death")==null){
							%>
							<input type="checkbox" name="death" id="death" value="3"> 喪假 
							<%
								} else {
							%>
							<input checked type="checkbox" name="death" id="death" value="3"> 喪假 
							<%
								}
							%>
							
							<%
								if(request.getAttribute("Birth")==null){
							%>
							<input type="checkbox" name="birth" id="birth" value="4"> 產假 
							<%
								} else {
							%>
							<input checked type="checkbox" name="birth" id="birth" value="4"> 產假 
							<%
								}
							%>
							
							<%
								if(request.getAttribute("Spe")==null){
							%>
							<input type="checkbox" name="spe"   id="spe"   value="5"> 特休 <br>
							<%
								} else {
							%>
							<input checked type="checkbox" name="spe"   id="spe"   value="5"> 特休 <br>
							<%
								}
							%>
							
							
								
							
								
							</p>
							<br>
							<p>
								<button class="btn btn-primary" type="submit" name="search"
									id="search" ><img src="img/interface.png">查詢</button>
							</p>
                          </td></tr></table></td></tr></table>
						</form>
						<h2>&nbsp;</h2>
						<br>
			<%  if(request.getAttribute("SearchList")!=null){%>
			<% ArrayList<SearchHour> list = (ArrayList<SearchHour>) request.getAttribute("SearchList");%>
			<%if(list.size()!=0){ %>			
<form name="form2" method="post" class="fontstyle" action="sethourconfirm.jsp">


 
<td>
							<table class="CSSTableGenerator" border="1">
								<tr>
									<td><div align="center">年度</div></td>
									<td><div align="center">員工編號</div></td>
									<td><div align="center">姓名</div></td>
									<td><div align="center">假別</div></td>
									<td><div align="center">本年度額度</div></td>
									<td><div align="center">已請時數</div></td>
									<td><div align="center">待審核時數</div></td>
									<td><div align="center">修改額度</div></td> 
								</tr>
								
							
	
				   
					
					
			

       
        
		
               			<%// print the information about every category of the list
               				String z="0",x="0",Class="";
               				ArrayList<UseLeft> use = (ArrayList<UseLeft>) request.getAttribute("SearchListUse");
               				ArrayList<UseLeft> left = (ArrayList<UseLeft>) request.getAttribute("SearchListLeft");

               				
               				//print use
               				for(SearchHour searchhour : list) {
               					if(request.getAttribute("SearchListUse")!=null){
               						for(UseLeft useleft : use){
               							if(searchhour.getEid().equals(useleft.getEid())){
               								if(searchhour.getKname().equals(useleft.getKname())){
               									z=useleft.getTotal();
               									break;
               								}
               							
               							}else{
               								z="0";
               							}
               							
               						}
               						
               					}
               					//print left
               					
                   					if(request.getAttribute("SearchListLeft")!=null){
                   						for(UseLeft useleft : left){
                   							if(searchhour.getEid().equals(useleft.getEid())){
                   								if(searchhour.getKname().equals(useleft.getKname())){
                   									x=useleft.getTotal();
                   									break;
                   								}
                   							
                   							}else{
                   								x="0";
                   							}
                   							
                   						}
                   						
                   					};
               		%>
		<tr>
			<td name="uyear"><div id ="1" value = "2"  ><%out.println(searchhour.getYear());%></div></td>
		    <td name="ueid" value="<% out.println(searchhour.getEid());%>"><%out.println(searchhour.getEid());%></td>
		    <td name="uname"><%out.println(searchhour.getName());%></td>
		    <td name="ukname"><%out.println(searchhour.getKname());%></td>
		    <td name="ucredit"><%out.println(searchhour.getCredit());%></td>
		    <%if(searchhour.getKname().equals("病假")){Class="2";} %>
		    <%if(searchhour.getKname().equals("喪假")){Class="3";} %>
		    <%if(searchhour.getKname().equals("產假")){Class="4";} %>
		    <%if(searchhour.getKname().equals("特休")){Class="5";} %>
		    <td name="usetime"><div class="<%=Class%>"><%out.println(z);%></div></td>
		    <td name="lefttime"><div class="<%=Class%>"><%out.println(x);%></div></td>
		   <%float a = Float.valueOf(z); 
		     float b = Float.valueOf(x); %>
		   
		   <td ><input class="<%=Class%>" name = "ucredit" style="width:130px"" type="number" min="0"  step="0.5" value="" ></td>
          
		
		    
		    
		    
	   </tr>
		    				
							<% 
		}
	}
			}
				
	%>
								
							</table>
							</td>
							
						
							
							
									<%  if(request.getAttribute("SearchList")!=null){%>
						
						  
							<p>
							<p>※請在「修改額度」欄位輸入新設定之額度，不欲設定者請保留空白即可。</p>
								<button class="btn btn-primary" type="submit" name="submit"
									id="submit"><img src="img/paper-plane.png">&nbsp;送出</button>
								
			<%} %>
									
							</form>
							
							<br>
						
							
							
							
						
						<br>
						</p>
						<p>&nbsp;</p>
						
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	

	

</body>

</html>
