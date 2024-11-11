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
    
    <title>My JSP 'AdminAllGoods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/bootstrap.css"/>
	<script src="js/jquery-3.5.1.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">

   function ChangeGoods(gid){
  
				var xhr=new XMLHttpRequest;
				xhr.onreadystatechange=function(){
					if(xhr.readyState==4&xhr.status==200){
						var result=xhr.responseText;
						if(result==1){
							
							window.location.reload();
						}else if(result==-1){
							alert("暂无权限");
						}else{
						alert("禁用失败");
						}
					}
				}
				xhr.open("get","ChangeGoods?gid="+gid+"&type=A",true)
				xhr.send();
			}
  </script>
<style type="text/css">
	ul li{
	float:left;
	list-style:none;
	margin-left:10px;
	}
	#pagination{
	width:30%;
	margin:0 auto;
	}
a:hover{
   text-decoration:none;
    color: #fff;
   }  
   a{
   text-decoration:none;
    color: #fff;
   }
   img{
   width:50px;
   height:50px;
   }
	</style>
  </head>
  
  <body>
   <table class="table table-hover">
  <thead>
 
  <tr>
  <th>商品编号</th>
   <th>名称</th>
  <th>图片</th>
  <th>价格</th>
  <th>上架时间</th>
  <th>管理员</th>
  <th>操作</th>
  </tr>
    </thead>
    <tbody >
  <c:forEach items="${goodslist}" var="goodsItem"   varStatus="status" >
  
<tr>
<td>${goodsItem.gid}</td>
<td>${goodsItem.gname}</td>
<td><img src="${goodsItem.gimg}"/></td>
<td>${goodsItem.gprice}</td>
<td>${goodsItem.date}</td>
<td>${goodsItem.admin}</td>
<td>
 <c:if test="${goodsItem.status==1}"><button type="button" onclick="ChangeGoods('${goodsItem.gid}')" class="btn btn-danger">已下架</button>
 <a href="ChangeGoods?gid=${goodsItem.gid}&type=B" class="btn btn-success" role="button" target="i1">修改信息</a>
 </c:if> 
 <c:if test="${goodsItem.status==0}"><button type="button" onclick="ChangeGoods('${goodsItem.gid}')" class="btn btn-success">下架</button>
 <a href="ChangeGoods?gid=${goodsItem.gid}&type=B" class="btn btn-success" role="button" target="i1">修改信息</a>
 </c:if> 
</td>
</tr>
  </c:forEach>
  </tbody>
</table>
<div id="pagination">
  <ul>
    <c:if test="${pageNo==1}"><li>上一页</li></c:if> 
   <c:if test="${pageNo!=1}"><li><a href="AdminAllGoods?pageNo=${pageNo-1}" style="color:black">上一页</a></li></c:if> 
    <c:if test="${pageNo>=Count}"><li>上一页</li></c:if> 
   <c:if test="${pageNo<Count}"><li><a href="AdminAllGoods?pageNo=${pageNo+1}" style="color:black">下一页</a></li></c:if> 
  </ul>
</div>
  </body>
</html>
