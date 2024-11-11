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
     <link rel="stylesheet" href="css/bootstrap.css"/>
    <title>My JSP 'userorder.jsp' starting page</title>

<style>
a, a:hover {
    text-decoration: none;
}
a {
    background-color: rgba(0,0,0,0);
}</style>
  </head>
  
  <body>
     <table class="table table-hover">
    <tr>
    <th>订单号</th>
    <c:if test="${type==2}"><th>快递单号</th></c:if>
     <c:if test="${type!=2}"><th>收货信息</th></c:if>
    <th>商品信息</th>
    <th>价格</th>
    <th>数量</th>
    <c:if test="${type==0||type==2}"><th>操作</th></c:if>
    </tr>
     <c:forEach items="${olist}" var="olist"  varStatus="status">
     <tr>
     <td> ${olist.oid}</td>
     <c:if test="${type==2}"><td> ${olist.cnumber}</td></c:if>
     <c:if test="${type!=2}"><td> ${olist.uname}<br>${olist.ophone}<br>${olist.oaddress}</td></c:if>
     
     <td> ${olist.oname}</td>
     <td> ${olist.oprice}</td>
     <td> ${olist.onum} </td>
     <c:if test="${type==0}"><th><a href="orderinfo?oid=${olist.oid}&type=1" target="_parent">支付</a>
     <a href="javascript:void(0)" onclick="signfor('${olist.oid}',3)" target="_parent">取消</a></th></c:if>
     <c:if test="${type==2}"><th><a href="javascript:void(0)"  onclick="signfor('${olist.oid}',2)" target="_parent">签收</a></th></c:if>
     </tr>
    
     </c:forEach>
      </table>
  </body>
  <script>
  	function signfor(oid,type){
  		var xhr=new XMLHttpRequest;
				xhr.onreadystatechange=function(){
					if(xhr.readyState==4&xhr.status==200){
						var result=xhr.responseText;
						if(result==1){
						  window.location.reload();
						}
						
					}
				}
				xhr.open("get","ChangeOrder?oid="+oid+"&type="+type,true)
				xhr.send();
  	}
  	
  </script>
</html>
