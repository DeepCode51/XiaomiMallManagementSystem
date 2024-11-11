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
    <script src="js/jquery-3.5.1.min.js"></script>
    <title>Document</title>
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
     border-bottom: 2px solid #FF6700 ;
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
          padding-top: 20px;
     
      }
      #msg{
          padding-top: 50px;
        
      }
      #msg p{
          color: #666;
          font-size: 12px;
      }
      #top_ul h3{
          margin-left: 40px;
      }
      #top_right{
          padding-top: 45px;
          margin-left: 600px;
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
    #order{
        width: 80%;
        background-color: #fff;
        margin: 0 auto;
        height:360px;
    }
    #order_top>div>h3{
        font-size: 30px;
    }
    #order_top{
        width: 100%;
        height: 100px;
    }
    #order_top1{
        float: left;
        margin-left: 100px;
    }
    #order_top2{
        float: right;
        margin-right: 50px;
        margin-top: 20px;

    }
    #order_top2 span{
        color: #FF6700;
    }
    hr{
        width: 88%;
        margin-left: 100px;
    }
    #order_content p{
        margin-left: 100px;
    }
    #order_content p span{
        color: #FF6700;
    }
    #order_content div{
        width: 70%;
        margin: 0 auto;
        position: relative;
        top: -35px;
    }
   #oname{
   margin-left:60px;
   }
   #umn{
   margin-top:-30px;
   }
  #order_pay1{
    margin-left:100px;
  }
  #choosepay{
  width:80%;
  margin:0 auto;
  }
  #choosepay div{
      float: left;
      margin-left: 50px;
  }
  .pays{
  width:150px;
  height:100px;
  border:1px solid #999;
 background-image: url(img/index/logo.png);
 background-size: 50px 50px;
 background-repeat: no-repeat;
 background-position-y: center;
 background-position-x: 20px;
 padding-left: 80px;
 padding-top: 35px;
  }
  .pays:hover{
      border-color: #FF6700;
  }
  .active{
    border-color: #FF6700;
  }
  #gopay{
clear: both;
width: 100px;
height: 50px;
background-color: #FF6700;
line-height: 50px;
border: none;
color: #fff;
margin-top: 160px;
margin-left: -450px;
  }
  #gopay a{
      color: #fff;
      width: 100px;
height: 50px;
  }
  #wx{
   background-image: url(img/index/wx.png);
  }
  #zfb{
   background-image: url(img/index/zfb.png);
  }
    </style>
</head>
<body>
<c:if test="${orderinfo.oprice==0}"><h1 style="color:red">请勿重复提交相同订单,<a href="getAllorder?type=0">点击查看未完成订单</a></h1></c:if>
<c:if test="${orderinfo.oprice!=0}">
    <div id="cartdisply">
        <div id="top">
            <div id="logo"><img src="img/index/logo.png" alt=""></div>
            <div id="top_ul">
                <h3>支付订单</h3>
            </div>
            <div id="top_right">
                 <a href="ucenter.jsp">个人中心</a>
            </div>
          
         </div>
         <div id="clear">&nbsp</div>
         <div id="order">
             <div id="order_top">

             <div id="order_top1"><h3>订单提交成功，请尽快付款</h3></div>
             <div id="order_top2"><h5>应付总金额<span id="sumprice">${orderinfo.oprice}</span>元</h5></div>
                                 
             </div>
             <hr>
             <div id="order_content">
                  <p>订 &nbsp单 &nbsp号   :<span id="oid">${orderinfo.oid}</span></p>
                  <p>收货信息&nbsp:${orderinfo.uname} ${orderinfo.ophone} ${orderinfo.oaddress}</p>
                  <p>商品名称: </p><div id="oname">${orderinfo.oname}</div>
                  <p id="umn">商品数量:${orderinfo.onum}</p>
                  <p>订单状态:${orderinfo.status==0?'待付款':orderinfo.status==1?'处理中':'已完成'}</p>
              
             </div>
         </div>
         
         <div id="order">
             <div id="order_pay">
             <div id="order_pay1"><h3>请选择支付方式</h3></div>                            
             </div>
             <hr>
             <div id="choosepay">
                <div class="pays" id="yue" onclick="show1(this)">
                   <h3>余额支付</h3>
                  <h5>9.8折</h5>
                </div>
                <div class="pays" id="wx" onclick="show(this)">
                    <h3>微信支付</h3>
                    <h5>暂不支持</h5>
                 </div>
                 <div class="pays"id="zfb" onclick="show3(this)">
                    <h3>支付宝支付</h3>
                 </div>
             </div>
            <a href="javascript:void(0)" id="zhifu"><button id="gopay">确认支付</button></a>
         </div>
        </div>
        </c:if>
</body>
<script>
     function show3(obj){
         if($(obj).hasClass("active")){
            $(obj).removeClass("active")
         }else{
            
            $(obj).parent().children().each(function(obj){
                $(this).removeClass("active")
            })
            $(obj).addClass("active");
           
            //$('#zhifu').attr('href','pay?type='+ $(obj).prop("id")+'&price='+$("#sumprice").text()+'&oid='+$("#oid").text())
          $('#zhifu').attr("href",'http://39.107.118.145:8080/alipay.trade.page.pay-JAVA-UTF-8/alipay.trade.page.pay.jsp?WIDout_trade_no='
            +$("#oid").text()+'&WIDsubject='+$("#oid").text()+'&WIDtotal_amount='+$("#sumprice").text()+'&WIDbody=123')
         }
        
     }
     function show1(obj){
         if($(obj).hasClass("active")){
            $(obj).removeClass("active")
         }else{
            
            $(obj).parent().children().each(function(obj){
                $(this).removeClass("active")
            })
            $(obj).addClass("active");
           
            $('#zhifu').attr('href','pay?type='+ $(obj).prop("id")+'&price='+$("#sumprice").text()+'&oid='+$("#oid").text())
          //$('#zhifu').attr("href",'http://39.107.118.145:8080/alipay.trade.page.pay-JAVA-UTF-8/alipay.trade.page.pay.jsp?WIDout_trade_no='
           // +$("#oid").text()+'&WIDsubject='+$("#oid").text()+'&WIDtotal_amount='+$("#sumprice").text()+'&WIDbody=123')
         }
         
       
     }
   /*var url=window.location.search
  url=url.split('?')[1];
  url=url.split('&');
  var oid=url[0].split('=')[1];
  window.location.search='?oid='+oid+'&type=1'*/
		 
</script>
</html>