<%@ page language="java" import="java.util.*,beans.UserBean" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showUserInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script src="js/jquery-3.5.1.min.js"></script>
  </head>
  
  <body>
<%UserBean user=(UserBean)request.getAttribute("userinfo");%>
<ul class="list-group">
  <li class="list-group-item list-group-item-success">账号:${userinfo.uid}</li>
  <li class="list-group-item list-group-item-info">姓名:${userinfo.uname }</li>
  <li class="list-group-item list-group-item-info">手机号:${userinfo.uphone }</li>
 
</ul>



  </body>
  <script>
    var a=$(".list-group-item")
    a.on("mouseover",function(){
        $(this).addClass("active")
    });
    a.on("mouseout",function(){
        $(this).removeClass("active")
    });
    </script>
</html>
