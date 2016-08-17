<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@  page import="java.util.*"%>
<%@  page import="java.util.Date"%>
<%@ page import="Bean.*"%>
<%@ page import="java.util.*,java.text.*" %>
<%@  page import="Db.*"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="js/sweetalert.min.js"></script>
<title>請假系統-修改假單</title>
</head>

<body>

<%
String Eid = (String) session.getAttribute("Employee");
JDBCIndex2 db = new JDBCIndex2();
List<RemainHour> credit = db.getcredit(Eid);
Float[] remain = db.takeoff(Eid);
Float[] pend = db.pending(Eid);
JDBCAddPSE db2=new JDBCAddPSE(); 

ArrayList<Holiday> list2=(ArrayList<Holiday>)db2.getHolidays();
%>
<%
		if(session.getAttribute("echeck")!=null) {			
			
		if (((String)session.getAttribute("echeck")).equals("1")){
	%>
	<script>
sweetAlert('請假時間已請!!!');
</script>
	<%
		session.setAttribute("echeck","");}
			}
	%>

	<div id="wrapper">

		<jsp:include page="Home.jsp">
			<jsp:param name="status" value="editPSE" />
		</jsp:include>

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1>修改假單</h1>
						<p></p>
						<div id="form">
						
						<%
								for (int i = 0; i < 4; i++) {
							%>
							<input type="hidden" id="kl<%=i%>"
								value="<%=credit.get(i).getremainHour()-remain[i+1]%>">
							<%
								}
							%>
						<form action="editCheckServlet" method="post" >
							<table class="CSSTableGenerator" border="1">
								<tbody>
								
								
								<% ArrayList<view_sub> showed = (ArrayList<view_sub>) request.getAttribute("PIDs");%>
									<tr>
										<td colspan="2" scope="col"><label for="textfield3">姓名
												:</label></td>
										<td colspan="3" scope="col"><%=session.getAttribute("Name")%></td>
									</tr>
									<tr>
										<td colspan="2" scope="row"><label for="textfield4">員工編號:</label></td>
										<td colspan="3"><%=session.getAttribute("Employee")%></td>
									</tr>
									<tr>
										<td colspan="2" scope="row"><label for="textfield4">假單編號:</label></td>
										<td colspan="3"><%=session.getAttribute("PID")%></td>
									</tr> 
									<tr>
										<td colspan="2">各假別剩餘額度(待審核)</td>
										<td colspan="3">
											<%
												for (int i = 0; i < db.remainHour(Eid).size(); i++) {
											%> <%=db.remainHour(Eid).get(i).getkname()%>:<%=credit.get(i).getremainHour()-remain[i+1]%>(<%=pend[i+1]%>)
											| <%
 	}
 %>
										</td>

									</tr>
									
									<%int i=1;
									
								for(view_sub edit : showed){
									
									
								%>
									<tr>
										<td rowspan="5" scope="row"><p>子假單<%=edit.getPcid()%></p>
											<p>
												<button class="btn btn-sm btn-danger">X</button>
											</p></td>
										<td scope="row">假別</td>
										<td colspan="3">
										<input type="radio" name="pk<%=i%>" id="radio" value="1" <%if(Integer.parseInt(edit.getKid())==1){%> checked <%} %> > 事假 
											<input type="radio" name="pk<%=i%>" id="radio2" value="2" <%if(Integer.parseInt(edit.getKid())==2){%> checked <%} %> >	病假 
											<input type="radio" name="pk<%=i%>" id="radio4" value="3" <%if(Integer.parseInt(edit.getKid())==3){%> checked <%} %> > 喪假
											 <input type="radio" name="pk<%=i%>" id="radio5" value="4" <%if(Integer.parseInt(edit.getKid())==4){%> checked <%} %> > 產假
											  <input type="radio" name="pk<%=i%>" id="radio3" value="5" <%if(Integer.parseInt(edit.getKid())==5){%> checked <%} %> > 特休
											
											</td>
									</tr>
									<tr>
									
									<%
										
										  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
									
										       //  利用 DateFormat 來parse 日期的字串
										         DateFormat df = DateFormat.getDateInstance();
										        Date date = df.parse(edit.getStartDate());
										        Date datee = df.parse(edit.getEndDate());
										        Calendar calendars = Calendar.getInstance();
										        calendars.setTime(date);
										        Calendar calendare = Calendar.getInstance();
										        calendare.setTime(datee);
										       //  直接格式化輸出現在時間的方法
									        SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-mm-dd");
										
										%>
										<td scope="row">假別起始日期:</td>
										
										<td><input type="date" id="date_s<%=i%>" name="date_s<%=i%>" value="<%=sdf.format(calendars.getTime())%>" required onchange="setMin(<%=i%>)"></td>
										<td>假別起始時間:</td>
										<td>
										<select name="time_s<%=i%>" id="time_s<%=i%>" onchange="countt(<%=i%>)">
												<option <%if(edit.getStartTime().equals("09:00")){%> selected <%} %> >9:00</option>
												<option <%if(edit.getStartTime().equals("09:30")){%> selected <%} %> >9:30</option>
												<option <%if(edit.getStartTime().equals("10:00")){%> selected <%} %> >10:00</option>
												<option <%if(edit.getStartTime().equals("10:30")){%> selected <%} %> >10:30</option>
												<option <%if(edit.getStartTime().equals("11:00")){%> selected <%} %> >11:00</option>
												<option <%if(edit.getStartTime().equals("11:30")){%> selected <%} %> >11:30</option>
												<option <%if(edit.getStartTime().equals("12:00")){%> selected <%} %> >12:00</option>
												<option <%if(edit.getStartTime().equals("13:00")){%> selected <%} %> >13:00</option>
												<option <%if(edit.getStartTime().equals("13:30")){%> selected <%} %> >13:30</option>
												<option <%if(edit.getStartTime().equals("14:00")){%> selected <%} %> >14:00</option>
												<option <%if(edit.getStartTime().equals("14:30")){%> selected <%} %> >14:30</option>
												<option <%if(edit.getStartTime().equals("15:00")){%> selected <%} %> >15:00</option>
												<option <%if(edit.getStartTime().equals("15:30")){%> selected <%} %> >15:30</option>
												<option <%if(edit.getStartTime().equals("16:00")){%> selected <%} %> >16:00</option>
												<option <%if(edit.getStartTime().equals("16:30")){%> selected <%} %> >16:30</option>
												<option <%if(edit.getStartTime().equals("17:00")){%> selected <%} %> >17:00</option>
												<option <%if(edit.getStartTime().equals("17:30")){%> selected <%} %> >17:30</option>
												<option <%if(edit.getStartTime().equals("18:00")){%> selected <%} %> >18:00</option>
										</select></td>
									</tr>
									<tr>
										<td scope="row">假別結束日期:</td>
										<td>
										
										<input type="date" id="date_e<%=i%>" name="date_e<%=i%>" value="<%=sdf.format(calendare.getTime())%>" required onchange="setMax(<%=i%>)"></td>
										<td>假別結束時間:</td>
										<td>
										<select  name="time_e<%=i%>" id="time_e<%=i%>" onchange="countt(<%=i%>)">
												<option <%if(edit.getEndTime().equals("09:00")){%> selected <%} %> >9:00</option>
												<option <%if(edit.getEndTime().equals("09:30")){%> selected <%} %> >9:30</option>
												<option <%if(edit.getEndTime().equals("10:00")){%> selected <%} %> >10:00</option>
												<option <%if(edit.getEndTime().equals("10:30")){%> selected <%} %> >10:30</option>
												<option <%if(edit.getEndTime().equals("11:00")){%> selected <%} %> >11:00</option>
												<option <%if(edit.getEndTime().equals("11:30")){%> selected <%} %> >11:30</option>
												<option <%if(edit.getEndTime().equals("12:00")){%> selected <%} %> >12:00</option>
												<option <%if(edit.getEndTime().equals("13:00")){%> selected <%} %> >13:00</option>
												<option <%if(edit.getEndTime().equals("13:30")){%> selected <%} %> >13:30</option>
												<option <%if(edit.getEndTime().equals("14:00")){%> selected <%} %> >14:00</option>
												<option <%if(edit.getEndTime().equals("14:30")){%> selected <%} %> >14:30</option>
												<option <%if(edit.getEndTime().equals("15:00")){%> selected <%} %> >15:00</option>
												<option <%if(edit.getEndTime().equals("15:30")){%> selected <%} %> >15:30</option>
												<option <%if(edit.getEndTime().equals("16:00")){%> selected <%} %> >16:00</option>
												<option <%if(edit.getEndTime().equals("16:30")){%> selected <%} %> >16:30</option>
												<option <%if(edit.getEndTime().equals("17:00")){%> selected <%} %> >17:00</option>
												<option <%if(edit.getEndTime().equals("17:30")){%> selected <%} %> >17:30</option>
												<option <%if(edit.getEndTime().equals("18:00")){%> selected <%} %> >18:00</option>
										</select></td>
									</tr>
									<tr>
										<td scope="row">請假時數:</td>
										<td colspan="3"><input type="text" name="tot<%=i%>"
											id="tot<%=i%>" value="<%=edit.getPctatol()%>"></td>
									</tr>
									<tr>
										<td scope="row">備註</td>
										<td colspan="3"><textarea name="ps<%=i%>" cols="40"
												rows="2" id="ps<%=i%>"><%if(edit.getPS()==null){%>無<%} else{%><%=edit.getPS()%><%}%></textarea></td>

									</tr>
									
									<% i++;} %>
                                               
								</tbody>
							</table>
<input type='hidden' name='count' id='count' value='<%=i%>'>

							<p>&nbsp;</p>
							<p>
								<input class="btn btn-primary" type="submit" name="submit"
									id="submit" value="送出"	>
								<input class="btn btn-primary" type="button" name="button"
									id="button" value="返回" onclick="history.back();">

							</p>
							<p>&nbsp;</p>
							<p>&nbsp;</p>
							<p>
							<p></p>
							</form>
						</div>

						<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">縮放</a>
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
	var alps=new Array();
	var alpe=new Array();
	
	var cou = $("#count").val();
	console.log(cou);
 	for(var k=1;k<cou;k++)
		{
		holi(k);
		count(k);
		}  

	
	
	function setMin(l){
		 var d1= document.getElementById('date_s'+l).value;
		  $("#date_e"+l).attr({ "min":d1 ,}); 
		  countt(l);
				 
	}
	function setMax(y){
		 var e1= document.getElementById('date_e'+y).value;
		  $("#date_s"+y).attr({ "max":e1 ,});
		  countt(y);
	}
	function countt(x){
		 var ds =document.getElementById('date_s'+x).value;
		 var de =document.getElementById('date_e'+x).value;
		 var ts =document.getElementById('time_s'+x).value;
		 var te =document.getElementById('time_e'+x).value;
		 
		if(ds!=null&&ds!=null&&ts!='請選擇'&&te!='請選擇')
			count(x);
		
	};
	function count(j){
						
		//開始日期
			var ds=$("#date_s"+j).val();
			
			//結束日期
			var de=$("#date_e"+j).val();
			
			//開始時間
			var str="#time_s";
			str=str+j+" :selected";
			var ts=$(str).val();
			
			
			//結束時間
			str="#time_e";
			str=str+j+" :selected";
			var te=$(str).val();
			
			ds=ds.split('-');
			ts=ts.split(':');
			de=de.split('-');
			te=te.split(':');
			
			var s = new Date(ds[0],ds[1],ds[2],ts[0],ts[1]);
			var e = new Date(de[0],de[1],de[2],te[0],te[1]); 
			alps[j]=s;
			alpe[j]=e;
			
			var pd = (de[0]-ds[0])*365+(de[1]-ds[1])*30+(de[2]-ds[2]);
			var bh = pd *16;
			var rh = 0;
			if(ts[0]<=12&&te[0]>=13)
				rh=1;
			if(pd>0&&ts[0]>= 13 &&te[0]<= 12)
				rh=-1;
							
			var ONE_HOUR = 1000 * 60 * 60;  // 1小時的毫秒數
			var ONE_MIN = 1000 * 60; // 1分鐘的毫秒數


			var diff = e-s;
			var leftHours = Math.floor(diff/ONE_HOUR)-bh -rh;
			if(leftHours >=0) diff = diff - ((leftHours+bh+rh) * ONE_HOUR);

			var leftMins = Math.floor(diff/ONE_MIN);
			if(leftMins > 0) diff = diff - (leftMins * ONE_MIN);
								
			if(leftMins==30)
				leftMins=0.5; 
			var tot =leftHours+leftMins;
			
			
		if(tot>0) 
			$("#tot"+j).val(tot); 
			else if(tot==0)
		    $("#tot"+j).val('請假時數為零');	
			else if(tot<0)
			$("#tot"+j).val('請假時數為負');	 
			else
			$("#tot"+j).val('時間尚未輸入完整');
		    
	}
	
	function holi(h){
		var d = document.getElementById('date_s'+h);

		function holiday(e){
			var mon;
			var datee;
		  // Days in JS range from 0-6 where 0 is Sunday and 6 is Saturday
		  if((new Date(e.target.value).getMonth()+1)<10){
			   mon='0'+(new Date(e.target.value).getMonth()+1);
		  }else {
			  mon=(new Date(e.target.value).getMonth()+1);
		  }
		  if((new Date(e.target.value).getDate())<10){
			  datee='0'+(new Date(e.target.value).getDate());
		  }else {
			  datee=(new Date(e.target.value).getDate());
		  }
		  var day = (new Date(e.target.value).getFullYear())+'-'+mon+'-'+datee;
		  
		  <%for(Holiday holiday:list2){%>
			  if ( day == '<%=holiday.geth_date()%>'){
				  sweetAlert('當天為<%=holiday.geth_name()%>,不可請假');
				  document.getElementById('date_s'+h).value="";

			    e.target.setCustomValidity('不可選擇假日！');
			  } else {
			    e.target.setCustomValidity('');
			  }
			  <%}%>
		  
		}

		d.addEventListener('input',holiday);
		
		
		
		var d2 = document.getElementById('date_e'+h);

		function holiday2(e){
			var mon;
			var datee;
		  // Days in JS range from 0-6 where 0 is Sunday and 6 is Saturday
		  if((new Date(e.target.value).getMonth()+1)<10){
			   mon='0'+(new Date(e.target.value).getMonth()+1);
		  }else {
			  mon=(new Date(e.target.value).getMonth()+1);
		  }
		  if((new Date(e.target.value).getDate())<10){
			  datee='0'+(new Date(e.target.value).getDate());
		  }else {
			  datee=(new Date(e.target.value).getDate());
		  }
		  var day = (new Date(e.target.value).getFullYear())+'-'+mon+'-'+datee;
		  
		  <%for(Holiday holiday:list2){%>
			  if ( day == '<%=holiday.geth_date()%>') {
				  sweetAlert('當天為<%=holiday.geth_name()%>,不可請假');
				  document.getElementById('date_e'+h).value="";

			    e.target.setCustomValidity('不可選擇假日！');
			  } else {
			    e.target.setCustomValidity('');
			  }
			  <%}%>
		  
		}

		d2.addEventListener('input',holiday2);
		
		var date = document.getElementById('date_s'+h);
		function noHoliday(e){
		  // Days in JS range from 0-6 where 0 is Sunday and 6 is Saturday
		  var day = new Date(e.target.value).getUTCDay();
		  if ( day == 0 || day==6){
			  sweetAlert('不可以選擇假日');
			  document.getElementById('date_s'+h).value="";
		    e.target.setCustomValidity('不可選擇假日！');
		  } else {
		    e.target.setCustomValidity('');
		  };
		}

		date.addEventListener('input',noHoliday);
	
		
		var date2 = document.getElementById('date_e'+h);
		function noHoliday2(e){
		  // Days in JS range from 0-6 where 0 is Sunday and 6 is Saturday
		  var day = new Date(e.target.value).getUTCDay();
		  if ( day == 0 || day==6){
			  sweetAlert('不可以選擇假日');
			  document.getElementById('date_e'+h).value="";
		    e.target.setCustomValidity('不可選擇假日！');
		  } else {
		    e.target.setCustomValidity('');
		  };
		}

		date2.addEventListener('input',noHoliday2);
		}
	
	
	var kl=[0,0,0,0,0];
	kl[1]=parseFloat($("#kl0").val());
	kl[2]=parseFloat($("#kl1").val());
	kl[3]=parseFloat($("#kl2").val());
	kl[4]=parseFloat($("#kl3").val()); 
	console.log(kl);
	
	
	
	$("#submit").click(function(){
		var r=check();
		if(r==1)
		return false;
		if(r==0)
			return true;
	})
	function check(){
		
		var bug={'pk' : '', 'ds' : '', 'de' : '','ts' : '', 'te' : '','total' : '' ,'re' : '' ,};
		var kp=[0,0,0,0,0];
		for(var i=1;i<cou;i++)
		{
		
		
			//開始日期
			var ds=$("#date_s"+i).val();
			
			//結束日期
			var de=$("#date_e"+i).val();
			
			//開始時間
			 var str="#time_s";
			str=str+i+" :selected";
			var ts=$(str).text();
					
			//結束時間
			str="#time_e";
			str=str+i+" :selected";
			var te=$(str).text();
					
			//時數
			var tot=$("#tot"+i).val();
													
			//錯誤提醒
			if(ts=='請選擇')
				bug.ts+="子假單"+i+"開始時間未選擇"+"\n";
			if(te=='請選擇')
				bug.te+="子假單"+i+"結束時間未選擇"+"\n";
			
			if(tot=='請假時數為負')
					bug.total+="子假單"+i+"剩餘時間為負"+"\n";
			if(tot=='請假時數為零')
				bug.total+="子假單"+i+"請假時間為零"+"\n";
			if(tot=='時間尚未輸入完整')
				bug.total+="子假單"+i+"時間尚未輸入完整"+"\n";
		 
			
			//假別
			str="input[name=pk";
			str=str+i+"]:checked";
			var k=$(str).val();
			console.log(k);
			tot=parseFloat(tot);
			
			if(k=='2')
				kp[1]+=tot;
			if(k=='3')
				kp[2]+=tot;
			if(k=='4')
				kp[3]+=tot;
			if(k=='5')
				kp[4]+=tot;			
			
			if(k=='2'&&kl[1]<kp[1])
				bug.pk+="子假單"+i+"病假剩餘額度不足"+"\n";
			if(k=='3'&&kl[2]<kp[2])
				bug.pk+="子假單"+i+"喪假剩餘額度不足"+"\n";
			if(k=='4'&&kl[3]<kp[3])
				bug.pk+="子假單"+i+"產假剩餘額度不足"+"\n";
			if(k=='5'&&kl[4]<kp[4])
				bug.pk+="子假單"+i+"特休剩餘額度不足"+"\n"; 
									
				}	;
		
		
	 for(i=1;i<cou;i++)
		{
		 
		  for(var j=1;j<i;j++)
			{
			   	if(alps[i]-alpe[j]<=0&&alps[i]-alps[j]>=0)
				bug.re="時間重複";
				if(alpe[i]-alps[j]>=0&&alpe[i]-alpe[j]<=0)
				bug.re="時間重複";
				if(alps[i]-alps[j]<=0&&alpe[i]-alpe[j]>=0)
					bug.re="時間重複";
			}; 
		}			 

	var bugmeg = '';
	if (bug.pk!='')
		bugmeg=bugmeg+bug.pk;
	if (bug.ds!='')
		bugmeg=bugmeg+bug.ds;
	if (bug.de!='')
		bugmeg=bugmeg+bug.de;
	if (bug.ts!='')
		bugmeg=bugmeg+bug.ts;
	if (bug.te!='')
		bugmeg=bugmeg+bug.te;
	if (bug.total!='')
		bugmeg=bugmeg+bug.total;
	if (bug.re!='')
		bugmeg=bugmeg+bug.re;
		
	if(bugmeg != ''){
		sweetAlert(bugmeg);
		return 1;
		};
		
		return 0;
		};
	
	
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>

</body>

</html>
 