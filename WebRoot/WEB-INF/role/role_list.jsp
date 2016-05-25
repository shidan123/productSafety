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
            function deleteRole(id) {
                var r = window.confirm("确定要删除此角色吗？");
            	if(r){
            		$.ajax({
            			   type: "POST",
            			   url: "role/isRoleSelected.do",
            			   data: "rid="+id,
            			   success: function(data){
            			      if(data.flag==1){
            			    	  $("#operate_result_info").css("display","block");
            			      }else{
	            		window.location.href="role/deleteRole.do?id="+id;
            			      }
            			   }
            			});
            	}
              //  document.getElementById("operate_result_info").style.display = "block";
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
            <form action="" method="">
                <!--查询-->
                <div class="search_add">
                    <input type="button" value="增加" class="btn_add" onclick="location.href='role/toAdd.do';" />
                </div>  
                <!--删除的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="images/close.png" onclick="this.parentNode.style.display='none';" />
                    删除错误！该角色被使用，不能删除。
                </div> <!--删除错误！该角色被使用，不能删除。-->
                <!--数据区域：用表格展示数据-->     
                <div id="data">                      
                    <table id="datalist">
                        <tr>                            
                            <th>角色 ID</th>
                            <th>角色名称</th>
                            <th class="width600">拥有的权限</th>
                            <th class="td_modi"></th>
                        </tr>   
                        <c:forEach items="${roles }" var="role">
                        <tr>
                            <td>${role.id }</td>
                            <td>${role.name }</td>
                             <td><c:forEach varStatus="status" items="${role.privileges }" var="privilege">
                            	<c:choose>
                            	<c:when test="${status.last }">
                            	${privilege.name }
                            	</c:when>
                            	<c:otherwise>
                            	${privilege.name },
                            	</c:otherwise>
                            	</c:choose>
                            </c:forEach> </td>
                            <td>
                                <input type="button" value="修改" class="btn_modify" onclick="location.href='role/toUpdate.do?id=${role.id }';"/>
                                <input type="button" value="删除" class="btn_delete" onclick="deleteRole(${role.id });" />
                            </td>
                        </tr>
                        </c:forEach>                   
                       
                    </table>
                </div> 
                <!--分页-->
                <div id="pages">
        	        <a href="role/findByPage.do?currentPage=${page.prePage}">上一页</a>
                      <c:forEach items="${lists}" var="data">
                	<c:choose>
       					<c:when test="${page.currentPage==data }">
       						<a  href="role/findByPage.do?currentPage=${data }" class="current_page">${data }</a>
       					</c:when>  
       					<c:otherwise>
       							<a href="role/findByPage.do?currentPage=${data }" >${data }</a>
       					</c:otherwise>       	
                	</c:choose>
                  </c:forEach>
                    <a href="role/findByPage.do?currentPage=${page.nextPage}">下一页</a>
                </div>
            </form>
        </div>
    </body>
</html>
