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
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
  	<script language="javascript" type="text/javascript">
            //显示角色详细信息
            function showDetail(flag, a) {
                var detailDiv = a.parentNode.getElementsByTagName("div")[0];
                if (flag) {
                    detailDiv.style.display = "block";
                }
                else
                    detailDiv.style.display = "none";
            }
            //删除
            function deleteNavigation(id) {
            	alert(id);
                var r = window.confirm("确定要删除此导航吗？");
              	if(r){
              		window.location.href="navigation/deleteNavigation.do?id="+id;
              	}
                document.getElementById("operate_result_info").style.display = "block";
            }
            //提交表单
            function getSubmit(cp) {
				$("#currentPage").val(cp);
            	document.getElementById("mainForm").submit();   
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
            <form action="navigation/findByPage.do" id="mainForm" method="post">
                <!--查询-->
                <div class="search_add">
                    <input type="button" value="增加" class="btn_add" onclick="location.href='navigation/toAdd.do';" />
                </div>
                <!--删除操作提示-->
                <div id="operate_result_info" class="operate_fail">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                    <span>删除失败！数据并发错误。</span><!--密码重置失败！数据并发错误。-->
                </div> 
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                      <thead>
                        <tr>
                            <th>ID</th>
                            <th>名称</th>
                            <th>网址</th>
                            <th>操  作</th>
                        </tr>
                        </thead>
                        <tbody>   
                      	<c:forEach items="${navigationList}" var="navigation">   
                        <tr>
                            <td>${navigation.id}</td>
                            <td>${navigation.logoName}</td>
                            <td>${navigation.netAddress}</td>
                            <td class="td_modi">
                                <input type="button" value="修改" class="btn_modify" onclick="location.href='navigation/toUpdate.do?id=${navigation.id}';" />
                                <input type="button" value="删除" class="btn_delete" onclick="deleteNavigation(${navigation.id});" />
                            </td>
                        </tr>
                       </c:forEach>      
                 	</tbody>
                    </table>
                </div>
                <!--分页-->
               	<div id="pages">
        	        <a href="navigation/findByPage.do?currentPage=${navigationPage.prePage}">上一页</a>
                      <c:forEach items="${lists}" var="data">
                	<c:choose>
       					<c:when test="${navigationPage.currentPage==data }">
       						<a  href="navigation/findByPage.do?currentPage=${data }" class="current_page">${data }</a>
       					</c:when>  
       					<c:otherwise>
       							<a href="navigation/findByPage.do?currentPage=${data }" >${data }</a>
       					</c:otherwise>       	
                	</c:choose>
                  </c:forEach>
                    <a href="navigation/findByPage.do?currentPage=${navigationPage.nextPage}">下一页</a>
                </div>
            </form>
        </div>
    </body>
</html>
