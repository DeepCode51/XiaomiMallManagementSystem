<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <script src="js/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <title>全部商品</title>
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
          margin-left: 120px;
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
    #filter{
        width: 100%;
        height: 80px;
        background-color: #fff;
        padding-top: 18px;
    }

    #filter div{
        float: left;
    }
    #filter_left{
        margin-left: 150px;
        font-size: 16px;
        color: #666;
        line-height: 40px;
    }
    #fil_right{
        font-size: 16px;
        color: #111;
        line-height: 40px;  
    }
    #fil_right ul li{
list-style: none;
float: left;
margin-left: 90px;
    }
#btn{
    background-color: #fff;
    border: none;
   
}
#btn a{
    color: #666;
    font-size: 14px;
}

#content{
    width: 80%;
    margin: 0 auto ;
    margin-top: 30px;

}
.goods {
background-color: #fff;
height: 430px;
 margin-top: 30px;
 float:left;
width:280px;
 margin-left:20px;
}
.goods a{
    width: 100%;
    height: 400px;
}
#img img{
    width: 200px;
    height:200px ;
}
#img{
    margin-left: 50px;
    margin-top: 50px;
}
.goods a h2{
    margin: 0 auto;
    color: #757575;
    width: 230px;
    font-size: 16px;
    font-weight: 400;
    overflow: hidden;
    text-align: center;
}
.goods a p{
    width: 230px;
    font-size: 14px;
    text-align: center;
    margin: 0 auto;
    color: #FF6700;
    margin-top: 10px;

}

#img2{
width: 36px;
height: 36px;
border: 1px solid #999;
margin: 0 auto;
margin-top: 40px;
}
#img2:hover{
    border: 1px solid #FF6700;
}
#img2 img{
    width: 34px;
height: 34px;
}
.goods:hover{
    box-shadow: 0px 0px 10px 1px  #999;
    transition:   0.5s;
}
.goods:hover #h{
    color: #FF6700;
    transition:   0.3s;
}


    </style>
   
</head>
<body>
 <div id="top">
   <div id="logo"><img src="img/index/logo.png" alt=""></div>
   <div id="top_ul">
       <ul>
           <li><a href="index">首页</a></li>
           <li><a href="Search?keyword=全部商品">全部商品</a></li>
           <li><a href="ucenter.jsp">个人中心</a></li>
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
<div id="container">
    <div>
        <a href="index">首页</a>>
        <a href="search?keyword=全部商品">全部商品</a>>
        <a href="javascript:void(0)">全部结果</a>
    </div>
</div>
<div id="filter">
  <div id="filter_left">
      <p>分类：</p>
  </div>
  <div id="fil_right">
         <ul>
            <li><a href="index">首页</a></li>
            <li><a href="Search?keyword=全部商品">全部商品</a></li>
            <li><a href="Search?keyword=手机">手机</a></li>
            <li><a href="Search?keyword=显示器">显示器</a></li>
            <li><a href="Search?keyword=笔记本">笔记本</a></li>
            <li><a href="Search?keyword=智能家居">智能家居</a></li>
            <li><a href="Search?keyword=路由器">路由器</a></li>
            <li id="btn"><a href="javascript:void(0)">更多</a></li>
         </ul>
        
  </div>
</div>
<div id="content" class="" >
   <c:forEach items="${GoodsList}" var="GoodsList"  varStatus="status">
   <div class="goods ">
       <a href="SearchGoods?gid=${GoodsList.gid }">
           <div id="img"><img src="${GoodsList.gimg }" alt=""></div>
           <h2 id="h">${GoodsList.gname }</h2>
           <p>${GoodsList.gprice}元</p>
           <div id="img2">
            <img src="${GoodsList.gimg }" alt="">
           </div>
       </a>
    </div>
   
 </c:forEach>
   
   
</div>
</body>
</html>