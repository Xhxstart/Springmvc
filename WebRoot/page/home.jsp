<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="com.xhx.ssm.po.User" scope="request" ></jsp:useBean>	
<%@taglib prefix ="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
  <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<title>home</title>
</head>
<body>
	<h1>Spring MVC</h1>
	<form:form modelAttribute="user" action="login.html" method="post" style="width:30%">
	<table>
	<tr>
		<td>username:</td>
		<td><form:input path="SHAIN_NM" class="form-control" /></td>
		<td><form:errors  path="SHAIN_NM" cssStyle="color:red"/></td>
	</tr>
	<tr>
		<td>password:</td>
		<td><form:input type="password" class="form-control" path="KAISHA_CD" /></td>
		<td><form:errors  path	="KAISHA_CD" cssStyle="color:red"/></td>
	</tr>
	<tr>
		<td><input type="submit" class="btn btn-info" value="submit" /></td>
	</tr>	
	</table>
		
	</form:form>
</body>
</html>