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
  

    <link href="css/cart.css" rel="stylesheet" type="text/css">
    <title>购物车</title>
    <script src="js/jquery-3.5.1.min.js"></script>
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
          padding-top: 35px;
     
      }
      #msg{
          padding-top: 50px;
        
      }
      #msg p{
          color: #666;
          font-size: 12px;
      }
      #top_ul h3{
          margin-left: 35px;
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


    #cart{
        width: 80%;
        background-color: #fff;
        margin: 50px auto;

    }
    #cart_head{
        width: 100%;
        height: 70px;
    line-height: 70px;
    color: #424242;
    }
    #col-check{
        width: 110px;
        height: 70px;
    }
    #all_check{
        width: 10px;
        height: 10px;
        border: solid 1px #999;
    }
    #col_check div{
        float: left;
    }
    #total #total_2 a{
        background-color: #FF6700;
    }
   #clear{
   clear:both
   }
#warp{
    width: 80%;
    background-color: #fff;
    margin: 0 auto;
}
.top>div{
    height: 70px;
    line-height: 70px;
}
.checkbox{
    width: 20px;
    height: 20px;
    border: 1px solid #999;
}
.top1{
    margin-left: 30px;
}
.top1 span{
 margin-left: 20px;

}

.goods{
    height: 125px;
    line-height: 125px;
}
.goimg{
    padding-right: 40px;
    padding-left: 0;
}
.goimg img{
    width: 80px;
    height: 80px;
}
.num{
    
    padding: 0;
}
.num2{
 
    margin-right: 30px;
    padding: 0;
}
.xiaoji{
    color: #FF6700;
    margin-left: 40px;
}
.gname{
    font-size: 18px;
}
.aa{
    border-bottom: 1px solid #999;
}
.cc p{
   
    font-size: 30px;

    
}
.d{
    width: 50px;
    height: 20px;
    margin-top: 45px;
}
.as{
    height: 40px;
	padding:0;
}
.q{
    margin-left: -45px;

}
.top_end{
    margin-left: px;
}
.yy{
    margin-left: 10px;
}
#ipt{
    text-align: center;
}

#bottom{
    width: 80%;
    margin: 0 auto;
    height: 50px;
    background-color: #fff;
    margin-top: 30px;
}
#bottom_left{
    width: 300px;
    line-height: 50px;
    margin-left: 30px;
}
#bottom_left div{
    float: left;
    

}
#bottom_left a{
    font-size: 14px;
}
#l{
    margin-left: 40px;
}
#l span{
    color: #FF6700;
}
#bottom_right div{
    float: left;
}
#bottom_right{
    margin-left: 850px;
    line-height: 50px;
    width: 500px;
}
#bottom_right span{
    color: #FF6700;
    font-size: 25px;
}
#qjs{
   width: 100px;
   height: 50px;
background-color: #FF6700;
text-align: center;
position: absolute;
right: 150px;
}
#qjs a{
    color: #fff;
    font-size: 20px;

}
#dindan{
display:none;
}
#address{
    width: 80%;
    height: 260px;
    margin: 0 auto;
    margin-top:30px;
    background-color: #fff;

}
#address_1{
    height: 80px;
    line-height: 80px;
    padding-top: 10px;
    margin-left: 50px;
}
#address_2{
    width: 300px;
    height: 180px;
    border: 1px solid #e0e0e0;
    margin-left: 50px;
    margin-top:-30px;
    
}
#address_2:hover{
    border: 1px solid #999;
    transition: all .4s ease;
        
}
#address_2_1{
    padding-left: 20px;
    padding-right: 20px;
    padding-top: 20px;
    color: #666;
}
#address_2_1 p{
    word-wrap: break-word;
	word-break: break-all;
}

       </style>
</head>
<body>
    <div id="cartdisply">
    <div id="top">
        <div id="logo"><img src="img/index/logo.png" alt=""></div>
        <div id="top_ul">
            <h3>我的购物车</h3>
        </div>
        <div id="msg"><p>温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</p></div>
        <div id="top_right">
             <a href="ucenter.jsp">个人中心</a>
        </div>
     </div>
     <div id="clear">&nbsp</div>
     <div id="warp">
         <div class="row top no-gutters aa">
             <div class="col-1 top1">
                 <input type="checkbox" class="checkbox"   id="AllCheck"><span>全选</span></div>
             <div class="col-1"></div>
             <div class="col-5">商品名称</div>
             <div class="col-1">单价</div>
             <div class="col-1 num2">数量</div>
             <div class="col-1 yy"  >小计</div>
             <div class="col-1 top_end">操作</div>
         </div>
         <c:forEach items="${cartlist}" var="cartlist"  varStatus="status">
         <div class="row goods no-gutters aa" name="goods">
            <div class="col-1 top1">
               <c:if test="${cartlist.checked==0}"> <input type="checkbox" onclick="checkedst('${cartlist.gid}','${cartlist.checked}')" class="checkbox"  name="checkbox" value="${cartlist.gid}"></div></c:if>
               <c:if test="${cartlist.checked==1}"> <input type="checkbox" onclick="checkedst('${cartlist.gid}','${cartlist.checked}')" class="checkbox" checked="checked" name="checkbox" value="${cartlist.gid}"></div></c:if>
               
            <div class="col-1 goimg"><img id="gimg" src="${cartlist.gimg }" alt=""></div>
            <div class="col-5 gname " id="gname">${cartlist.gname }</div>
            <div class="col-1" id="gprice">${cartlist.gprice}</div>
            <div class="col-1 num">
               <div class="row q">
                   <a href="javascript:void(0)" onclick="del(this,'${cartlist.gid}')" name="pri" class="as"> <div class="col-4 cc"><p>-</p></div></a>
                   <input type="text" class="col-4 d as " id="ipt" name="sum" onblur="sum1(this,'${cartlist.gid}')" value="${cartlist.num}">
                   <a href="javascript:void(0)" onclick="add(this,'${cartlist.gid}')" name="pri" class="as"><div class="col-4 cc"><p>+</p></div></a>
               </div>
           
            </div>
           
              <div class="col-1 xiaoji" name="xiaoji">${cartlist.gprice*cartlist.num}</div>
            <div class="col-1"><a href="javascript:void(0)" name="i"  onclick="delt('${cartlist.gid}')">删除</a></div>
         </div>   
         </c:forEach>
       
         </div>  

         <div id="address">
            <div id="address_1"><h5>收货地址</h5></div>
            <div id="address_2">
                <div id="address_2_1">
                    <h4>${user.uname}</h4>
                   <c:if test="${empty user.uphone}"> <h5><a href="uinfo?type=1" target="center">添加</a></h5></c:if>
                   <c:if test="${not empty user.uphone}"> <h5>${user.uphone}</h5></c:if>
                    <c:if test="${empty user.uaddress}"> <p><a href="uinfo?type=1" target="center">添加</a></p></c:if>
                   <c:if test="${not empty user.uaddress}"><p>${user.uaddress}</p></c:if>
                    
                </div>
            </div>
         </div>


     <div id="bottom">
        <div id="bottom_left">
             <div><a href="Search?keyword=全部商品">继续购物</a> &nbsp &nbsp|</div>
             <div id="l">共 <span name="count"></span> 件商品,已选择 <span name="yixuan">0</span> 件</div>
        </div>
        <div id="bottom_right">
            <div>合计 <span name="heji" id="heji">0</span>元</div>
            <div id="qjs"><a id="jiesuan" href="orderinfo?type=0">去结算</a></div>
        </div>
     </div>
    </div>
   

    
        <script>
        //选中状态
       
    
     
            //减
            function del(obj,gid){
                var num=parseInt($(obj).next().val());
                if(num<=1){return}else{
                    num=num-1;
                    $(obj).next().val(num);        
                   xiaoji(num,obj);
                   
                   	var xhr=new XMLHttpRequest;
				xhr.open("get","cart?gid="+gid+"&type=B"+"&num="+num,true)
				xhr.send();
                }
            }
            //加
            function add(obj,gid){
                var num=parseInt($(obj).prev().val());
                num=num+1;  
                $(obj).prev().val(num);
                xiaoji(num,obj);
                 var xhr=new XMLHttpRequest;
				xhr.open("get","cart?gid="+gid+"&type=B"+"&num="+num,true)
				xhr.send();
            }
            function sum1(obj,gid){
                num=parseInt($(obj).val());
                xiaoji(num,obj);
                sumprice();
                var xhr=new XMLHttpRequest;
				xhr.open("get","cart?gid="+gid+"&type=B"+"&num="+num,true)
				xhr.send();
                
            }
         
            //小计
            function xiaoji(num,obj){
                var xj=$(obj).parent().parent().next().text();
                var dj=$(obj).parent().parent().prev().text();
                xj=dj*num;
                $(obj).parent().parent().next().text(xj);
            }
           $('#AllCheck').change(function(){
               var check=$(this).prop('checked');
              var hj=0;
              var i=0;
              
               if(check){
                $("input[name='checkbox']").each(function(){
                 var gid=$(this).val();
                  var xhr=new XMLHttpRequest;
                  xhr.open("get","cart?gid="+gid+"&type=D&checked=0",true)
	              xhr.send();
                })
                 $("input[name='checkbox']").prop('checked',true);
                $("div[name='xiaoji']").each(function(){
                    hj=hj+parseInt($(this).text());
                  $("span[name='heji']").text(hj);
                  i++;
                  $("span[name='yixuan']").text(i);
                });
                
               }else{
               $("input[name='checkbox']").each(function(){
                 var gid=$(this).val();
                  var xhr=new XMLHttpRequest;
                  xhr.open("get","cart?gid="+gid+"&type=D&checked=1",true)
	              xhr.send();
                })
                $("input[name='checkbox']").prop('checked',false);
                $("span[name='heji']").text(0)
                $("span[name='yixuan']").text(i);
               }
           });
           function sumprice(){
            var sumprice=0; 
           var i=0;
            $("input[name='checkbox']").each(function(){
            if($(this).prop('checked')){
                sumprice+=parseInt($(this).parent().next().next().next().next().next().text());
                    i++;
               }
           });
           $("span[name='heji']").text(sumprice);
           return i;
           }
           $("input[name='checkbox']").change(function(){
             var i= sumprice();
            $("span[name='yixuan']").text(i);
           }) ;
           function sum(){
             var hj=0;
             
             $("div[name='xiaoji']").each(function(){
                    if($(this).parent().children(":first").children(":first").prop('checked')){
                    hj=hj+parseInt($(this).text());
                  $("span[name='heji']").text(hj)
                  }
                });
           }
           $("input[name='sum']").change(function(){
          sum()
           });
          $("a[name='pri']").click(function(){
           sum()
          })
          
        
        
      //删除
     function  delt(gid){
     var xhr=new XMLHttpRequest;
     xhr.open("get","cart?gid="+gid+"&type=C",true)
	 xhr.send();
	 location.reload();

     }
 //去结算 
  
        
    
      $(function(){
   
      sumprice();
       var i=0;
        $("input[name='sum']").each(function(){
        i++;
        })
        $("span[name='count']").text(i);
        i= sumprice();
            $("span[name='yixuan']").text(i);
      })
     function checkedst(gid,checked){
     var xhr=new XMLHttpRequest;
 
     xhr.open("get","cart?gid="+gid+"&type=D&checked="+checked,true)
	xhr.send();
     }
    
     
        </script>
</body>
 
</html>