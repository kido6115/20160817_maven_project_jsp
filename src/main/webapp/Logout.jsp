<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#img1 {
	vertical-align: middle;
}

#img2 {
	vertical-align: middle;
}

 img.top {vertical-align:middle}

</style>
<%
	String status = request.getParameter("status");

	if (session.getAttribute("Employee") == null) {
		response.sendRedirect("/#Login");

	} else {
%>
<div id="header" style="background-color: #AFEEEE">
	<img class="img-responsive" src="img/logo2.png" alt="" id="img1"
		style="float: left; bottom: 0%; right: 10%; width: 15%;"> 
		<img
		class="img-responsive" src="img/word.png" alt="" id="img2"
		style="float: left; bottom: 0%; right: 10%; width: 15%;">
		
		<font
		style="float: right; top: 80%; bottom: 20%; left: 30%; width: 30%;"
		size="5px;"><%if(session.getAttribute("DEP")!=null){out.print(session.getAttribute("DEP")+"-");}%><%=session.getAttribute("JOB")%>&nbsp;,&nbsp;<%=session.getAttribute("Name")%>&nbsp;你好,&nbsp;<a
		href="index.jsp?Logout=1" style="color: orange">登出</a></font>

 
 

 
 
 
</div>

<%
	}
%>
