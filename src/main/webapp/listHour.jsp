<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@ page import="Db.conSetHor"%> 

<%

Class.forName("oracle.jdbc.driver.OracleDriver").newInstance(); 


String url="jdbc:oracle:thin:@localhost:1521:xe"; 

//orcl為你的資料庫的SID 
int i= 0;
String user="PSE"; 

String password="PSE"; 

Connection conn= DriverManager.getConnection(url,user,password); 

Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
Statement stmt2=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

String Name="";
String Year=request.getParameter("year");
String Eid=request.getParameter("userid");
 Name=request.getParameter("username");
String sick=request.getParameter("checkbox1");
String dead=request.getParameter("checkbox2");
String spe=request.getParameter("checkbox3");
String birth=request.getParameter("checkbox4");
String Search="";
if(Year==null){
	Year="";
}else{
	Year=" AND a.YEAR='"+Year+"'";}
if(Eid==null){
	Eid="";
}else if(Eid==""){
	Eid="";
}else{
	Eid=" AND b.EID='"+Eid+"'";
}
if(Name==null){
	Name="";
}else if(Name==""){
	Name="";
}else{
	Name=" AND b.NAME='"+Name+"'";
}
if(sick==null){
	sick="";
}else{
	sick=" AND (  a.KID='"+sick+"'";
	i++;
             
}
if(spe==null){
	spe="";
}else{
	if(i==0){
	spe=" AND ( a.KID='"+spe+"'";
	i++;
	}else{
		spe=" OR a.KID='"+spe+"'";
	}
}
if(birth==null){
	birth="";
}else{
	if(i==0){
	birth=" AND ( a.KID='"+birth+"'";
	i++;
	}else{
		birth=" OR a.KID='"+birth+"'";
	}
}
if(dead==null){
	dead="";
}else{
	if(i==0){
	dead=" AND ( a.KID='"+dead+"'";
	i++;
	}else{
		dead=" OR a.KID='"+dead+"'";
	}
}
if(i>0){
	 Search = Year+Eid+Name+sick+spe+birth+dead+")";
}else{
	 Search = Year+Eid+Name+sick+spe+birth+dead;
}



out.println(Search);

 String sql="select a.year,a.eid, b.name,a.kid,a.credit from hours a,employee b where a.eid=b.eid"+Search; 

 ResultSet rs=stmt.executeQuery(sql); 

 String con[]=new String[3];

%>


  <% while(rs.next()) {%> 



<tr>
									<td><%=rs.getString("year")%> </td>
									<td><%=rs.getString("eid")%> </td>
									<td><%=rs.getString("name")%></td>
									<td><%=rs.getString("kid")%> </td>
									<td><%=rs.getString("credit")%> </td>
									<%con[0]=rs.getString("year");
									  con[1]=rs.getString("eid");
									  con[2]=rs.getString("kid");
									  conSetHor db = new conSetHor();
									  String value=db.compute(con[1],con[2]);%>
									<td><%out.println(value); %></td>
									
									
									
									
									

</tr>

<%}%> 


 
 </table>

 
<%rs.close(); 

stmt.close(); 

conn.close(); 

%>  
