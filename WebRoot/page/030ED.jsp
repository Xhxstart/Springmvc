<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="com.xhx.ssm.po.User" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 
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
<title>030ED</title>
<script type="text/javascript">      
    function PageClick(CurrentPage) {
    	 document.getElementById("CurrentPage").value = CurrentPage;
    	 document.getElementById("login").submit();
    }
    $(document).ready(function(){
    $(".date").fdatepicker({
		format: 'yyyy-mm-dd',
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
		<form action="login.html" method="post" id="login" style="width:100%" class="form-inline" role="form">		
			<label style="width:50%"><br><span>従業員情報修正</span></label>
			<input type="submit" class="btn btn-info pull-right" value="一覧"></input>
		</form>		
	</div>
	<form action="inser.html" method="post" id="login" style="width:100%" class="form-inline" role="form">
	<div align="left" style=background-color:#9d9d9d>
		<label class="col-sm-3 control-label">会社：</label>
		<input type="text" class="form-control" style="width:15%" name="KAISHA_CD" value="${user.KAISHA_CD }"/><br>
		<label class="col-sm-3 control-label">従業員コード ：</label>
		<input type="text" class="form-control" style="width:15%" name="SHAIN_CD" value="${user.SHAIN_CD }"><br>
		<label class="col-sm-3 control-label">従業員名 ：</label>
		<input type="text" class="form-control" style="width:40%" name="SHAIN_NM" value="${user.SHAIN_NM }"><br>
		<label class="col-sm-3 control-label">従業員名（ｶﾅ）：</label>
		<input type="text" class="form-control" style="width:40%" name="SHAIN_KANA" value="${user.SHAIN_KANA }"><br>
		<label class="col-sm-3 control-label">Email：</label>
		<input type="text" class="form-control" style="width:40%" name="SHAIN_KANA" value="${user.SHAIN_KANA }"><br>
		<label class="col-sm-3 control-label">使用開始日：</label>		
		<input type="text" class="date form-control" class="form-control" style="width:15%" name="SHIYOU_STR_FR" value="<fmt:formatDate value="${user.SHIYOU_STR_FR}" pattern="yyyy/MM/dd"/>">	<br>			
		<label class="col-sm-3 control-label">使用終了日：</label>
		<input type="text" class="date form-control" class="form-control" style="width:15%" name="SHIYOU_END_FR" value="<fmt:formatDate value="${user.SHIYOU_END_FR}" pattern="yyyy/MM/dd"/>">		
	</div>
	<div align="right" style=background-color:#00b0ff> 
		<input type="button" class="btn btn-info"  value="確　認"/>		 
		<input type="submit" class="btn btn-info" value="登　録" />
	</div>	
	</form>

</body>
</html>