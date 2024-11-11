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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
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

   img{
   width:50px;
   height:50px;
   }
</style>
  </head>
  
  <body>
     <table class="table table-hover">
    <tr>
    <th>订单号</th>
    <th>收货信息</th>
    <th>商品信息</th>
    <th>价格</th>
    <th>数量</th>
	<th><select id="sel" >	
	<option value="-1">全部订单</option>
	<option value="0">待支付</option>
	<option value="1">待发货</option>
	<option value="2">待签收</option>
	<option value="3">已完成</option>
	<option value="4">已退款</option>
	</select></th>
    </tr>
     <c:forEach items="${orderlist}" var="olist" >
     <tr>
     <td> ${olist.oid}</td>
     <td> ${olist.uname}<br>${olist.ophone}<br>${olist.oaddress}</td>
     <td> ${olist.oname}</td>
     <td> ${olist.oprice}</td>
     <td> ${olist.onum}</td>
     <c:if test="${olist.status==1}"><th><a href="javascript:void(0)" onclick="deliver('${olist.oid}')">发货</a>
<a href="javascript:void(0)" onclick="refund('${olist.oid}','${olist.uid}')" target="_parent">退款</a></th></c:if>
     <c:if test="${olist.status==0}"><th>待支付</th></c:if>
      <c:if test="${olist.status==2}"><th>已发货</th></c:if>
      <c:if test="${olist.status==3}"><th>已完成</th></c:if>
      <c:if test="${olist.status==4}"><th>已退款</th></c:if>
     </tr>
    
     </c:forEach>
      </table>
      <div id="pagination">
  <ul>
    <c:if test="${pageNo==1}"><li>上一页</li></c:if> 
   <c:if test="${pageNo!=1}"><li><a href="adminGetAllOrder?pageNo=${pageNo-1}&type=${type}" style="color:black">上一页</a></li></c:if> 
    <c:if test="${pageNo>=Count}"><li>上一页</li></c:if> 
   <c:if test="${pageNo<Count}"><li><a href="adminGetAllOrder?pageNo=${pageNo+1}&type=${type}" style="color:black">下一页</a></li></c:if> 
  </ul>
</div>
  </body>
  <script>
  	function deliver(oid){
  		var sid=prompt("请输入快递单号");
  		var xhr=new XMLHttpRequest;
				xhr.onreadystatechange=function(){
					if(xhr.readyState==4&xhr.status==200){
						var result=xhr.responseText;
						if(result==1){
						  window.location.reload();
						}
						
					}
				}
				xhr.open("get","ChangeOrder?oid="+oid+"&type=1&sid="+sid,true)
				xhr.send();
  	}
  	function refund(oid,uid){
  		var xhr=new XMLHttpRequest;
				xhr.onreadystatechange=function(){
					if(xhr.readyState==4&xhr.status==200){
						var result=xhr.responseText;
						if(result==1){
						function tip(){var bg = '#333'; if(arguments[1]==1){bg = '#333'};$('_tip').remove();$('body').append("<div class='_tip' style='z-index:99999;opacity:0.9;text-align:center;width:100%;bottom:20%;position:fixed;'><div style='word-wrap:break-word;color:#fff;max-width:80%;padding:5px 10px;display:inline-block;background:"+bg+";border-radius:7px;font-size:20px;'>" +arguments[0]+"</div></div>");setTimeout(function(){$('._tip').fadeOut(1000, function() {$(this).remove();});}, 1500);}
          tip("退款请求发送中请稍等")
          setTimeout(function(){window.location.reload();},800)
						
						}
						
					}
				}
				xhr.open("get","ChangeOrder?oid="+oid+"&type=4&uid="+uid,true)
				xhr.send();
  	}
  	$("#sel").change(function(){
  			window.location.href="adminGetAllOrder?pageNo=1&type="+$("#sel option:selected").val();
  		
  	})
  </script>
</html>
