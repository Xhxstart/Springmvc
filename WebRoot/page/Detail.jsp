
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/BeatPicker.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/demos.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/prism.css"/> 
    <script src="${pageContext.request.contextPath }/js/jquery-1.11.0.min.js"></script>   
    <script src="${pageContext.request.contextPath }/js/BeatPicker.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/prism.js"></script>
   
  <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
  <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
  
<script type="text/javascript">      
    function PageClick(CurrentPage) {
    	 document.getElementById("CurrentPage").value = CurrentPage;
    	 document.getElementById("login").submit();
    }
</script>
</head>
<body>
<%-- username:${user.SHAIN_NM } 
<p> 
password:${user.SHAIN_CD }  --%>
 
	<form action="login.html" method="post" id="login" style="width:100%" class="form-inline" role="form">
	<div align="left" style=background-color:#9d9d9d>
		<label class="col-sm-3 control-label">会社：</label>
		<input type="text" class="form-control" style="width:15%" name="KAISHA_CD" /><br>
		<label class="col-sm-3 control-label">従業員コード ：</label>
		<input type="text" class="form-control" style="width:15%" name="SHAIN_CD" >（前方一致）<br>
		<label class="col-sm-3 control-label">従業員名 ：</label>
		<input type="text" class="form-control" style="width:40%" name="SHAIN_NM" >（部分一致）<br>
		<label class="col-sm-3 control-label">従業員名（ｶﾅ）：</label>
		<input type="text" class="form-control" style="width:40%" name="SHAIN_KANA" >（部分一致）<br>
		<label class="col-sm-3 control-label">使用開始日：</label>
		<input type="text" data-beatpicker="true" data-beatpicker-module="clear" class="form-control" style="width:15%" name="SHIYOU_STR_FR">
		<label>～</label>
		<input type="text" data-beatpicker="true" data-beatpicker-module="clear" class="form-control" style="width:15%" name="SHIYOU_STR_TO"><br>
		<label class="col-sm-3 control-label">使用終了日：</label>
		<input type="text" data-beatpicker="true" data-beatpicker-module="clear" class="form-control" style="width:15%" name="SHIYOU_END_FR">
		<label>～</label>
		<input type="text" data-beatpicker="true" data-beatpicker-module="clear" class="form-control" style="width:15%" name="SHIYOU_END_TO"><br>
	</div>
	<div align="right" style=background-color:#00b0ff> 
		表示件数：<input type="text" class="form-control" style="width:10%" name="KENSU"/>
		 件<input type="hidden" id="CurrentPage"  name="CURRENTPAGE" value="">
		<input type="submit" class="btn btn-info" value="検 索" />
	</div>	
	</form>
</body>
</html>