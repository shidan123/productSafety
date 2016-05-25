<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
  </head>
  
 <body class="index">
        <!--导航区域开始-->
        <div id="index_navi">
            <ul id="menu">
               	<%@ include file="menu.jsp" %>
            </ul>
        </div>
    </body>
</html>
