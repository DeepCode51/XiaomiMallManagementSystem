<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" href="css/index.css"/>
		<link rel="stylesheet" href="css/head.css"/>
		<link rel="stylesheet" href="css/foot.css"/>

		<title>小米商城</title>
			<script src="js/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
		   $(function(){
			   var timer = null; 
			var index = 0;	
			$(".next").click(function(){ 
				next();
			});
			$(".prev").click(function(){ 
				prev();
			})
			function next(){
				index++;
				if(index > 4){
					
					 $(".pic-list").animate({left:-(index)*1920},500); 
					 index = 0;
					 $(".pic-list").animate({left:0},0); 
				}
				$(".pic-list").animate({left:-index*1920},500);
				iconHover(index);
			}
			function prev(){
				index--;
				if(index < 0 ){
					index = 4;
					$(".pic-list").animate({left:-(index)*1920},10);
				}
				$(".pic-list").animate({left:-index*1920},500);
				iconHover(index);
			}
			function auto(){ 
				timer = setInterval(function(){ 
					next();
					iconHover(index);
			},3000) 
			}
			auto();
			$("#slide").mouseover(function(){ 
				clearInterval(timer);
				$('.btn').css("opacity",0.7)
			})
			$("#slide").mouseleave(function(){ 
				auto();
				$('.btn').css("opacity",0)
			})
		
			$(".icon-list li").mouseover(function(){ 
				var index = $(this).index();
				$(".pic-list").animate({left:-index*1920},500);
				iconHover(index);
			})
			
			function iconHover(index){
				$(".icon-list li").eq(index).addClass("active").siblings().removeClass("active");
			}

			   
			   
		   });

		</script>
		<style type="text/css">

		a{text-decoration: none;
		  color: white;}
		  a:hover{text-decoration: none;
		  color: white;

		  }
		#logo{
			width: 60px;
			height: 60px;
		}
		.ipt{
			position: relative;
			left: 150px;
		}
		#line2 h2{
		position: absolute;
		top: 65px;
		left: 250px;

		}
       .text img{
		   width: 190px;
		   height: 200px;
		   margin-left: 370px;
		   margin-top: -150px;
		 
	   }
	   .text h3{
		
		   margin-left: 100px;
		   margin-top: 60px;
		  
	   }
	  #topimg{
		position: relative;
    left: 18%;
	  }
	 
	 h1{
		 color: black;
		 margin-left:45%;
		 margin-top: 20px;
		 font-size: 40px;
	 }

	 .goods img{
		 width: 260px;
		 height: 330px;
		 margin-left: 110px;
		 margin-top: 75px;
	 }
	 .goods p{
		 text-align: center;
		 margin: 0 auto;
		 font-size: 20px;
		 margin-top: 10px;
	 }
	 .goods h3{
		 text-align: center;
		 margin: 0 auto;
		 font-size: 35px;
		 color: black;
		 font-weight:bold;
		 margin-top: 35px;
	 }
	 .goods{
		 background-color: #fff;
		 height: 650px;
		 border-radius: 15px;
		 margin-top: 30px;
		 
	 }
	
	 .row{
		 width: 67%;
		 margin: 0 auto;
	 }
	 .price{
		 border: 3px solid black;
		 width: 200px;
		 height: 43px;
		 border-radius: 200px;
		 margin-left:100px;
		 margin-top: 40px;
	 }
	 .price h4{
		 color: black;
		 margin-left: 15px;
		 font-size: 30px;
		 font-weight:bold;
	 }
	 .price p{
		color: black;
		 margin-left: 30px;
		 margin-top: -37px;
		 font-size: 20px; 
		 
	 }
	 .go{
		 background-color: black;
		 border: 3px solid black;
		 width: 130px;
		 height: 43px;
		 border-radius: 200px; 
		 color: #fff;
		 text-align: center;
		 margin-top: -43px;
		 margin-left: 230px;
	 }
	 .go a{
		 color: #fff;
	 }
	 .go h4{
	    margin-top:3px;
	 }
	.ipt{
	background-color:#fff;
	}
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
          margin-left: 40px;
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
		</style>
	</head>
	<body>
		<div id="common_head">
	<div id="line1">
		<div id="content">
			<c:if test="${empty sessionScope.uid}"><span><a href="login.jsp">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="regist.jsp">注册</a></span></c:if>
			<c:if test="${not empty sessionScope.uid}">欢迎你，${sessionScope.uid}&nbsp&nbsp&nbsp<a href="logout?type=B">注销登录</a></c:if>
		</div>
	</div>
	<div id="top">
   <div id="logo"><img src="img/index/logo.png" alt=""></div>
   <div id="top_ul">
       <ul>
           <li><a href="">首页</a></li>
           <li><a href="Search?keyward=全部商品">全部商品</a></li>
           <li><a href="ucenter.jsp">个人中心</a></li>
           <li><a href="">我的订单</a></li>
           <li><a href="goodsCart">购物车</a></li>
           <li><a href=""></a></li>
           <li><a href="">路由器</a></li>
           <li><a href="">智能硬件</a></li>
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


</div>
<div id="index">
		
<div id="slide">
		<ul class="pic-list">
			<li><img src="img/index/banner_big1.jpg"/></li>
			<li><img src="img/index/banner_big2.jpg"/></li>
			<li><img src="img/index/banner_big3.jpg"/></li>
			<li><img src="img/index/banner_big4.jpg"/></li>
			<li><img src="img/index/banner_big5.jpg"/></li>
		</ul>
		<div class="btn next"><p>&gt;</p></div>
		<div class="btn prev"><p>&lt;</p></div>
		<ul class="icon-list">
			<li class="active"></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
</div>  
         <h1>热卖推荐</h1>
         <img src="img/index/top.jpg" id="topimg" alt="">
        <div class="row">
         <c:forEach items="${GoodsList}" var="GoodsListItem"  varStatus="status">
             <div class="col-6">
				 <div class="goods">
					<img src="${GoodsListItem.gimg }" alt="">
					<h3>${GoodsListItem.gname}</h3>
					<p>${GoodsListItem.gname}</p>
					<div class="price"><h4>${GoodsListItem.gprice}</h4><p>起</p></div>
					<div class="go"><h4><a href="SearchGoods?gid=${GoodsListItem.gid}">立即抢购</a></h4></div>
				 </div>
				 
			 </div>
	   </c:forEach> 
			 
			 
		</div>			
 
			
			<div id="line5">
				<span id="line5_1">
					<img src="img/index/icon_g1.png"/> &nbsp;&nbsp;品质护航 购物无忧
				</span>
				<span id="line5_2">
					<img src="img/index/icon_g2.png"/>&nbsp;&nbsp;7天无理由退换货 
				</span>
				<span id="line5_3">
					<img src="img/index/icon_g3.png"/>&nbsp;&nbsp;特色服务体验
				</span>
				<span id="line5_4">
					<img src="img/index/icon_g4.png"/>&nbsp;&nbsp;帮助中心
				</span>
			</div>
		</div>
		<div id="common_foot">
	<p>
		 浙江财经大学东方学院 18电商1班 CAIJIE
	
	</p>
        </div>
	</body>
</html>
