<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	<meta http-equiv="keywords" content="">
	<meta http-equiv="description" content="">
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/layout.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/login.css">
	<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/images/favicon.ico">
	<link rel="icon" href="<%=basePath%>/images/favicon.ico" type="image/x-icon" />
	<script type="text/javascript" src="<%=basePath%>script/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
	<script type="text/javascript" src="<%=basePath%>script/cloud.js"></script>
	
	<script language="javascript">
	  $(document).keyup(function(event){
		  if(event.keyCode ==13){
		    $("#loginSub").trigger("click");
		  }
		});
	  $(function(){
	    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
		$(window).resize(function(){  
	      $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	    });  
	  });
	</script> 

  </head>
  
  <body style="background-color:#1c77ac; background-image:url(../images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
  <div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
  </div>  

  <div class="logintop">    
    <span>欢迎登录智优出入管理界面平台</span>    
    <ul>
      <!-- <li><a href="javascript:void(0);">回首页</a></li> -->
      <li><a href="javascript:void(0);">帮助</a></li>
      <li><a href="javascript:void(0);">关于</a></li>
    </ul>    
  </div>
    
  <div class="loginbody">    
    <span class="systemlogo"></span>        
    <div class="loginbox">    
    <ul>
      <li><input id="name"  type="text" class="loginuser" placeholder="请输入用户名" onclick="JavaScript:this.value=''"/></li>
      <li><input  id="password" type="password" class="loginpwd" placeholder="请输入密码" onclick="JavaScript:this.value=''"/></li>
      <li class="li-btn"><input id="loginSub" type="button" class="loginbtn" value="登录" onclick="userLogin();"  />
      <!-- <label><input name="" type="checkbox" value="" checked="checked" />记住密码</label> -->
      <!-- <label><a href="javascript:void(0);">忘记密码？</a></label></li> -->
    </ul>
     <div class="loginerror"><span></span></div> 
    </div>
  </div>            
  <div class="loginbm">深圳惠想科技有限公司版权所有&nbsp;&nbsp;Copyright © 2015 All right reseverd. </div>
</body>
</html>
