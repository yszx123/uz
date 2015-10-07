<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Object roleId = request.getParameter("roleid");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTDHTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>角色信息</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/layout.css">
	<script type="text/javascript" src="<%=basePath%>/script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/common.js"></script> 
  </head>
  
  <body>
  <div class="fliter-box roleInfo">
  	<table width="40%" cellpadding="0" cellspacing="0">
  		<tr>
  			<th>角色名称：</th>
  			<td><input id="roName" class="ipt-text" type="text"></td>
  			<td><a href="javascript:void(0);" onclick="schRoles();"><img src="../images/btn_search.png" alt=""></a></td>
  		</tr>
  	</table>
  </div>
  <div class="fliter-btn">
  	<a href="javascript:void(0);" onclick="addRoles();"><img src="../images/btn_add.jpg" alt=""></a>
  </div>
  <div class="tableFrom">
  	<table width="100%">
  	  <thead>
  	  	<th><input id="Allchk" type="checkbox"></th>
  	  	<th>角色名称</th>
  	  	<!-- <th>创建时间</th> -->
        <th>角色描述</th>
  	  	<th>操作</th>
  	  </thead>
  	  <tbody>
        <c:forEach items="${sysRoleListByPage}" var="roles">
        <tr>
          <td><input class="ckh" type="checkbox"></td>
          <td>${roles.roleName}</td>
          <td>${roles.roleDesc}</td>
          <td><a href="javascript:void(0);" onclick="modifyRoles('${roles.roleId}');">修改</a> | <a href="javascript:void(0);" onclick="delRoles('${roles.roleId}');">删除</a> | 
          <a href="<%=basePath%>jsp/powerBind.jsp?roleid=${roles.roleId}" target="_self">权限绑定</a></td>
        </tr>
        </c:forEach>
  	  </tbody>
  	</table>
  </div>
  <jsp:include page="page.jsp" flush="true">
		<jsp:param value="/sysRoleController/findSysRoleListByPage" name="url" />
		<jsp:param value="userName=${sysrole.roleName}" name="param"/>
  </jsp:include>
  <!-- 新增弹窗DIV start -->
  <div id="roleDiv" style="display:none;">
  	<div class="adminTable modal-table">
      <form:form action="/sysRoleController/addSysRole.do" method="post" id="addRoleForm">
  		<table>
  			<tbody>
  				<tr>
  					<th style="width:70px;">角色名称：</th>
  					<td><input id="roleName" name="roleName" class="ipt-text" type="text"></td>
  					<th style="width:70px;">角色描述：</th>
  					<td><input id="roleDesc" name="roleDesc" class="ipt-text" type="text"></td>
  				</tr>
  			</tbody>
  		</table>
      </form:form>
  		<div class="error"><span></span></div>
  	</div>
  </div>		 	  
  <!-- 新增弹窗DIV end -->
  <!-- 修改弹窗DIV start -->
  <div id="roleModifyDiv" style="display:none;">
  	<div class="adminTable modal-table">
      <form:form action="/sysRoleController/updateSysRole.do" method="post" id="midifyRoleForm">
         <input id="modify_roleid" name="roleId" type="hidden" /> 
  		<table>
  			<tbody>
  				<tr>
  					<th style="width:70px;">角色名称：</th>
  					<td><input id="mod_roleName" name="roleName" class="ipt-text" type="text"></td>
  					<th style="width:70px;">角色描述：</th>
  					<td><input id="mod_roleDesc" name="roleDesc" class="ipt-text" type="text"></td>
  				</tr>
  			</tbody>
  		</table>
      </form:form>
  		<div class="error"><span></span></div>
  	</div>
  </div>		 	  
  <!-- 修改弹窗DIV end -->
</body>
<script type="text/javascript">
	function loadInfo(){
		$.post("sysRoleController//searchSingleById.do",null,function(msg){
	        var json_str = eval("("+msg+")"); 
	        //var singleRole = json_str.singleRole;
	        //$("#load_role").val(singleRole.roleName);
	       }
	    )
	}
	
    function addRoles(){
	  art.dialog({
		title:"新增角色",
		padding:'10px 15px',  //这是内补丁，默认为10px
		content: document.getElementById('roleDiv'),
		lock:true,   //这表示是否出现背景遮罩层
		// window:'top',
		opacity:0.5,  //这表示遮罩层的背景透明度，默认这个数值
		id:'newClass', //加了id可以防止多次弹出同一个窗口
		ok: function () {
			var roleName= $.trim($("#roleName").val()); 
            var roleDesc= $("#roleDesc").val();
            
            if(roleName.length==0){
              $("#roleDiv .error").css({"display":"block"});
              $('.error span').html('请输入员工角色名称！');
              return false;
            }
            if(roleDesc.length==0){
              $("#roleDiv .error").css({"display":"block"});
              $('.error span').html('请输入角色描述！');
              return false;
            }
            $("#addRoleForm").submit();
        },
        cancelVal:'取消',
        cancel:true
		
	   });
	}
    
    function delRoles(roleId){
    	if(confirm("请确认是否删除!")){
    		$.get("/sysRoleController/deleteSysRole/"+roleId+".do",null,function(){
    			window.location.href="/sysRoleController/findSysRoleListByPage/0.do";
    		});
    	}
    }
    function modifyRoles(roleId){
    	$.post("/sysRoleController/modifySingle.do",{roleId:roleId},function(msg){
            var json_str = eval("("+msg+")"); 
            var singleRole = json_str.singleRole;
            $("#mod_roleName").val(singleRole.roleName);
            $("#mod_roleDesc").val(singleRole.roleDesc);
            
           
            art.dialog({
            title:"修改",
            padding:'10px 15px',  //这是内补丁，默认为10px
            content: document.getElementById('roleModifyDiv'), 
            lock:true,   //这表示是否出现背景遮罩层
            opacity:0.5,  //这表示遮罩层的背景透明度，默认这个数值
            id:'newCla', //加了id可以防止多次弹出同一个窗口
            ok: function () {
                var deptname= $.trim($("#mod_roleName").val()); 
                var roleDesc= $.trim($("#mod_roleDesc").val());
                
                if(deptname.length==0){
                  $("#roleModifyDiv .error").css({"display":"block"});
                  $("#roleModifyDiv .error span").html("请输入要修改的部门名称！");
                  return false;
                }
                if(roleDesc.length==0){
                  $("#roleModifyDiv .error").css({"display":"block"});
                  $("#roleModifyDiv .error span").html("请选择员工所在上级部门！");
                  return false;
                }
                $("#modify_roleid").val(roleId);
                $("#midifyRoleForm").submit();
                
                },
                cancelVal:'取消',
                cancel:true
              });
            
            });
    }
    
    function schRoles(){
    	var rolesNames= $.trim($("#roName").val());	
    	window.location.href="/sysRoleController/findSysRoleListByPage/0.do?roleName="+rolesNames+"";
    }
  </script>
  <script type="text/javascript" src="<%=basePath%>/script/jquery.artDialog.source.js"></script>
  <script src="<%=basePath%>/script/iframeTools.source.js"></script> 
</html>
