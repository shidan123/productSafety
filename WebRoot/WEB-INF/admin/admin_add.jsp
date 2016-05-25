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
 	<script language="javascript" type="text/javascript">
            function validateName() {
           	 var name = $("#name").val();
                var reg=/([\u4e00-\u9fa5]|[a-zA-Z0-9]){1,9}/;
                if(reg.test(name)){
                	$("#nameDiv").text("✔").removeClass("validate_msg_medium error_msg");
					return true;
                }else{
                	$("#nameDiv").text("不能为空，且为20长度的字母、数字和汉字的组合").addClass("validate_msg_medium error_msg");
	            	return false;
                }
                
			}
            //验证用户名
            adminCodeFlag = false;
            function validateAdminCode(){
            	var reg=/^[a-zA-Z0-9]{1,30}$/;
            	 adminCode= $("#admin_code").val();
				if(reg.test(adminCode)){
	            	$("#adminCodeDiv").text("✔").removeClass("validate_msg_medium error_msg");
	            	 validateServerAdminCode();
	            	 if(adminCodeFlag){
		            	 return true;		
	            	 }
					return false;
				}else{
	            	$("#adminCodeDiv").text("30长度以内的字母、数字和下划线的组合").addClass("validate_msg_medium error_msg");
					return false;
				}
            }
           	//后台验证用户名是否存在
            function validateServerAdminCode() {
            	$.ajax({
            		   type: "POST",
            		   url: "admin/validateAdminCode.do",
            		   data: "adminCode="+adminCode,
            		   success: function(data){
            		     if(data.flag==0){
            		    	 $("#adminCodeDiv").text("用户名可用✔").removeClass("validate_msg_medium error_msg");
            		    	 adminCodeFlag = true;
            		    	 return adminCodeFlag;
            		     }else{
            		    	 $("#adminCodeDiv").text("用户名已存在").addClass("validate_msg_medium error_msg");
            		    	 return adminCodeFlag;
            		     }
            		   }
            		});
            }
           	
           	//验证密码
           	function validatePassword() {
				password = $("#password").val();
				var reg=/^[\w]{1,30}$/;
				if(reg.test(password)){
					$("#pwdDiv").text("✔").removeClass("validate_msg_medium error_msg");
					return true;
				}else{
					$("#pwdDiv").text("30长度以内的字母、数字和下划线的组合").addClass("validate_msg_medium error_msg");
					return false;
				}
           	}
           	function validatePassword2(){
           		var password2 = $("#password2").val();
           		if(password2==password){
           			$("#pwdDiv2").text("✔").removeClass("validate_msg_medium error_msg");
					return true;
           		}else{
           			$("#pwdDiv2").text("两次密码必须相同").addClass("validate_msg_medium error_msg");
					return false;
           		}
           	}
           	
           	function validateTel() {
           		var telephone = $("#telephone").val();
           		var reg=/^\+?(86|0086)?\s?1[3578]\d{9}$/;
           		if(reg.test(telephone)){
           			$("#telDiv").text("✔").removeClass("error_msg");
           			return true;
           		}else{
           			$("#telDiv").text("正确的电话号码格式：手机或固话").addClass("validate_msg_medium error_msg");
           			return false;
           		}
			}
           	
           	function validateEmail() {
				var email = $("#email").val();
				var reg=/^[a-z0-9]([a-z0-9]*[-_]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9])+[\.][a-z]{2,3}([\.][a-z]{2})?$/;
			/* 	var reg = /^\w+[-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)$/; */
				if(reg.test(email)){
					$("#emailDiv").text("✔").removeClass("error_msg");
					return true;
				}else{
					$("#emailDiv").text("50长度以内，正确的 email 格式").addClass("validate_msg_medium error_msg");
					return false;
				}
			}
           	
           	 //保存成功的提示消息
          fromFlag = false;
            function showResult() {
            	if(validateName()&validateTel()&validateEmail()&validateCheck()){
            	 if($("input:checked").length==0){
            		 $("#checkDiv").text("至少选择一个权限").addClass("validate_msg_medium error_msg");
            		 return false;
            	 }
          		return true;
          		}
          		return false;

            }
            
        </script>
  </head>
  
   <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
            <ul id="menu">
                <%@include file="../main/menu.jsp" %>
            </ul>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form action="admin/saveAdmin.do" method="post" class="main_form">
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input type="text" name="name" id="name" onblur="validateName();"/>
                        <span class="required">*</span>
                        <div id="nameDiv" class="validate_msg_long"></div>
                    </div>
                    <div class="text_info clearfix"><span>管理员账号：</span></div>
                    <div class="input_info">
                        <input type="text" name="admin_code" id="admin_code" onblur="validateAdminCode();"/>
                        <span class="required">*</span>
                        <div id="adminCodeDiv" class="validate_msg_long"></div>
                    </div>
                    <div class="text_info clearfix"><span>密码：</span></div>
                    <div class="input_info">
                        <input type="password" name="password" id="password" onblur="validatePassword();"/>
                        <span class="required">*</span>
                        <div id="pwdDiv" class="validate_msg_long " ></div>
                    </div>
                    <div class="text_info clearfix"><span>重复密码：</span></div>
                    <div class="input_info">
                        <input type="password" name="password2" id="password2" onblur="validatePassword2();"/>
                        <span class="required">*</span>
                        <div id="pwdDiv2" class="validate_msg_long "></div>
                    </div>      
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" name="telephone" id="telephone" onblur="validateTel();"/>
                        <span class="required">*</span>
                        <div id="telDiv" class="validate_msg_medium "></div>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" name="email" id="email" onblur="validateEmail()"/>
                        <span class="required">*</span>
                        <div id="emailDiv" class="validate_msg_medium "></div>
                    </div>
                    <div class="text_info clearfix"><span>角色：</span></div>
                    <div class="input_info_high">
                        <div class="input_info_scroll">
                            <ul>
                            <c:forEach items="${roleList }" var="role">
                                <li><input type="checkbox"  name="roleIds" id="role" value="${role.id }"/>${role.name }</li>
                            </c:forEach>
                            </ul>
                        </div>
                        <span class="required">*</span>
                        <div id="checkDiv" class="validate_msg_tiny ">至少选择一个</div>
                    </div>
                    <div class="button_info clearfix">
                        <input type="submit" value="保存" class="btn_save" onclick="return showResult();" />
                        <input type="button" value="取消" class="btn_save" />
                    </div>
                </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <span>版权所有(C)java工程师石丹</span>
        </div>
    </body>
</html>
