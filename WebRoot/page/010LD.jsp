<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="com.xhx.ssm.po.User" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix ="form" uri="http://www.springframework.org/tags/form" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"> 
  <link rel="stylesheet" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/foundation-datepicker.css" >
  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
  <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/foundation-datepicker.js"></script>
  <script src="${pageContext.request.contextPath }/js/locales/foundation-datepicker.zh-CN.js"></script>	
  		<style>
		.container { margin:0 auto;  max-width:960px;padding:20px;}
		</style>
<title>010LD</title>
<script type="text/javascript"> 
	function dataCheck() {
		var startTime=$("#STbeginScanTime").val(); 
		var endTime=$("#STendScanTime").val();  
		var today=new Date();//获取当前时间(没有格式化)  
		var year=today.getFullYear();//获取年份,四位数  
		var month=today.getMonth()+1;//获取月份,0-11  
		var day=today.getDate();//获取几号  
		if(month<=9){//格式化  
		    month="0"+month;  
		}  
		if(day<=9){  
		    day="0"+day;  
		}  
		today=year+"-"+month+"-"+day;  
		if(startTime!=""){
	    	if(today>startTime){//对比日期大小  
	    	    alert("开始使用日期要大于当前日期!");  
	    	    return false;  
	    	} 
		}
		if(endTime!=""){
			if(startTime>=endTime){  
	    	    alert("开始使用日期检索范围不正!");  
	    	    return false;  
	    	}  
		}
		
	}
    function PageClick(CurrentPage) {
    	 document.getElementById("CurrentPage").value = CurrentPage;
    	 document.getElementById("login").submit();
    }
    $(document).ready(function(){
    $(".date").fdatepicker({
		format: 'yyyy/mm/dd',
		pickTime: false
	});
});
</script>
</head>
<body>
<%-- username:${user.SHAIN_NM } 
<p> 
password:${user.SHAIN_CD }  --%>

	<div style=background-color:#00b0ff > 
	<form action="inser.html" method="post" id="inser" style="width:100%" class="form-inline" role="form">		
			<label style="hieght:50%"><br><span >従業員情報処理</span></label>
			<input type="submit" class="btn btn-info pull-right" value="新規登録"></input>
		</form>		
	</div>
	<form:form action="search.html" method="post" id="login" style="width:100%" class="form-inline" role="form">
	<div align="left" style=background-color:#9d9d9d>
		<label class="col-sm-3 control-label">会社：</label>
		<input type="text" class="form-control" style="width:15%" name="KAISHA_CD" value="${user.KAISHA_CD }"/><br>
		<form:errors  path ="KAISHA_CD" cssStyle="color:red"/>
		<label class="col-sm-3 control-label">従業員コード ：</label>
		<input type="text" class="form-control" style="width:15%" name="SHAIN_CD" value="${user.SHAIN_CD }">（前方一致）<br>
		<label class="col-sm-3 control-label">従業員名 ：</label>		
		<input type="text" class="form-control" style="width:40%" name="SHAIN_NM" value="${user.SHAIN_NM }">（部分一致）<br>
		<form:errors  path ="SHAIN_NM" cssStyle="color:red"/>
		<label class="col-sm-3 control-label">従業員名（ｶﾅ）：</label>
		<input type="text" class="form-control" style="width:40%" name="SHAIN_KANA" value="${user.SHAIN_KANA }">（部分一致）<br>
		<label class="col-sm-3 control-label">使用開始日：</label>
		
		<input type="text" class="date form-control" id="STbeginScanTime" style="width:15%" name="SHIYOU_STR_FR" value="<fmt:formatDate value="${user.SHIYOU_STR_FR}" pattern="yyyy/MM/dd"/>">		
		<label>～</label>
		<input type="text" class="date form-control" id="STendScanTime" style="width:15%" name="SHIYOU_STR_TO" value="<fmt:formatDate value="${user.SHIYOU_STR_TO}" pattern="yyyy/MM/dd"/>"><br>
		<label class="col-sm-3 control-label">使用終了日：</label>
		<input type="text" class="date form-control" id="ENDfrScanTime" style="width:15%" name="SHIYOU_END_FR" value="<fmt:formatDate value="${user.SHIYOU_END_FR}" pattern="yyyy/MM/dd"/>">
		<label>～</label>
		<input type="text" class="date form-control" id="ENDtoScanTime" style="width:15%" name="SHIYOU_END_TO" value="<fmt:formatDate value="${user.SHIYOU_END_TO}" pattern="yyyy/MM/dd"/>"><br>
	</div>
	<div align="right" style=background-color:#00b0ff> 
		表示件数：<input type="text" class="form-control" style="width:10%" name="KENSU" value="${user.KENSU }"/>
		 件<input type="hidden" id="CurrentPage"  name="CURRENTPAGE" value="">
		<input type="submit" class="btn btn-info" onclick="dataCheck()" value="検 索" />
	</div>	
	</form:form>

<table class="table table-hover table-bordered">  
  <thead>
    <tr style=background-color:#00b0ff>
      <th> </th>
      <th>社員名</th>
      <th>社員コード</th>
      <th>Email</th>
      <th>  </th>
    </tr>
  </thead>
  <tbody>
      <c:forEach var="User" items="${userlist}">
      <tr>
      	 <td align="center">
		<a href="inser.html?SHAIN_CD=${User.SHAIN_CD}"><img src="${pageContext.request.contextPath }/imges/0.jpg"  width="24" height="24" /></a>
		<a href="Update.html?SHAIN_CD=${User.SHAIN_CD}"><img src="${pageContext.request.contextPath }/imges/1.jpg" width="24" height="24" /></a>
		<a href="Update.html?SHAIN_CD=${User.SHAIN_CD}"><img src="${pageContext.request.contextPath }/imges/22.jpg" width="24" height="24"/></a></td>
      	<td>${User.SHAIN_NM }</td>
		<td>${User.SHAIN_CD }</td>
		<td>${User.MAIL }</td>
		<td><a href="delete.html?SHAIN_CD=${User.SHAIN_CD}"><img src="${pageContext.request.contextPath }/imges/3.jpg" width="24" height="24"/></a></td>
	  </tr>	
      </c:forEach>   
  </tbody>
</table>
 <div align="center">
	<ul class="pagination pagination-lg">	
    <li><a href="#">&laquo;</a></li>
    <li class="previous"><a href="#"> < </a></li>
    <c:forEach var="x" begin="${user.CURRENTPAGE -5 > 1 ? user.CURRENTPAGE -5:1}" end="${user.CURRENTPAGE + 9 > user.PAGECOUNT ? user.PAGECOUNT: user.CURRENTPAGE+5 }" step="1">
    	<li><a href="#" onclick="PageClick(${x})">${x}</a></li>
    </c:forEach>  
    <li class="next"><a href="#"> > </a></li>
    <li><a href="#">&raquo;</a></li>
	</ul>
</div>	
<div align="center">
	共【<label>${user.PAGECOUNT} </label>】页当前页【<label>${user.CURRENTPAGE} </label>】
</div>
</body>
</html>