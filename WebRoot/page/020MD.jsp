<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<jsp:useBean id="user" class="com.xhx.ssm.po.User" scope="request" ></jsp:useBean>	
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix ="form" uri="http://www.springframework.org/tags/form" %>
 
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
<title>020MD</title>
<script type="text/javascript">      
    function dataCheck() {
    	var startTime=$("#beginScanTime").val(); 
    	var endTime=$("#endScanTime").val();  
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
	    	    alert("开始使用日要大于当前日期!");  
	    	    return false;  
	    	} 
    	}
    	if(endTime!=""){
    		if(startTime>=endTime){  
        	    alert("使用开始日要小于使用终了日!");  
        	    return false;  
        	}  
    	}
    	
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
		<form action="search.html" method="post"  style="width:100%" class="form-inline" role="form">		
			<label style="width:50%"><br><span>従業員情報登録</span></label>
			<input type="submit" class="btn btn-info pull-right" value="一覧"></input>
		</form>		
	</div>
	<form:form modelAttribute="user" action="inser.html" method="post" id="login" style="width:100%" class="form-inline" role="form">
	<div align="left" style=background-color:#9d9d9d>
		<label class="col-sm-3 control-label">会社：</label>
		<input type="text" class="form-control" style="width:15%" name="KAISHA_CD" value="${user.KAISHA_CD }"/>
		<form:errors path="KAISHA_CD" cssStyle="color:red"/><br>
		<label class="col-sm-3 control-label">従業員コード ：</label>
		<input type="text" class="form-control" style="width:15%" name="SHAIN_CD" value="${user.SHAIN_CD }">
		<form:errors path="SHAIN_CD" cssStyle="color:red"/><br>
		<label class="col-sm-3 control-label">従業員名 ：</label>
		<input type="text" class="form-control" style="width:40%" name="SHAIN_NM" value="${user.SHAIN_NM }">
		<form:errors path="SHAIN_NM" cssStyle="color:red"/><br>
		<label class="col-sm-3 control-label">従業員名（ｶﾅ）：</label>
		<input type="text" class="form-control" style="width:40%" name="SHAIN_KANA" value="${user.SHAIN_KANA }">
		<form:errors path="SHAIN_KANA" cssStyle="color:red"/><br>
		<label class="col-sm-3 control-label">Email：</label>
		<input type="text" class="form-control" style="width:40%" name="MAIL" value="${user.MAIL }">
		<form:errors path="MAIL" cssStyle="color:red"/><br>
		<label class="col-sm-3 control-label">使用開始日：</label>		
		<input type="text" class="date form-control" class="form-control" id="beginScanTime" style="width:15%" name="SHIYOU_STR_FR" value="<fmt:formatDate value="${user.SHIYOU_STR_FR}" pattern="yyyy/MM/dd"/>">
		<form:errors path="SHIYOU_STR_FR" cssStyle="color:red"/><br>			
		<label class="col-sm-3 control-label">使用終了日：</label>
		<input type="text" class="date form-control" class="form-control" id="endScanTime" style="width:15%" name="SHIYOU_END_FR" value="<fmt:formatDate value="${user.SHIYOU_END_FR}" pattern="yyyy/MM/dd"/>">
		<form:errors path="SHIYOU_END_FR" cssStyle="color:red"/><br>		
	</div>
	<div align="right" style=background-color:#00b0ff> 
		<input type="button" id="check" class="btn btn-info" onclick="dataCheck()" value="確　認"/>		 
		<input type="submit" class="btn btn-info" value="登　録" />
	</div>	
	</form:form>

</body>
</html>