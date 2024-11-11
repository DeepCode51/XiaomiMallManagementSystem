<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <style type="text/css">
    a:hover{
        text-decoration: none;
    }
      #top{
      width:100%;
         height: 100px;
      background-color:#fff;
      } 
      #top h1{
      color:#1590A4;
       line-height: 100px;
      margin-left:240px;
      }
     #top h3{
     margin-left:1200px;
      margin-top:-50px;
      color:#17A2B8;
      font-size:18px;
     }
      #top h2{
     margin-left:1000px;
      margin-top:-50px;
      color:#17A2B8;
      font-size:20px;
     }
    </style>
   
    <title>个人中心</title>
</head>
<body>
   
  <div id="top">
  <h1>小米商城后台管理中心</h1>
   <c:if test="${not empty sessionScope.admin_name}"><h3>欢迎您，${sessionScope.admin_name }  <a href="logout?type=A">注销登录</a></h3></c:if> 
       <c:if test="${empty sessionScope.admin_name}"><%response.setHeader("Refresh","1; url=AdminLogin.jsp");%><h2>请先登录，1秒后跳转至登录页面</h2> </c:if> 
  </div>
    
    <div class="row no-gutters">
        
          <div class="list-group col-2">
            <a href="FindAdminInfo" class="list-group-item" target="i1">管理员信息</a>
            <a href="getGoodstypelist" class="list-group-item"  target="i1">添加商品</a>
            <a href="AdminAllGoods?pageNo=1" class="list-group-item"  target="i1">商品信息</a>
             <a href="adminGetAllOrder?pageNo=1&type=-1" class="list-group-item"  target="i1">订单管理</a>
        
            <a href="index" class="list-group-item">返回首页</a>
          </div>
          
        <div class="col-10 embed-responsive embed-responsive-16by9">
            <iframe src="FindAdminInfo"  class="embed-responsive-item" name="i1"></iframe>
        </div>

    </div>

<script>
    var a=$(".list-group-item")
    a.on("mouseover",function(){
        $(this).addClass("active")
    });
    a.on("mouseout",function(){
        $(this).removeClass("active")
    });
    if(window.parent != window){
	window.parent.location.reload(true);
		}
    </script>
</body>
</html>
