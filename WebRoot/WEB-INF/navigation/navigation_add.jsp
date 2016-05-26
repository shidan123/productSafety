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
           
           	function validateId(){
           		var id = $("#id").val();
           		var reg=/^[1-9][0-9]\d{11}$/
           		if(reg.test(id)&&id!=null){
           			$("#idDiv").text("✔").removeClass("error_msg");
           			return true;
           		}else{
           			$("#idDiv").text("13位数字组合").addClass("validate_msg_medium error_msg");
           			return false;
           		}
           	}
           	
           		function validateLogoName(){
           		var logoName = $("#logoName").val();
           		var reg=/^[\u4E00-\u9FA5A-Za-z0-9_]{1,50}$/
           		if(reg.test(logoName)&&logoName!=null){
           			$("#logoNameDiv").text("✔").removeClass("error_msg");
           			return true;
           		}else{
           			$("#logoNameDiv").text("50长度以内的字母、数字的组合").addClass("validate_msg_medium error_msg");
           			return false;
           		}
           	}
           	
           	function validateNetAddress(){
           		var netAddress = $("#netAddress").val();
           		var reg=/^[0-9]{1,10}$/;
           		if(reg.test(netAddress)&&netAddress!=null){
           			$("#netAddressDiv").text("✔").removeClass("error_msg");
           			return true;
           		}else{
           			$("#netAddressDiv").text("10长度以内的数字、字母组合").addClass("validate_msg_medium error_msg");
           			return false;
           		}
           	}
           	
             //保存成功的提示消息
          fromFlag = false;
          
            function showResult() {
            	if(validateId()&validateLogoName()&validateNetAddress()){
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
            <form action="navigation/saveNavigation.do" method="post" class="main_form">
                    <div class="text_info clearfix"><span>ID：</span></div>
                    <div class="input_info">
                        <input type="text" name="id" id="id" onblur="validateId();"/>
                        <span class="required">*</span>
                        <div id="idDiv" class="validate_msg_long"></div>
                    </div>
                    <div class="text_info clearfix"><span>名称：</span></div>
                    <div class="input_info">
                        <input type="text" name="logoName" id="logoName" onblur="validateLogoName();"/>
                        <span class="required">*</span>
                        <div id="LogoNameDiv" class="validate_msg_long"></div>
                    </div>
                    <div class="text_info clearfix"><span>网址：</span></div>
                    <div class="input_info">
                        <input type="text" name="netAddress" id="netAddress" onblur="validateNetAddress();"/>
                        <span class="required">*</span>
                        <div id="netAddressDiv" class="validate_msg_long"></div>
                    </div>
                    <div class="button_info clearfix">
                        <input type="submit" value="保存" class="btn_save" onclick="return showResult();" />
                        <input type="button" value="取消" class="btn_save" />
                    </div>
                </form>  
        </div>
    </body>
</html>
