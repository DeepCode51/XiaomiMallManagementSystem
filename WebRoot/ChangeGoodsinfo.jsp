<%@ page language="java" import="java.util.*,beans.GoodsBean" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
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
    height: 630px;
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
img{
  width: 50px;
    height: 50px;
}
#file{
 margin-top: 5px;
 margin-left: 60px;
}
    </style>
</head>
<body>
  
  
   <div id="content">

    <form action="AddGoods?ctype=B" method="post" class="form-horizontal" enctype="multipart/form-data">
     
<div class="form-group no-gutters row">
            <label for="gid" class="col-sm-2 control-label" >编号：</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="gid" value="${goods.gid}" readonly>
            </div> 
            <label for="title" class="col-sm-2 control-label">标题：</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="title" value="${goods.gname}">
            </div> 
            <label for="trait" class="col-sm-2 control-label"  >副标题：</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="trait" value="${goods.trait}">
            </div> 
            <label for="price" class="col-sm-2 control-label" >价格：</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="price" value="${goods.gprice}">
            </div>
            <label for="type" class="col-sm-2 control-label">种类：</label>
             <select  name="type" class="form-control col-sm-10">         
                 <option value="${goods.type}">${goods.type_name}</option>
             </select>
             
            <label for="subtitle" class="col-sm-2 control-label">简介：</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="subtitle" value="${goods.subtitle}">
            </div>
            <label for="edition" class="col-sm-2 control-label">版本：</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="edition" value="${goods.edition}">
            </div>
            <label for="color" class="col-sm-2 control-label">颜色：</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="color" value="${goods.color}">
            </div>
            <label for="price" class="col-sm-2 control-label">图片：</label>
            
            <div class="col-sm-10">
             <img src="${goods.gimg}" />
             <input type="file" name="file"   >
            </div>
            <button type="submit"  class="btn btn-info" id="file">提交修改</button>
    
      
  </div>
</form>
</div>
</body>
</html>