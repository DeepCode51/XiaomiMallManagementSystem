<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="css/bootstrap.css"/>
       <script src="js/jquery-3.5.1.min.js"></script>
    <title>Document</title>
    <style type="text/css">
#content{
    width: 40%;
    margin-left: 50px;
    background-color: #fff;
    height: 550px;
    border-radius: 5px;
    
}

form{
    margin: 0 auto;
    width: 80%;
}
div,label,select{
    margin-top: 20px;
}
button{

    margin-left: 70px;
    margin-top:30px;
 
}

body{
  background-color:#999;
background-image: url(img/bcimg.png);
}
#addedition{
 position: absolute;
 left: 700px;
 top: 100px;
  width: 30%;
  background-color: #fff;
  padding: 0 30px;
  border-radius: 5px;
height: 400px;
display: none;
}
#addedition h2{
  font-size: 18px;
  margin-top: 30px;
}
.tj{
  margin-left: 10px;
 
}
.add{
  width: 100px;
  height: 40px;
  margin-top: 30px;
}

    </style>
</head>
<body>
  
  
   <div id="content">

    <form action="AddGoods?ctype=A" method="post" class="form-horizontal" enctype="multipart/form-data">
     
<div class="form-group no-gutters row">
  
            <label for="title" class="col-sm-2 control-label">标题：</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="title">
            </div> 
            <label for="trait" class="col-sm-2 control-label">副标题：</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="trait">
            </div> 
            <label for="price" class="col-sm-2 control-label">价格：</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="price">
            </div>
            <label for="type" class="col-sm-2 control-label">种类：</label>
             <select  name="type" class="form-control col-sm-10">
               <c:forEach items="${list}" var="listitem"  varStatus="status">
                 <option value="${listitem.gid}">${listitem.type}</option>
               </c:forEach>
             </select>
             
            <label for="subtitle" class="col-sm-2 control-label">简介：</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="subtitle">
            </div>
            <label for="edition" class="col-sm-2 control-label">版本：</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="edition">
            </div>
            <label for="color" class="col-sm-2 control-label">颜色：</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="color">
            </div>
            <label for="price" class="col-sm-2 control-label">图片：</label>
            <div class="col-sm-10">
              <input type="file"  name="gimg"   >
            </div>
            <button type="submit"  class="btn btn-info">提交添加</button>
             <div class="btn btn-info add" onclick="show()" style="margin-left: 20px">添加种类</div>
      
  </div>
</form>
</div>
<div id="addedition">
  <h2>添加商品种类</h2>
  <div class="form-group">
    <label for="type_id">编号</label>
    <input type="text" class="form-control" id="type_id" placeholder="请输入种类编号，例如”A“,”BD“">
  </div>
  <div class="form-group">
    <label for="name">名称</label>
    <input type="text" class="form-control" id="name" placeholder="请输入种类名称">
  </div>
  <button class="btn btn-info tj" onclick="add()" >提交添加</button>
</div>

</body>
<script>
function show(){
  $("#addedition").css('display','block')
}
function add(){
   var type_id=$("#type_id").val();
    var name=$("#name").val();
    var xhr=new XMLHttpRequest();
    xhr.onreadystatechange=function(){
			if(xhr.readyState==4&xhr.status==200){
				var result=xhr.responseText;
				if(result=="1"){
          alert("添加成功")
          window.location.href="getGoodstypelist";
        }else if(result=="-1"){
          alert("商品编号已存在，请重试")
        }else{
          alert("添加失败，请重试")
        }
			}
		}
		xhr.open("post","addGoodsType",true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded")
        var frmdate="type_id="+type_id+"&name="+name;
		xhr.send(frmdate);
}
</script>
</html>