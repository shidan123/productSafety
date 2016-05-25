<%@ page pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
     <title>食品安全监测系统</title>
        <link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" /> 
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
 	
 	<script type="text/javascript">
 		$(function(){
 			
			$("#lbn").click(function() {
				//客户端验证账号
				var admin_code = $("#admin_code").val();
				if(admin_code==""){
					$("#acs").text("请输入账号");
					return;
				} 
				//客户端验证密码
				var password = $("#password").val();
				if(password==""){
					$("#aps").text("请输入密码");
					return
				}
				//客户端验证验证码
				var code = $("#code").val();
				if(code==""){
					$("#accs").text("请输入验证码");
					return
				}
				
				//serialize()
				//admin_code=aaa&password=aaa&code=abcd
				$.post("login/login.do",$("#loginForm").serialize(),function(data){
					if(data.flag==1){
						$("#acs").text("无此用户");
					}else if(data.flag==2){
						$("#aps").text("密码错误");
					}else if(data.flag==3){
						$("#accs").text("验证码错误！");
						change();
					}else{
						window.location.href="login/toIndex.do";
					}
				});
				
			});
			
			
			$("#codeImage").click(function() {
				change();
			});
			 
		});
 		
 		function change() {
			$("#codeImage")[0].src="login/createImage.do?timr="+new Date().getTime();
		}
 		
 	</script>
 	
  </head>
  
  <body class="index">
        <div class="login_box">
            <form id="loginForm">
            <table>
                <tr>
                    <td class="login_info">账号：</td>
                    <td colspan="2"><input id="admin_code" name="admin_code" type="text" class="width150" /></td>
                    <td class="login_error_info"><span class="required" id="acs">    </span></td>
                </tr>
                <tr>
                    <td class="login_info">密码：</td>
                    <td colspan="2"><input id="password" name="password" type="password" class="width150" /></td>
                    <td><span class="required" id="aps">   </span></td>
                </tr>
                <tr>
                    <td class="login_info">验证码：</td>
                    <td class="width70"><input name="code" id="code" type="text" class="width70" /></td>
                    <td><img src="login/createImage.do" id="codeImage" alt="验证码" title="点击更换" /></td>  
                    <td><span class="required" id="accs"> </span></td>              
                </tr>            
                <tr>
                    <td></td>
                    <td class="login_button" colspan="2">
                        <a href="javascript:;"><img src="images/login_btn.png" id="lbn"/></a>
                    </td>    
                    <td><span class="required"> </span></td>                
                </tr>
            </table>
        	</form>
        </div>
    </body>
</html>
