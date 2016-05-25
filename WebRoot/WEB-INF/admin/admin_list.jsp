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
            //重置密码
            function resetPwd() {
				var checked = $("tbody input:checked");
				if(checked.length==0){
					alert("至少选择一个用户");
					return;
				}
				//构建参数id          
				var param ="";
				for(var i=0;i<checked.length;i++){
					if(i<checked.length-1){
					param+="ids="+checked[i].value+"&";
					}else{
					param+="ids="+checked[i].value;
					}
				}
				 
				$.post("admin/resetPassword.do",param,function(data){
					alert("密码重置成功");
				});
				
				//document.getElementById("operate_result_info").style.display = "block";
            }
            //删除
            function deleteAdmin(id) {
                var r = window.confirm("确定要删除此管理员吗？");
              	if(r){
              		window.location.href="admin/deleteAdmin.do?id="+id;
              	}
                document.getElementById("operate_result_info").style.display = "block";
            }
            //全选
            function selectAdmins(inputObj) {
                var inputArray = document.getElementById("datalist").getElementsByTagName("input");
                for (var i = 1; i < inputArray.length; i++) {
                    if (inputArray[i].type == "checkbox") {
                        inputArray[i].checked = inputObj.checked;
                    }
                }
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
            <form action="admin/findByPage.do" id="mainForm" method="post">
               <input type="hidden" name="currentPage" id="currentPage" value="1">
                <!--查询-->
                <div class="search_add">
                    <div>
                        模块：
                        <select id="selModules" name="privilegeId" class="select_search">
                            <option value="-1">全部</option>
                            <option value="1" 
                            	<c:if test="${adminPage.privilegeId==1}">
                          		selected
                          	</c:if>
                            >角色管理</option>
                            <option value="2" 
                            	<c:if test="${adminPage.privilegeId==2}">
                          		selected
                          	</c:if>
                            >管理员管理</option>
                            <option value="3" 
                            	<c:if test="${adminPage.privilegeId==3}">
                          		selected
                          	</c:if>
                            >产品管理</option>
                            <option value="4"
                            	<c:if test="${adminPage.privilegeId==4}">
                          		selected
                          	</c:if>
                            >修改密码</option>
                        </select>
                    </div>
                    <div>角色：<input type="text" name="roleName" value="${adminPage.roleName }" class="text_search width200" /></div>
                    <div><input type="submit" value="搜索" class="btn_search"/></div>
                    <input type="button" value="密码重置" class="btn_add" onclick="resetPwd();" />
                    <input type="button" value="增加" class="btn_add" onclick="location.href='admin/toAdd.do';" />
                </div>
                <!--删除和密码重置的操作提示-->
                <div id="operate_result_info" class="operate_fail">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                    <span>删除失败！数据并发错误。</span><!--密码重置失败！数据并发错误。-->
                </div> 
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                      <thead>
                        <tr>
                            <th class="th_select_all">
                                <input type="checkbox" onclick="selectAdmins(this);" />
                                <span>全选</span>
                            </th>
                            <th>管理员ID</th>
                            <th>姓名</th>
                            <th>登录名</th>
                            <th>电话</th>
                            <th>电子邮件</th>
                            <th class="width100">拥有角色</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>   
                      <c:forEach items="${adminList }" var="admin">
                                     
                        <tr>
                            <td><input type="checkbox" name="ids" value="${admin.id}" /></td>
                            <td>${admin.id}</td>
                            <td>${admin.name }</td>
                            <td>${admin.admin_code }</td>
                            <td>${admin.telephone }</td>
                            <td>${admin.email }</td>
                            <td>
                                <a class="summary"  onmouseover="showDetail(true,this);" onmouseout="showDetail(false,this);">
								 <c:forEach varStatus="status" items="${admin.roles}" var="role">
                              			<c:choose>
                              				<c:when test="${status.first}">
                              				${role.name}
                              				</c:when>
                              				<c:when test="${status.index==1}">
											...
                              				</c:when>
                              				 
                              			</c:choose>
                                    </c:forEach>
								</a>
                                <!--浮动的详细信息-->
                                <div class="detail_info">
                                    <c:forEach varStatus="status" items="${admin.roles}" var="role">
									<!-- status 
										index:元素索引
										first:返回是否是第一个元素
										last:返回是否是最后一个元素
									 -->
                              			<c:choose>
                              				<c:when test="${status.last}">
                              				${role.name}
                              				</c:when>
                              				<c:otherwise>
                              				${role.name},
                              				</c:otherwise>
                              			</c:choose>
                                    </c:forEach>
                                </div>
                            </td>
                            <td class="td_modi">
                                <input type="button" value="修改" class="btn_modify" onclick="location.href='admin/toUpdate.do?id=${admin.id}';" />
                                <input type="button" value="删除" class="btn_delete" onclick="deleteAdmin(${admin.id});" />
                            </td>
                        </tr>
                       </c:forEach>      
                 	</tbody>
                    </table>
                </div>
                <!--分页-->
                <div id="pages">
        	        <a href="javascript:;" onclick="getSubmit(${adminPage.prePage })">上一页</a>
                   <%-- <c:forEach begin="1" end="${adminPage.totalPage }" var="pageIndex">
                   	<c:choose>
                   		<c:when test="${adminPage.currentPage==pageIndex}">
                    <a href="javascript:;" onclick="getSubmit(${pageIndex })" class="current_page">${pageIndex }</a>
                   		</c:when>
                   		<c:otherwise>
                    <a href="admin/findByPage.do?currentPage=${pageIndex }">${pageIndex }</a>
                   		</c:otherwise>
                   	</c:choose>
                   </c:forEach> --%>
                   <c:forEach items="${lists}" var="data">
                	<c:choose>
       					<c:when test="${adminPage.currentPage==data }">
       						<a  href="javascript:;" onclick="getSubmit(${data })" class="current_page">${data }</a>
       					</c:when>  
       					<c:otherwise>
       							<a href="javascript:;" onclick="getSubmit(${data })">${data }</a>
       					</c:otherwise>       	
                	</c:choose>
                  </c:forEach>
                    
                    <a href="javascript:;" onclick="getSubmit(${adminPage.nextPage })">下一页</a>
                </div>                    
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <span>版权所有(C)java工程师石丹</span>
        </div>
    </body>
</html>
