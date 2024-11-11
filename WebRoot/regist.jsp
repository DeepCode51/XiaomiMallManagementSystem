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
    <title>注册</title>
    <!-- <link rel="stylesheet" href="css/bootstrap.css"/> -->
    <style type="text/css">
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
    width: 590px;
    height: 465px;
    margin-right: 25px;
    margin-top: 50px;
    box-sizing: border-box;
    background-color: rgba(0,0,0,0.2);
    position: absolute;
    right: 10px;
    color: #fff;
       }
       p{
           font-size: 18px;
           margin-left: 30px;
       }
       p span{
           margin-left: 200px;
           font-size: 14px;
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
    width: 235px;
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
    display: none;
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
           background-color: #15A7F1;
           color: #fff;
           width: 270px;
       }
       a{
        text-decoration: none;
        color: #fff;
    }
    </style>
    <script>
    
    </script>
</head>
<body>
    <div id="content">
         <div id="right"> 
             <p>新用户注册<span><a href="login.jsp">直接登录</a></span></p>
            
                <div class="form-group">
                    <label for="uid">用户名:</label>
                    <input type="text" id="uid" name="uid" class="form_control"  onblur="showerr('uid','账号不能为空','账号格式正确','账号格式不正确');checkuid()" onfocus="showmsg('uid','账号长度在6到12位之间')"  placeholder="请输入用户名">
                    <span class="msg_default"></span>
                </div>
                <div class="form-group">
                    <label for="upass">密码:</label>
                    <input type="password" id="upass" name="upass" class="form_control"  onblur="showerr('upass','密码不能为空','密码格式正确','密码格式不正确')"  onfocus="showmsg('upass','密码长度在6到12位之间')"  placeholder="请输入密码">
                    <span class="msg_default"></span>
                </div>
                <div class="form-group">
                    <label for="upass2">确认密码:</label>
                    <input type="password" name="upass2" class="form_control" onblur="showerr('upass2','密码不能为空','密码格式正确','密码格式不正确')" onfocus="showmsg('upass2','密码长度在6到12位之间')"  placeholder="请确认密码">
                    <span class="msg_default"></span>
                </div>
                <div class="form-group">
                    <label for="uphone">手机号:</label>
                    <input type="text" id="uphone" name="uphone" class="form_control" onblur="showphone()" onfocus="showmsg('phone','请输入正确手机号')"  placeholder="请确认密码">
                    <span class="msg_default"></span>
                </div>
                <div class="form-group">
                    <label for="submit"></label>
                    <input type="submit" id="submit" onclick="regist()" value="提交注册信息">
                </div>
                      
             
            
         </div>
    </div>
    <script>
        function showmsg(name,msg){
            var inp=$("input[name="+name+"]");
            inp.next().text(msg).css({"background-color":"#999","display":"inline"});
        }
        function showerr(name,msg,sucmsg,errmsg){
            var inp=$("input[name="+name+"]");
            if(inp.val()==""){
                inp.next().text(msg).css({"background-color":"#d00","display":"inline"});
                return false;
            } else if(inp.val().length>=6&&inp.val().length<=12){
                inp.next().text(sucmsg).css({"background-color":"#00DD00","display":"inline"});
                return true;
            }else if(inp.val().length<6||inp.val().length>12){
                inp.next().text(errmsg).css({"background-color":"#d00","display":"inline"});
                return false;
            
        }}
        function showphone(){
            var inp=$("input[name='uphone']");
            var reg=/^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/;
            if(inp.val()==""){
                inp.next().text("手机号不能为空").css({"background-color":"#d00","display":"inline"});
                return false;
             }else if(!reg.test(inp.val())){
                inp.next().text("手机号格式错误").css({"background-color":"#d00","display":"inline"});
                return false;
             }else if(reg.test(inp.val())){
             inp.next().text("手机号格式正确").css({"background-color":"#00DD00","display":"inline"});
             return true;
             }
             
        }
   
   function checkuid(){
        var uid=$("#uid").val();
        if(uid!=""){
        var xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&xhr.status==200){
				var result=xhr.responseText;
				if(result==0){
          $("#uid").next().text("账号已存在").css({"background-color":"#d00","display":"inline"});
        }else{
          $("#uid").next().text("账号格式正确").css({"background-color":"#00DD00","display":"inline"});
       check= true;
        }
			}
		}
		xhr.open("Get","regist?uid="+uid,true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded")
		xhr.send();
		}
      }  
      
function regist(){
       if(showerr('uid','账号不能为空','账号格式正确')&&showerr('upass','密码不能为空','密码格式正确')&&showerr('upass2','密码不能为空','密码格式正确','两次密码不一致')
   &&showphone()){
    var uid=$("#uid").val();
    var upass=$("#upass").val();
    var uphone=$("#uphone").val();
    var xhr=new XMLHttpRequest();
    xhr.onreadystatechange=function(){
			if(xhr.readyState==4&xhr.status==200){
				var result=xhr.responseText;
				if(result==1){
          
          
           function tip(){var bg = '#333'; if(arguments[1]==1){bg = '#333'};$('_tip').remove();$('body').append("<div class='_tip' style='z-index:99999;opacity:0.9;text-align:center;width:100%;bottom:20%;position:fixed;'><div style='word-wrap:break-word;color:#fff;max-width:80%;padding:5px 10px;display:inline-block;background:"+bg+";border-radius:7px;font-size:20px;'>" +arguments[0]+"</div></div>");setTimeout(function(){$('._tip').fadeOut(1000, function() {$(this).remove();});}, 1500);}
tip("恭喜你注册成功,正在前往登录页面");
setTimeout(function(){ window.location.href="login.jsp"},500)
           // alert("恭喜你注册成功,正在前往登录页面");
        }
			}
		}
		xhr.open("post","regist",true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded")
        var frmdate="uid="+uid+"&upass="+upass+"&uphone="+uphone;
        
		xhr.send(frmdate);
      
   }else{
     function tip(){
           var bg = '#E64340'; 
           if(arguments[1]==1){bg = '#1AAD19'};
           $('_tip').remove();
           $('body').append("<div class='_tip' style='background:"+bg+";font-size:20px;opacity:0.9;padding:20px 0;text-align:center;width:100%;left:0;top:0;color:#fff;position:fixed;'>" +arguments[0]+"</div>");
           setTimeout(function(){$('._tip').fadeOut(1000, function() {$(this).remove();});}, 1000);}
        tip("格式错误");
     
   }
   }
     
    </script>
</body>
</html>