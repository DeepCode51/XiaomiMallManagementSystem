<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <title>登录</title>
    <!-- <link rel="stylesheet" href="css/bootstrap.css"/> -->
    <style type="text/css">
    a{
        text-decoration: none;
        color: #fff;
    }
        #content{
    border: none;
   margin-top: 100px;
   width: 1920px;
   margin-left: -20px;
  height: 560px;
    background-image: url(img/regist.png);
        }
       #right{
        border-radius: 2px;
    min-height: 100px;
    padding: 1.2em .6em;
    width: 270px;
    height: 300px;
    margin-right: 100px;
    margin-top: 150px;
    box-sizing: border-box;
    background-color: rgba(0,0,0,0.2);
    position: absolute;
    right: 10px;
    color: #fff;
       }
       p{
         margin-top: -5px;
           font-size: 17px;
           margin-left: 10px;
       }
       p span{
           margin-left: 50px;
           font-size: 13px;
       }
       
       input{
           border: none;
       }
       input:focus{
           outline: none;
       }
       .form-group label{
        display: inline-block;
    width: 90px;
    text-align: right;
    color: #ffffff;
    font-size: 14px;
       }
       .form-group input{
        padding: 10px 20px;
    width:190px;
    margin-top: 12px;
    border-radius: 2px;
    margin-left: 10px;
    
       }
       .form-group span{
        width: 270px;
    color: #fff;
    padding: 4px;
    border-radius: 2px;
    font-size: 12px;
       }
       .form-group{
        margin-bottom: 20px;
       }
       .msg_default{
           background-color: #999;
       }
       .msg_error{
           background-color: #d00;
       }
       #submit{
           background-color: #FF6900;
           color: #fff;
           width: 230px;
       }
       hr{
           width: 93%;
           
       }
    </style>
</head>
<body>
    <div id="content">
         <div id="right"> 
             <p>登录小米商城<span><a href="regist.jsp">新用户注册</a></span></p>
             <hr>
           
                <div class="form-group">          
                    <input type="text" name="uid" class="form_control" id="uid" placeholder="请输入用户名">  
                </div>
                <div class="form-group">   
                    <input type="password" name="upass" class="form_control" id="upass" placeholder="请输入密码">
                </div>
                <div class="form-group">
                    
                    <input type="button" id="submit" onclick="login()" value="登录">
                </div>
                      
             
    
         </div>
    </div>
</body>
<script>
 function login(){
    var uid=$("#uid").val();
    var upass=$("#upass").val();
    var xhr=new XMLHttpRequest();
    xhr.onreadystatechange=function(){
			if(xhr.readyState==4&xhr.status==200){
				var result=xhr.responseText;
				if(result==1){
                     function tip(){var bg = '#333'; if(arguments[1]==1){bg = '#333'};$('_tip').remove();$('body').append("<div class='_tip' style='z-index:99999;opacity:0.9;text-align:center;width:100%;bottom:20%;position:fixed;'><div style='word-wrap:break-word;color:#fff;max-width:80%;padding:5px 10px;display:inline-block;background:"+bg+";border-radius:7px;font-size:20px;'>" +arguments[0]+"</div></div>");setTimeout(function(){$('._tip').fadeOut(1000, function() {$(this).remove();});}, 1500);}
          tip("登录成功")
          setTimeout(function(){window.location.href="index";},200)
          
        }else{
          function tip(){
           var bg = '#E64340'; 
           if(arguments[1]==1){bg = '#1AAD19'};
           $('_tip').remove();
           $('body').append("<div class='_tip' style='background:"+bg+";font-size:20px;opacity:0.9;padding:20px 0;text-align:center;width:100%;left:0;top:0;color:#fff;position:fixed;'>" +arguments[0]+"</div>");
           setTimeout(function(){$('._tip').fadeOut(1000, function() {$(this).remove();});}, 1000);}
        tip("账号或密码错误");
        }
			}
		}
		xhr.open("post","login",true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded")
        var frmdate="uid="+uid+"&upass="+upass;
		xhr.send(frmdate);
      
   }
</script>
</html>