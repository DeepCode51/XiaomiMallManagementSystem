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
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <script src="js/jquery-3.5.1.min.js"></script>
    <title>小米商城</title>
    <style type="text/css">
    #content{
        width: 70%;
        margin: 0 auto;
        margin-top: 100px;
    }
   #right{
       margin-top: -60px;

   }
   #right h3{
    margin: 0;
    padding: 0;
    font-size: 24px;
    font-weight: 400;
    color: #212121;
   }
   #right p{
    color: #b0b0b0;
    margin: 0;
    padding: 0;
    padding-top: 8px;
    line-height: 1.5;
}
   
   #right h5{
    font-size: 18px;
    line-height: 1;
    color: #ff6700;
    margin-top: 10px;
   }
   #right h4{
    font-size: 14px;
    line-height: 1;
    color: #ff6700;
    margin-top: 10px;
   }
  #right h2{
    color: #333;
    font-size: 14px;
  }
  #edition{
    font-size: 16px;
    text-align: center;
    color: #ff6700;
    border: 1px solid #ff6700;
    width: 350px;
    height: 40px;
    padding: 0 5px;
    padding-top: 5px;
    margin-top: 20px;
    margin-bottom: 20px;
  }
  #price{
      width: 100%;
      height: 130px;
      background: #f9f9fa;
    padding: 30px;
    margin-bottom: 30px;
    color: #616161;
    font-size: 14px;
  }
  #price span{
      float: right;
  }
  #price h1{
    color: #ff6700;
    font-size: 24px;
    padding-top: 20px;
  }
  #gwc{
    width: 298px;
    height: 52px;
    line-height: 52px;
    font-size: 16px;
    background: #ff6700;
    color: #fff;
    border: none;
  }
  #gwc a{
 color: #fff;
 text-decoration: none;
  }
  img{
      width: 500px;
      position: relative;
      left: -100px;
  }
span{
 color: #ff6700;
}
    </style>


</head>
<body>
    <div class="row" id="content">
        <div class="col-6">
            <img src="${goods.gimg }" alt="">
        </div>
        <div class="col-6" id="right">
            <h3>${goods.gname}</h3>
            <p><span >${goods.trait}</span>${goods.subtitle}</p>
             <h4>小米自营</h4>    
            <h5>${goods.gprice}元</h5>
           <hr>
           <!--<h2>配送地址</h2>
           <div id="price" class="row">
               <select name="" id="" class="col-3 form-control">
                   <option value="">请选择</option>
               </select>
               
             
          
              
           </div>
            --><c:if test="${not empty goods.edition}">
           <h2>选择版本</h2>
           <div id="edition">${goods.edition}</div>
           </c:if> 
             <c:if test="${not empty goods.color}">
           <h2>选择颜色</h2>
           <div id="edition">${goods.color}</div>
             </c:if> 
           <div id="price">${goods.edition} ${goods.color} <span>${goods.gprice}元</span>
           <h1>总计${goods.gprice}元</h1></div>
           <button id="gwc"><a href="javascript:void(0);" onclick="cart('${goods.gid}')">加入购物车</a></button>
        </div>
    </div>
   

</body>
<script>
function cart(gid){
  
				var xhr=new XMLHttpRequest;
				xhr.onreadystatechange=function(){
					if(xhr.readyState==4&xhr.status==200){
						var result=xhr.responseText;
						if(result==1){
						if(confirm('添加成功,是否前往购物车')){
						window.location.href="goodsCart";
						}
						}else if(result==0){
						alert('未知错误，添加失败')
						}else if(result==-1){
						if(confirm('请先登录,是否跳转至登录')){
						window.location.href="login.jsp";
						}
						
						}
					}
				}
				xhr.open("get","cart?gid="+gid+"&type=A",true)
				xhr.send();
			}
</script>

</html>