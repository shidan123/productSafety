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
            //保存成功的提示消息
            function showResult() {
            	if(!validateName()){
            		return false;
             	}
            	 if($("input:checked").length==0){
            		 $("#checkDiv").text("至少选择一个权限").addClass("validate_msg_medium error_msg");
            		 return false;
            	 }
               return true;
               showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            
            function validateName() {
            	 var name = $("#name").val();
                 var reg=/([\u4e00-\u9fa5]|[a-zA-Z0-9]){1,9}/;
                 if(reg.test(name)){
                 	$("#nameDiv").text("").removeClass("validate_msg_medium error_msg");
 					return true;
                 }else{
                 	$("#nameDiv").text("不能为空，且为20长度的字母、数字和汉字的组合").addClass("validate_msg_medium error_msg");
 	            	return false;
                 }
			}
            
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
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
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_result_info" class="save_success">保存成功！</div><!--保存失败，角色名称重复！-->
            <form action="role/addRole.do" method="post" class="main_form">
                <div class="text_info clearfix"><span>角色名称：</span></div>
                <div class="input_info">
                    <input type="text" class="width200" name="name" id="name" onblur="validateName();"/>
                    <span class="required">*</span>
                    <div id="nameDiv" class="validate_msg_medium">不能为空，且为20长度的字母、数字和汉字的组合</div>
                </div>                    
                <div class="text_info clearfix"><span>设置权限：</span></div>
                <div class="input_info_high">
                    <div class="input_info_scroll">
                        <ul>
                        <c:forEach items="${privilegeList }" var="privilege">
                            <li><input type="checkbox" value="${privilege.id }" name="privilegeIds"/>${privilege.name }</li>
                        </c:forEach>
                        </ul>
                    </div>
                    <span class="required">*</span>
                    <div id="checkDiv" class="validate_msg_tiny">至少选择一个权限</div>
                </div>
                <div class="button_info clearfix">
                    <input type="submit" value="保存" class="btn_save" onclick="return showResult();" />
                    <input type="button" value="取消" class="btn_save" />
                </div>
            </form>
        </div>
    </body>
</html>
