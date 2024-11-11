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
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <title>Document</title>
    <style>
        #t{
            width: 150px;
        }
         a{
            text-decoration:none;
            color: #FF6700;
        }
         a:hover{
            text-decoration:none;
            color: #FF6700;
        }
    </style>
</head>
<body>
    <table class="table table-hover">
        <tr>
            <td id="t">账号：</td>
            <td>${user.uid}</td>
            <td></td>
        </tr>
        <tr>
            <td>姓名：</td>
          <c:if test="${not empty user.uname}"> <td>${user.uname}</td></c:if>
          <c:if test="${empty user.uname}"> <td><a href="uinfo?type=1">添加</a></td></c:if>
            <td><a href="uinfo?type=1">修改</a></td>
        </tr>
        <tr>
            <td>手机号：</td>
           <c:if test="${not empty user.uphone}"> <td>${user.uphone}</td></c:if>
          <c:if test="${empty user.uphone}"> <td><a href="uinfo?type=1">添加</a></td></c:if>
       
            <td><a href="uinfo?type=1">修改</a></td>
            
        </tr>
        
        <tr>
            <td>收货地址：</td>
            <c:if test="${not empty user.uaddress}"> <td>${user.uaddress}</td></c:if>
          <c:if test="${empty user.uaddress}"> <td><a href="uinfo?type=1">添加</a></td></c:if>
            
            <td><a href="uinfo?type=1">修改</a></td>
        </tr>
        <tr>
            <td>余额：</td>
          
           <td>${user.wallet}</td>
            
            <td><a href="addmoney.html?uid=${user.uid}">充值</a></td>
        </tr>
    </table>
</body>
</html>