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
        
    </style>
</head>
<body>
    <table class="table table-hover">
        <tr>
            <td id="t">账号：</td>
            <td><input type="text" id="uid" value="${user.uid}" disabled></td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input type="text" id="uname" value="${user.uname}"></td>
        </tr>
        <tr>
            <td>手机号：</td>
            <td><input type="text" id="uphone" value="${user.uphone}"></td>
        </tr>
        <tr>
            <td>收货地址：</td>
            <td><input type="text" id="uaddress" value="${user.uaddress}"></td>
        </tr>
        <tr>
            <td></td>
            <td> <input type="button"  onclick="chengeinfo()" value="提交修改"></td>
        </tr>
       
    </table>
</body>
<script>
    function chengeinfo(){
       var uid=$("#uid").val();
       var uname=$("#uname").val();
       var uphone=$("#uphone").val();
       var uaddress=$("#uaddress").val();
      
       var xhr=new XMLHttpRequest();
       xhr.onreadystatechange=function(){
               if(xhr.readyState==4&xhr.status==200){
                   var result=xhr.responseText;
                   if(result==1){
               alert("修改成功");
              }else if(result==0){
               alert("修改失败");
             }
               }
           }
           xhr.open("get","changeInfo?uid="+uid+"&uname="+uname+"&uphone="+uphone+"&uaddress="+uaddress,true);
           xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded")
           xhr.send();
        
      }
   </script>
</html>