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
}
	ul li{
	float:left;
	list-style:none;
	margin-left:10px;
	}
	#pagination{
	width:30%;
	margin:0 auto;
	}

</style>
  </head>
  
  <body>
     <table class="table table-hover">
    <tr>
    <th>订单号</th>
    <th>交易类型</th>
    <th>金额</th>
    <th>账户余额</th>
    <th>支付/到账方式</th>
    <th>时间</th>
    </tr>
     <c:forEach items="${transaction}" var="list"  varStatus="status">
     <tr>
     <td> ${list.oid}</td>  
     <c:if test="${list.status==1||list.status==3}"><td>消费</td></c:if>  
     <c:if test="${list.status==2||list.status==4}"><td>退款</td></c:if>
     <c:if test="${list.status==5}"><td style="textalign:center">充值</td></c:if>   

     <td> ${list.oprice}</td>
     <td> ${list.wallet} </td>
      <c:if test="${list.status==1||list.status==2}"><td style="textalign:center">余额</td></c:if>  
     <c:if test="${list.status==3||list.status==4}"><td style="textalign:center">支付宝</td></c:if>  
      <c:if test="${list.status==5}"><td style="textalign:center">支付宝</td></c:if> 
     <td>${list.date}</td>
     </tr> 
     
     </c:forEach>
      </table>
      <div id="pagination">
  <ul>
    <c:if test="${pageNo==1}"><li>上一页</li></c:if> 
   <c:if test="${pageNo!=1}"><li><a href="transaction_detaile?pageNo=${pageNo-1}&type=${type}" style="color:black">上一页</a></li></c:if> 
    <c:if test="${pageNo>=Count}"><li>上一页</li></c:if> 
   <c:if test="${pageNo<Count}"><li><a href="transaction_detaile?pageNo=${pageNo+1}&type=${type}" style="color:black">下一页</a></li></c:if> 
  </ul>
</div>
  </body>
 </html>
