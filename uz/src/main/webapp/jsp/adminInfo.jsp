<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTDHTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>管理员信息</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/layout.css">
	<script type="text/javascript" src="<%=basePath%>/script/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/script/common.js"></script>
  </head>
  
  <body>
  <div class="fliter-box">
  	<table width="100%" cellpadding="0" cellspacing="0">
  		<tr>
  			<th>姓名：</th>
  			<td width="260"><input class="ipt-text" type="text"></td>
  			<th>电话：</th>
  			<td><input class="ipt-text" type="text"></td>
  		</tr>
  	</table>
  </div>
  <div class="fliter-btn">
  	<a href="javascript:void(0);" onclick="modAdmin();"><img src="../images/btn_add.jpg" alt=""></a>
  </div>
  <div class="tableFrom">
  	<table width="100%">
  	  <thead>
  	  	<th><input id="Allchk" type="checkbox"></th>
  	  	<th>姓名</th>
  	  	<th>电话</th>
  	  	<th>操作</th>
  	  </thead>
  	  <tbody>
  	  	<tr>
  	  		<td><input class="ckh" type="checkbox"></td>
  	  		<td>张三</td>
  	  		<td>13100000001</td>
  	  		<td><a href="#">修改</a> | <a href="#">删除</a></td>
  	  	</tr>
  	  </tbody>
  	</table>
  </div>
  <jsp:include page="page.jsp" flush="true">
		<jsp:param value="/sysUserController/findSysUserListByPage" name="url" />
		<jsp:param value="userName=${sysuser.userName}&deptId=${sysuser.deptId }&userSex=${sysuser.userSex }" name="param"/>
  </jsp:include>
  <!-- 新增弹窗DIV start -->
  <div id="adminDiv" style="display:none;">
  	<div class="adminTable modal-table">
  		<table>
  			<tbody>
  				<tr>
  					<th>姓名：</th>
  					<td><input class="ipt-text" type="text"></td>
  					<th>电话：</th>
  					<td><input class="ipt-text" type="text"></td>
  				</tr>
  			</tbody>
  		</table>
  		<span>请输入相关信息</span>
  	</div>
  </div>		 	  
  <!-- 新增弹窗DIV end -->
<script type="text/javascript" src="<%=basePath%>/script/jquery.artDialog.source.js"></script>
<script src="../script/iframeTools.source.js"></script> 
</body>
  <script type="text/javascript">
    function modAdmin(){
	  art.dialog({
		title:"新增",  //这是标题
		padding:'10px 15px',  //这是内补丁，默认为10px
		content: document.getElementById('adminDiv'),
		lock:true,   //这表示是否出现背景遮罩层
		// window:'top',
		opacity:0.5,  //这表示遮罩层的背景透明度，默认这个数值
		id:'newClass', //加了id可以防止多次弹出同一个窗口
		ok: function () {
    	  // this.title('3秒后自动关闭').time(3); 
    	  alert("OK");
          // return false;
        },
        cancelVal:'取消',
        cancel:true
	   });
	}
  </script>
</html>
