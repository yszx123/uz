<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTDHTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title></title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/layout.css">
	<script type="text/javascript" src="<%=basePath%>/script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/common.js"></script> 
  </head>
  
  <body>
  <div class="fliter-box registInfo">
  	<table width="100%" cellpadding="0" cellspacing="0">
  		<tr>
  			<th>姓名：</th>
  			<td><input id="name" class="ipt-text" type="text"></td>
  			<!-- <th>身份证号：</th>
  			<td><input class="ipt-text" type="text"></td> -->
  			<th>电话：</th>
  			<td><input id="phone" class="ipt-text" type="text"></td>
  			<th>公司：</th>
  			<td>
  			  <input id="company" class="ipt-text" type="text">
  			</td>
  			<td><a href="javascript:void(0);" onclick="searRegister();"><img src="../images/btn_search.png"  alt=""></a></td>
  		</tr>
  		
  	</table>
  </div>
  <div class="fliter-btn"></div>
  <div class="tableFrom">
  	<table width="100%">
  	  <thead>
  	  	<th><input id="Allchk" type="checkbox"></th>
  	  	<th>姓名</th>
  	  	<th>公司名称</th>
  	  	<th>身份证号</th>	
  	  	<th>电话</th>
  	  	<th>时间</th>  	  	
  	  	<th>操作</th>
  	  </thead>
  	  <tbody>
  	    <c:forEach items="${visitorListByPage}" var="regiter">
  	  	<tr>
  	  		<td><input class="ckh" type="checkbox"></td>
  	  		<td>${regiter.name }</td>
  	  		<td>${regiter.companyName }</td>
  	  		<td>${regiter.idNum }</td>
  	  		<td>${regiter.phoneNum }</td>
  	     	<td>${regiter.createTime }</td>
  	  		<td><a href="javascript:void(0);" onclick="delRegiter('${regiter.visitorId }');">删除</a></td>
  	  	</tr>
  	  	</c:forEach>
  	  </tbody>
  	</table>
  </div>
  <jsp:include page="page.jsp" flush="true">
		<jsp:param value="/visitorController/findVisitorByPage" name="url" />
		<jsp:param value="userName=${visitor.name}&phoneNum=${visitor.phoneNum }&companyName=${visitor.companyName }" name="param"/>
  </jsp:include>
  <script type="text/javascript" src="<%=basePath%>/script/datePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="<%=basePath%>/script/jquery.artDialog.source.js"></script>
</body>
<script type="text/javascript">
	function delRegiter(visitorId){
	  if(confirm("确认是否删除?")){
		 $.get("/visitorController/deleteVisitorByVisitorId/"+visitorId+".do",null,function(msg){
			 window.location.href="/visitorController/findVisitorByPage/0.do";
		 }) 
	     //window.location.href="/visitorController/deleteVisitorByVisitorId/"+visitorId+".do";
	  }
	};
    function searRegister(){
      var name= $.trim($("#name").val());
      var phone= $.trim($("#phone").val());
      var company= $.trim($("#company").val());
      
      window.location.href="/visitorController/findVisitorByPage/0.do?name="+name+"&phoneNum="+phone+"&companyName="+company;
    };


</script>
</html>
