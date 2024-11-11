<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addGoodsinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <c:if test="${msg=='0'}"><h1 style="color:red">未知错误,修改失败</h1></c:if> 
    <c:if test="${msg=='1'}"><h1 style="color:red">修改成功</h1></c:if> 
    <c:if test="${msg=='-1'}"><h1 style="color:red">请上传图片</h1></c:if> 
    2秒后返回至商品管理页，若浏览器没有跳转请<a href="AdminAllGoods?pageNo=1">点击此处</a>
    <%response.setHeader("Refresh","2; url=AdminAllGoods?pageNo=1");%>
  </body>
</html>
