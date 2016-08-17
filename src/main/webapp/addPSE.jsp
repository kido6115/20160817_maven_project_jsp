<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  page import="Db.*"%>
<%@  page import="Bean.*"%>
<%@  page import="java.util.*"%>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="js/jquery.js"></script>
<script src="js/sweetalert.min.js"></script>
<script type="text/javascript" src="js/json2.js"></script>
<link rel="stylesheet" type="text/css" href="css/sweetalert.css">

<style>
input:invalid {
	background-color: #E00;
}
</style>
<script>

var d =1;
var addt=1;
</script>
<%

int nn=1;
	
String Eid = (String) session.getAttribute("Employee");
	JDBCIndex2 db = new JDBCIndex2();
	List<RemainHour> credit = db.getcredit(Eid);
	Float[] remain = db.takeoff(Eid);
	Float[] pend = db.pending(Eid);
String[] pkl ={"病假","喪假","產假","特休"};

%>

<title>請假系統-新增假單</title>
</head>

<body>

	<%
		JDBCAddPSE db2=new JDBCAddPSE(); 
		
		ArrayList<Holiday> list2=(ArrayList<Holiday>)db2.getHolidays();
	%>

	<%
		if(session.getAttribute("Employee")==null)
			{
			response.sendRedirect("index.jsp?Login=1#Login");	
			}
	%>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	
	<%
	if(request.getAttribute("Status")!=null && request.getAttribute("Status").equals("1")){
	
	%>
	<script>
	sweetAlert("Success", "上傳成功!!", "success");
	</script>
	<%
	}else 	if(request.getAttribute("Status")!=null && request.getAttribute("Status").equals("99")){

		%>
		<script>
		sweetAlert("Oops...", "上傳失敗,請確定格式是否正確!", "error");
		</script>
		<%
	
	}

		if(session.getAttribute("check")!=null) {			
			if (((String)session.getAttribute("check")).equals("1")){
	%>
	<script>
sweetAlert('請假時間已請!!!');

</script>
	<%
	session.setAttribute("check","");}
	%>

	<%
		if (((String)session.getAttribute("check")).equals("2")){
	%>
	<script>
sweetAlert('申請成功!!!');
</script>
	<%
	session.setAttribute("check","");}
			}
	%>
	<div id="wrapper">

		<jsp:include page="Home.jsp">
			<jsp:param name="status" value="addPSE" />
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
						<h1><img src="img/add.png"></h1>
						<p></p>
						<div id="form">
							<%
								for (int i = 1; i <= 5; i++) {
													
													if (request.getParameterValues("pkind" + i) != null) {
							%>
							<input type="hidden" id="pk<%=i%>"
								value="<%=request.getParameter("pkind" + i)%>"> <input
								type="hidden" id="dates<%=i%>"
								value="<%=request.getParameter("date_s" + i)%>"> <input
								type="hidden" id="times<%=i%>"
								value="<%=request.getParameter("time_s" + i)%>"> <input
								type="hidden" id="datee<%=i%>"
								value="<%=request.getParameter("date_e" + i)%>"> <input
								type="hidden" id="timee<%=i%>"
								value="<%=request.getParameter("time_e" + i)%>"> <input
								type="hidden" id="t<%=i%>"
								value="<%=request.getParameter("total" + i)%>"> <input
								type="hidden" id="p<%=i%>"
								value="<%=request.getParameter("ps" + i)%>">

							<%
								}}
							%>

							<%
								for (int i = 0; i < 4; i++) {
							%>
							<input type="hidden" id="kl<%=i%>"
								value="<%=credit.get(i).getremainHour()-remain[i+1]%>">
							<%
								}
							%>
							<form action="addCheckServlet" method="post">
								<table class="CSSTableGenerator " id="tt">
									<tr>
										<td colspan="2" scope="col"><label for="textfield3">姓名
												:</label></td>
										<td colspan="3" scope="col"><%=(String) session.getAttribute("Name")%></td>
									</tr>
									<tr id="star">
										<td colspan="2" scope="row"><label for="textfield4">員工編號:</label></td>
										<td colspan="3"><%=(String) session.getAttribute("Employee")%></td>
									</tr>
									<tr>
										<td colspan="2">各假別剩餘額度(待審核)</td>
										<td colspan="3">
											<%
												for (int i = 0; i < 4; i++) {
													
											%> <%=pkl[i]%>:<%=credit.get(i).getremainHour()-remain[i+1]%>(<%=pend[i+1]%>)
											| <%
 	}
 %>
										</td>

									</tr>




									<%
										if(request.getAttribute("count")!=null)/* &&!((String)session.getAttribute("check")).equals("2") */
																	{ 
											
																	int k = Integer.parseInt((String)request.getAttribute("count"));
																	nn=k;
																	for(int i=1;i<=k;i++)
																	{
									%><tr class="d<%=i%>">
										<td rowspan="5" scope="row"><p>
												子假單<%=i%></p>
											<p>
												
												<button class="btn btn-sm btn-danger" id="delete<%=i%>"
													onclick=del(<%=i%>)>X</button>
												
											</p></td>
										<td scope="row">假別</td>
										<td colspan="3" id="k_n<%=i%>"><input type="radio"
											name="pkind<%=i%>" id="k1" value="1" required> 事假 <input
											type="radio" name="pkind<%=i%>" id="k2" value="2"> 病假
											<input type="radio" name="pkind<%=i%>" id="k3" value="3">
											喪假 <input type="radio" name="pkind<%=i%>" id="k4" value="4">
											產假 <input type="radio" name="pkind<%=i%>" id="k5" value="5">
											特休</td>
									</tr>
									<tr class="d<%=i%>">
										<td scope="row">假別起始日期:</td>
										<td><input type="date" id="date_s<%=i%>"
											name="date_s<%=i%>" style="background-color: white" 
											onchange="setMin(<%=i%>)" required></td>
										<td>假別起始時間:</td>
										<td><select name="time_s<%=i%>" id="time_s<%=i%>"
											onchange="countt(<%=i%>)">
												<option>請選擇</option>
												<option>9:00</option>
												<option>9:30</option>
												<option>10:00</option>
												<option>10:30</option>
												<option>11:00</option>
												<option>11:30</option>
												<option>12:00</option>
												<option>13:00</option>
												<option>13:30</option>
												<option>14:00</option>
												<option>14:30</option>
												<option>15:00</option>
												<option>15:30</option>
												<option>16:00</option>
												<option>16:30</option>
												<option>17:00</option>
												<option>17:30</option>
												<option>18:00</option>
										</select></td>
									</tr>
									<tr class="d<%=i%>">
										<td scope="row">假別結束日期:</td>
										<td><input type="date" name="date_e<%=i%>" 
											id="date_e<%=i%>" style="background-color: white"
											onchange="setMax(<%=i%>)" required></td>
										<td>假別結束時間:</td>
										<td><select name="time_e<%=i%>" id="time_e<%=i%>"
											onchange="countt(<%=i%>)">
												<option>請選擇</option>
												<option>9:00</option>
												<option>9:30</option>
												<option>10:00</option>
												<option>10:30</option>
												<option>11:00</option>
												<option>11:30</option>
												<option>12:00</option>
												<option>13:00</option>
												<option>13:30</option>
												<option>14:00</option>
												<option>14:30</option>
												<option>15:00</option>
												<option>15:30</option>
												<option>16:00</option>
												<option>16:30</option>
												<option>17:00</option>
												<option>17:30</option>
												<option>18:00</option>
										</select></td>
									</tr>
									<tr class="d<%=i%>">
										<td scope="row">請假時數:</td>
										<td colspan="3"><input type="text" name="total<%=i%>"
											id="total<%=i%>" readonly></td>

									</tr>
									<tr id="end<%=i%>" class="d<%=i%>">
										<td scope="row">員工備註:</td>
										<td colspan="3"><textarea name="ps<%=i%>" id="ps<%=i%>"
												cols="40" rows="2" id="ps"></textarea></td>
									</tr>
									
									<%
										
																	
																	}}
																	else{
									%>
									<tr class="d1">
										<td rowspan="5" scope="row"><p>子假單1</p>
											<p>
												<button class="btn btn-sm btn-danger" id="delete1"
													onclick=del(1)>X</button> 
											</p></td>
										<td scope="row">假別</td>
										<td colspan="3" id="k_n1"><input type="radio"
											name="pkind1" id="k1" value="1" required> 事假 <input
											type="radio" name="pkind1" id="k2" value="2"> 病假 <input
											type="radio" name="pkind1" id="k3" value="3"> 喪假 <input
											type="radio" name="pkind1" id="k4" value="4"> 產假 <input
											type="radio" name="pkind1" id="k5" value="5"> 特休</td>
									</tr>
									<tr class="d1">
										<td scope="row">假別起始日期:</td>
										<td><input type="date" id="date_s1" name="date_s1"
											style="background-color: white" onchange="setMin(1)" required></td>
										<td>假別起始時間:</td>
										<td><select name="time_s1" id="time_s1"
											onchange="countt(1)">
												<option>請選擇</option>
												<option>9:00</option>
												<option>9:30</option>
												<option>10:00</option>
												<option>10:30</option>
												<option>11:00</option>
												<option>11:30</option>
												<option>12:00</option>
												<option>13:00</option>
												<option>13:30</option>
												<option>14:00</option>
												<option>14:30</option>
												<option>15:00</option>
												<option>15:30</option>
												<option>16:00</option>
												<option>16:30</option>
												<option>17:00</option>
												<option>17:30</option>
												<option>18:00</option>
										</select></td>
									</tr>
									<tr class="d1">
										<td scope="row">假別結束日期:</td>
										<td><input type="date" name="date_e1" id="date_e1"
											style="background-color: white" onchange="setMax(1)" required></td>
										<td>假別結束時間:</td>
										<td><select name="time_e1" id="time_e1"
											onchange="countt(1)">
												<option>請選擇</option>
												<option>9:00</option>
												<option>9:30</option>
												<option>10:00</option>
												<option>10:30</option>
												<option>11:00</option>
												<option>11:30</option>
												<option>12:00</option>
												<option>13:00</option>
												<option>13:30</option>
												<option>14:00</option>
												<option>14:30</option>
												<option>15:00</option>
												<option>15:30</option>
												<option>16:00</option>
												<option>16:30</option>
												<option>17:00</option>
												<option>17:30</option>
												<option>18:00</option>
										</select></td>
									</tr>
									<tr class="d1">
										<td scope="row">請假時數:</td>
										<td colspan="3"><input type="text" name="total1"
											id="total1" readonly></td>

									</tr>
									<tr id="end1" class="d1">
										<td scope="row">員工備註:</td>
										<td colspan="3"><textarea name="ps1" id="ps1" cols="40"
												rows="2" id="ps"></textarea></td>
									</tr>

									<%
										}
									%>



								</table>
								<br>

								<button class="btn btn-primary" type="button"
									style="float: right;" id="add">
									新增假別 <span class="glyphicon glyphicon-plus-sign"></span>
								</button>

								<p>&nbsp;</p>
								<p>
									<button  class="btn btn-primary" type="submit" name="submit"
										id="submit"><img src="img/paper-plane.png">&nbsp;送出</button>
									<!-- onclick="javascript:location.href='addPSEview.jsp'" -->
								</p>
							</form>
                                                         							<!-- 匯入假單 -->
							<p>
							<br><br>
				    <div style="border:3px solid #2c3e50;border-radius:20px;font-size:2.2rem;padding-right:50px;width:30%;">
						<div style="background-color:#2c3e50; border-radius:15px 0px 15px 0px; color:white; float:left;" >&nbsp;匯入假單:&nbsp;&nbsp;</div><br><br>
						<div style="padding-left:50px;">
						<form name="myform2" action="downloadServlet" method="post" >  
                        <button class="btn btn-sm btn-default" type="submit" name="submit"><img src="img/download.png">&nbsp;下載範本</button>
       
    </form> 
						       
							<br><br>
							<form name="myform" action="importServlet" method="post"  enctype="multipart/form-data">  
       <input style="background-color: white" type="file" name="myfile" required>
         <br>
       
       <button class="btn btn-danger" type="submit" name="submit" style="float:right;">匯入假單</button>
       <br>
    </form>          
    
    </div>
    
    
    
          
    <p>
    
    <!-- 結束 -->


							<p>&nbsp;</p>
							<p>&nbsp;</p>

							<p></p>
							</div>
						</div>

						
					</div>

				</div>
			</div>
		</div>



		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->
	

	<script>
	var i =1;
	
	for(var g=1;g<=<%=request.getParameter("count")%>;g++)
		{
		if(<%=request.getParameter("count")%>!=null)
			{
			var a = $("#dates"+g).val();
			$("#date_s"+g).val(a);
			a = $("#datee"+g).val();
			$("#date_e"+g).val(a);
			a = $("#times"+g).val();
			$("#time_s"+g).val(a);
			a = $("#timee"+g).val();
			$("#time_e"+g).val(a);
			a = $("#p"+g).val();
			$("#ps"+g).val(a); 
			a = $("#t"+g).val();
			$("#total"+g).val(a);
			a = $("#pk"+g).val();
			$("input[name=pkind"+g+"][value='"+a+"']").attr('checked',true);
			addt++;
			
			}
		
		}
	var alps=new Array();
	var alpe=new Array();
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
			$("#total"+j).val(tot); 
			else if(tot==0)
		    $("#total"+j).val('請假時數為零');	
			else if(tot<0)
			$("#total"+j).val('請假時數為負');	 
			else
			$("#total"+j).val('時間尚未輸入完整');
		    
	}
	for(var g=1;g<=<%=request.getParameter("count")%>;g++)
	{count(g);}
	</script>
	<script>
	
	
	$("#add").click(function(){
		
		if(addt==5)
		{
			sweetAlert('最多僅可以新增5筆假別');
		}
		else 
		{
			i++;
			<%nn++;%>
			addt++;
			addk();
		}
	
	});
	
	
	function del(d){
		if(addt!=1){
		$(".d"+d).remove() ;
		addt--;
		}
		else
			sweetAlert("最少為一筆假別");
		
	};
	
		function addk(){
			var addp="<tr class='d";
			addp = addp+i+"'><td rowspan='5' scope='row'><p>子假單";
			addp = addp+i+"</p><p><button class='btn btn-sm btn-danger' id='delete";
			addp = addp+i+"' onclick=del(";
			addp = addp+i+")>X</button></p></td><td scope='row'>假別</td><td colspan='3'><input type='radio' name='pkind"+i+"'";
			addp = addp+i+"' id='k1'  value='1' required> 事假 <input type='radio' name='pkind"+i+"'";
			addp = addp+i+"' id='k2'  value='2' > 病假 <input type='radio'name='pkind"+i+"'";
			addp = addp+i+"' id='k3'  value='3' > 喪假 <input type='radio' name='pkind"+i+"'";
			addp = addp+i+"' id='k4'  value='4' > 產假 <input type='radio' name='pkind"+i+"'";
			addp = addp+i+"' id='k5'  value='5' > 特休</td></tr><tr class='d";
			addp = addp+i+"'><td scope='row'>假別起始日期:</td><td><input type='date' style='background-color:white' onchange='setMin("+i+")' name='date_s"+i+"' id='date_s";
			addp = addp+i+"' required></td><td>假別起始時間:</td><td><select name='time_s"+i+"' onchange='countt("+i+")' id='time_s";
			addp = addp+i+"'><option>請選擇</option><option value='9:00'>9:00</option><option value='9:30'>9:30</option><option>10:00</option><option>10:30</option><option>11:00</option><option>11:30</option><option>12:00</option><option>13:00</option><option>13:30</option><option>14:00</option><option>14:30</option><option>15:00</option><option>15:30</option><option>16:00</option><option>16:30</option><option>17:00</option><option>17:30</option><option>18:00</option></select></td></tr><tr class='d";
			addp = addp+i+"'><td scope='row'>假別結束日期:</td><td><input type='date' style='background-color:white' onchange='setMax("+i+")' name='date_e"+i+"' id='date_e";
			addp = addp+i+"' required></td><td>假別結束時間:</td><td><select name='time_e"+i+"' onchange='countt("+i+")' id='time_e";
			addp = addp+i+"'><option>請選擇</option><option value='9:00'>9:00</option><option value='9:30'>9:30</option><option>10:00</option><option>10:30</option><option>11:00</option><option>11:30</option><option>12:00</option><option>13:00</option><option>13:30</option><option>14:00</option><option>14:30</option><option>15:00</option><option>15:30</option><option>16:00</option><option>16:30</option><option>17:00</option><option>17:30</option><option>18:00</option></select></td></tr><tr class='d";
			addp = addp+i+"'><td scope='row'>請假時數:</td><td colspan='3'> <input type='text' name='total"+i+"' id='total";
			addp = addp+i+"' readonly></td></tr><tr class ='d";
			addp = addp+i+"'><td scope='row'>員工備註:</td><td colspan='3'><textarea name='ps"+i+"' cols='40'rows='2' id='ps";
			addp = addp+i+"'></textarea></td></tr>";
			
			$('#tt').append(addp);
			
			holi(i);
			};
			holi(1);	
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
					  if ( day == '<%=holiday.geth_date()%>'){
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
			
			
			
			//});
			
			var kl=[0,0,0,0,0];
			 
			//1事2病3喪4產5特
			
			
			
			$("#submit").click(function(){
				kl[1]=parseFloat($("#kl0").val());
				kl[2]=parseFloat($("#kl1").val());
				kl[3]=parseFloat($("#kl2").val());
				kl[4]=parseFloat($("#kl3").val());
				
				var bug={'pk' : '', 'ds' : '', 'de' : '','ts' : '', 'te' : '','total' : '' ,'re' : '' ,};
				var kp=[0,0,0,0,0];
				for(var i=0;i<=addt;i++)
					{
					
					
					if($(".d"+i).val()!=null)
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
						var tot=$("#total"+i).val();
													
						
						
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
						str="input[name=pkind";
						str=str+i+"]:checked";
						var k=$(str).val();
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
					}
					
				
				 for(i=1;i<=addt ;i++)
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
					return false;
					};
					$('#tt').append("<input type='hidden' name='count' value='<%=nn%>'>");
					
				}); 
	</script>

	<script src="js/myJS.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Menu Toggle Script -->
	

	<script>
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
		
	}
	
</script>

</body>

</html>












