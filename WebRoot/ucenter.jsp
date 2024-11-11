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
    <title>个人中心</title>
      <link rel="stylesheet" href="css/bootstrap.css"/>
    <style>
        a:hover{
            color: #FF6700;
            text-decoration: none;
        }
        body{
            background-color: #F5F5F5;
        }
        a{
            color: #333;
            text-decoration: none;
        }
        
      #top{
background-color: #fff;
width: 100%;
z-index: 20;
    height: 100px;
      }
      #top div{
        float: left;
      }
      #logo{
          width: 56px;
          margin-left: 150px;
          height: 100px;
          padding-top: 20px;
      }
      #logo img{
        width: 56px;
      height: 56px;
      }
      #top_ul{
          height: 100px;
          padding-top: 35px;
     
      }
      #top_ul ul li{
          float: left;
          list-style: none;
          margin-left: 95px;
          font-size: 17px;

      }
      #top_right{
          padding-top: 25px;
          margin-left: 100px;
      }
      #top_right input{
        width: 223px;
    height: 48px;
    padding: 0 10px;
    font-size: 14px;
    line-height: 48px;
    border: 1px solid #e0e0e0;
      }
    #search{

        width: 52px;
    height: 48px;
    border: 1px solid #e0e0e0;
    background: #fff;
    color: #616161;
position: relative;

left: -5px;
    }
    #search:hover{
        background-color: #FF6700;
        color: #fff;
        border: none;
    }
    #container{
        width: 100%;
        height: 30px;
        background-color: #F5F5F5;
        line-height: 15px;
        padding-top: 10px;
        
    }
    #container div{
        margin-left: 150px;
        font-size: 12px;
        

    }
    #container div a:hover{
        color: #FF6700;
    }
    .clear{
        clear: both;
    }
    #center{
        width: 80%;
        margin: 0 auto;
    }
    #center div{
        float: left;
        background-color: #fff;
    }
    #left{
        width: 20%;
        height:  600px;
        padding: 36px 0;
    }
    #right{
        width: 77%;
        margin-left: 3%;
        height: 600px;

    }
    body{
        font: 14px/1.5 Helvetica Neue,Helvetica,Arial,Microsoft Yahei,Hiragino Sans GB,Heiti SC,WenQuanYi Micro Hei,sans-serif;
    }
    .menu-box{
        margin: 0 48px 12px;
    }
    .menu-box h3{
        font-size: 16px;
    font-weight: 400;
    line-height: 52px;
    color: #333;
    margin: 0;
    padding: 0;
    }
    .list{
        margin: 0;
    padding: 0;
    list-style: none;
    }
    .list li{
        padding: 6px 0;
    }
    a, a:hover {
    text-decoration: none;
}
a {
    background-color: rgba(0,0,0,0);
}
iframe{
    width: 100%;
        height: 500px; 
}
    </style>
</head>
<body>
<c:if test="${empty uid}">登录状态失效，请重新登录<%response.setHeader("Refresh","1; url=login.jsp");%></c:if>
<c:if test="${not empty uid}">
    <div id="top">
        <div id="logo"><img src="img/index/logo.png" alt=""></div>
        <div id="top_ul">
            <ul>
                <li><a href="index">首页</a></li>
                <li><a href="Search?keyward=全部商品">全部商品</a></li>
                <li><a href="">个人中心</a></li>
                <li><a href="">我的订单</a></li>
                <li><a href="goodsCart">购物车</a></li>
           
            </ul>
        </div>
        <div id="top_right">
            <form action="Search" method="get">
                <input type="text" name="keyword">
                <button id="search">搜索</button>
            </form>
        </div>
     </div>
     <div class="clear"></div>
     <div id="center">
        <div id="left">
            <div class="menu-box">
              <h3>订单中心</h3>
              <ul class="list">
                <li><a href="getAllorder?type=-1" target="center">全部订单</a></li>
                <li><a href="getAllorder?type=0" target="center">待支付</a></li>
                <li><a href="getAllorder?type=1" target="center">待发货</a></li>
                <li><a href="getAllorder?type=2" target="center">已发货</a></li>
                <li><a href="getAllorder?type=3" target="center">已完成</a></li>
                <li><a href="getAllorder?type=4" target="center">已取消</a></li>
              </ul>
            </div>

            <div class="menu-box">
                <h3>个人中心</h3>
                <ul class="list">
                  <li><a href="uinfo?type=1" target="center"> 修改信息</a></li>
                  <li><a href="transaction_detaile?pageNo=1" target="center">交易明细</a></li>
                </ul>
              </div>

            <div class="menu-box">
                <h3>账户管理</h3>
                <ul class="list">
                  <li><a href="uinfo?type=0" target="center">个人信息</a></li>
                  <li><a href="changeupwd.html" target="center">修改密码</a></li>
                </ul>
              </div>
        </div>
        <div id="right" class="embed-responsive embed-responsive-16by9">
            <iframe src="uinfo?type=0"  class="embed-responsive-item"  name="center"></iframe>
            
        </div>
     </div>
     </c:if>
</body>
<script type="text/javascript">
 if(window.parent != window){
	window.parent.location.reload(true);
		}
</script>
</html>