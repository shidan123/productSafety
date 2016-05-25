<%@ page pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
     <title>达内－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" /> 
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script language="javascript" type="text/javascript">
            //保存成功的提示消息
            function showResult() {
            	if(validateName()&validateTel()&validateEmail()){
            		 if($("input:checked").length==0){
            		 $("#checkDiv").text("至少选择一个权限").addClass("validate_msg_medium error_msg");
            		 return false;
            	 }
            	 return true;
            	}
            	return false;
            }
            
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
            function validateTel() {
           		var telephone = $("#telephone").val();
           		var reg=/^\+?(86|0086)?\s?1[3578]\d{9}$/;
           		if(reg.test(telephone)){
           			$("#telDiv").text("✔").removeClass("validate_msg_medium error_msg");
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
                <li><a href="../index.html" class="index_off"></a></li>
                 <%@include file="../main/menu.jsp" %>
                <li><a href="../user/user_info.html" class="information_off"></a></li>
                <li><a href="../user/user_modi_pwd.html" class="password_off"></a></li>
            </ul>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form action="admin/update.do" method="post" class="main_form">
                 <input type="hidden" name="id" value="${admin.id }">
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input type="text" name="name" id="name" value="${admin.name }" onblur="validateName();" />
                        <span class="required">*</span>
                        <div id="nameDiv" class="validate_msg_long  ">20长度以内的汉字、字母、数字的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>管理员账号：</span></div>
                    <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${admin.admin_code }"  /></div>
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <input type="text" name="telephone" id="telephone" value="${admin.telephone }" onblur="validateTel();" />
                        <span class="required">*</span>
                        <div id="telDiv" class="validate_msg_long  ">正确的电话号码格式：手机或固话</div>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" id="email" name="email" value="${admin.email }" onblur="validateEmail();"/>
                        <span class="required">*</span>
                        <div id="emailDiv" class="validate_msg_medium ">50长度以内，正确的 email 格式</div>
                    </div>
                    <div class="text_info clearfix"><span>角色：</span></div>
                    <div class="input_info_high">
                        <div class="input_info_scroll">
                            <ul>
                            <c:forEach items="${roleList }" var="r">
                                <li>
                               
                                <input type="checkbox" name="roleIds" value="${r.id }" 
                                	 <c:forEach items="${admin.roles }" var="adminr">
                                	 	<c:if test="${r.id==adminr.id }">
                                	 		checked="checked"
                                	 	</c:if>
                                	 </c:forEach>
                                />${r.name }
                                </li>
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
            <span>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</span>
            <br />
            <span>版权所有(C)加拿大达内IT培训集团公司 </span>
        </div>
    </body>
</html>
