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
          
           	function validateProductName(){
           		var productName = $("#product_name").val();
           		var reg=/^[\u4E00-\u9FA5A-Za-z0-9_]{1,50}$/
           		if(reg.test(productName)&&productName!=null){
           			$("#productNameDiv").text("✔").removeClass("error_msg");
           			return true;
           		}else{
           			$("#productNameDiv").text("50长度以内的字母、数字的组合").addClass("validate_msg_medium error_msg");
           			return false;
           		}
           	}
           	
           	function validateProductWeight(){
           		var productWeight = $("#product_weight").val();
           		var reg=/^[0-9]{1,10}$/;
           		if(reg.test(productWeight)&&productWeight!=null){
           			$("#productWeightDiv").text("✔").removeClass("error_msg");
           			return true;
           		}else{
           			$("#productWeightDiv").text("10长度以内的数字、字母组合").addClass("validate_msg_medium error_msg");
           			return false;
           		}
           	}
           	
           		function validateProductArea(){
           		var productArea = $("#product_area").val();
           		var reg=/^[\u4E00-\u9FA5A-Za-z0-9_]{1,30}$/
           		if(reg.test(productArea)&&productArea!=null){
           			$("#productAreaDiv").text("✔").removeClass("error_msg");
           			return true;
           		}else{
           			$("#productAreaDiv").text("30长度以内的字母、数字的组合").addClass("validate_msg_medium error_msg");
           			return false;
           		}
           	}
           	
           	function validateProductBrand(){
           		var productBrand = $("#product_brand").val();
           		var reg=/^[\u4E00-\u9FA5A-Za-z0-9_]{1,30}$/
           		if(reg.test(productBrand)&&productBrand!=null){
           			$("#productBrandDiv").text("✔").removeClass("error_msg");
           			return true;
           		}else{
           			$("#productBrandDiv").text("30长度以内的字母、数字的组合").addClass("validate_msg_medium error_msg");
           			return false;
           		}
           	}
           	
           		function validateSafety(){
           		var safetyIndex = $("#safety_index").val();
           		var reg = /^((\d+\.?\d*)|(\d*\.\d+))\%$/;
           		if(reg.test(safetyIndex)&&safetyIndex!=null){
           			$("#safetyDiv").text("✔").removeClass("error_msg");
           			return true;
           		}else{
           			$("#safetyDiv").text("正确的百分数格式").addClass("validate_msg_medium error_msg");
           			return false;
           		}
           	}
           		function validateExpireDate(){
           		var expireDate = $("#expireDate").val();
           		var reg=/^[0-9]{1,10}$/;
           		if(reg.test(expireDate)&&expireDate!=null){
           			$("#expireDateDiv").text("✔").removeClass("error_msg");
           			return true;
           		}else{
           			$("#expireDateDiv").text("10长度以内的数字").addClass("validate_msg_medium error_msg");
           			return false;
           		}
           	}
           		function validateEnergy(){
           		var energy = $("#energy").val();
           		var reg=/^[0-9]{1,10}$/;
           		if(reg.test(energy)&&energy!=null){
           			$("#energyDiv").text("✔").removeClass("error_msg");
           			return true;
           		}else{
           			$("#energyDiv").text("10长度以内的数字").addClass("validate_msg_medium error_msg");
           			return false;
           		}
           	}
           		function validateProtein(){
           		var protein = $("#protein").val();
           		var reg=/^[0-9]{1,10}$/;
           		if(reg.test(protein)&&protein!=null){
           			$("#proteinDiv").text("✔").removeClass("error_msg");
           			return true;
           		}else{
           			$("#proteinDiv").text("10长度以内的数字").addClass("validate_msg_medium error_msg");
           			return false;
           		}
           	}
           		function validateFat(){
           		var fat = $("#fat").val();
           		var reg=/^[0-9]{1,10}$/;
           		if(reg.test(fat)&&fat!=null){
           			$("#fatDiv").text("✔").removeClass("error_msg");
           			return true;
           		}else{
           			$("#fatDiv").text("10长度以内的数字").addClass("validate_msg_medium error_msg");
           			return false;
           		}
           	}
           	
           	function validateCarbohydrate(){
           		var carbohydrate = $("#carbohydrate").val();
           		var reg=/^[0-9]{1,10}$/;
           		if(reg.test(carbohydrate)&&carbohydrate!=null){
           			$("#carbohydrateDiv").text("✔").removeClass("error_msg");
           			return true;
           		}else{
           			$("#carbohydrateDiv").text("10长度以内的数字").addClass("validate_msg_medium error_msg");
           			return false;
           		}
           	}
           	function validateSodium(){
           		var sodium = $("#sodium").val();
           		var reg=/^[0-9]{1,10}$/;
           		if(reg.test(sodium)&&sodium!=null){
           			$("#sodiumDiv").text("✔").removeClass("error_msg");
           			return true;
           		}else{
           			$("#sodiumDiv").text("10长度以内的数字").addClass("validate_msg_medium error_msg");
           			return false;
           		}
           	}
                //保存成功的提示消息
            function showResult() {
            	if(validateProductName()&validateProductWeight()&validateProductArea()&validateProductBrand()
            	&validateSafety()&validateEnergy()&validateProtein()&validateFat()&validateProtein()& validateCarbohydrate()&validateSodium()){
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
            <form action="product/update.do" method="post" class="main_form">
                 <input type="hidden" name="id" value="${product.id }">
                   <div class="text_info clearfix"><span>产品编号：</span></div>
                    <div class="input_info">
                        <input type="text" name="product_id" readonly="readonly" id="product_id" value="${product.product_id }"onblur="validateProductId();"/>
                        <span class="required">*</span>
                        <div id="idDiv" class="validate_msg_long"></div>
                    </div>
                    <div class="text_info clearfix"><span>产品名称：</span></div>
                    <div class="input_info">
                        <input type="text" name="product_name" id="product_name" value="${product.product_name}" onblur="validateProductName();"/>
                        <span class="required">*</span>
                        <div id="productNameDiv" class="validate_msg_long"></div>
                    </div>
                    <div class="text_info clearfix"><span>重量：</span></div>
                    <div class="input_info">
                        <input type="text" name="product_weight" id="product_weight" value="${product.product_weight }" onblur="validateProductWeight();"/>
                        <span class="required">*</span>
                        <div id="productWeightDiv" class="validate_msg_long " ></div>
                    </div>
                    <div class="text_info clearfix"><span>产地：</span></div>
                    <div class="input_info">
                        <input type=text name="product_area" id="product_area" value="${product.product_area }" onblur="validateProductArea();"/>
                        <span class="required">*</span>
                        <div id="productAreaDiv" class="validate_msg_long "></div>
                    </div>      
                    <div class="text_info clearfix"><span>品牌：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" name="product_brand" id="product_brand" value="${product.product_brand }" onblur="validateProductBrand();"/>
                        <span class="required">*</span>
                        <div id="productBrandDiv" class="validate_msg_medium "></div>
                    </div>
                    <div class="text_info clearfix"><span>安全信息：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" name="safety_index" id="safety_index" value="${product.safety_index }" onblur="validateSafety()"/>
                        <span class="required">*</span>
                        <div id="safetyDiv" class="validate_msg_medium "></div>
                    </div>
                     <div class="text_info clearfix"><span>能量：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" name="energy" id="energy" value="${product.energy }"onblur="validateEnergy()"/>
                        <span class="required">*</span>
                        <div id="energyDiv" class="validate_msg_medium "></div>
                    </div>
                     <div class="text_info clearfix"><span>蛋白质：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" name="protein" id="protein" value="${product.protein }"onblur="validateProtein()"/>
                        <span class="required">*</span>
                        <div id="proteinDiv" class="validate_msg_medium "></div>
                    </div>
                     <div class="text_info clearfix"><span>脂肪：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" name="fat" id="fat" value="${product.fat }"onblur="validateFat()"/>
                        <span class="required">*</span>
                        <div id="fatDiv" class="validate_msg_medium "></div>
                    </div>
                     <div class="text_info clearfix"><span>碳水化合物：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" name="carbohydrate" id="carbohydrate"  value="${product.carbohydrate }"onblur="validateCarbohydrate()"/>
                        <span class="required">*</span>
                        <div id="carbohydrateDiv" class="validate_msg_medium "></div>
                    </div>
                     <div class="text_info clearfix"><span>钠含量：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" name="sodium" id="sodium"value="${product.sodium }" onblur="validateSodium()"/>
                        <span class="required">*</span>
                        <div id="sodiumDiv" class="validate_msg_medium "></div>
                    </div>
                    <div class="button_info clearfix">
                        <input type="submit" value="保存" class="btn_save" onclick="return showResult();" />
                        <input type="button" value="取消" class="btn_save" />
                    </div>
                </form>  
        </div>
    </body>
</html>
