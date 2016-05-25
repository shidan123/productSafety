<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:choose>
    	<c:when test="${currentModule==0}">
        <li><a href="login/toIndex.do" class="index_on"></a></li>
    	</c:when>
    	<c:otherwise>
        <li><a href="login/toIndex.do" class="index_off"></a></li>
    	</c:otherwise>
    </c:choose>
 	<c:forEach items="${privileges }" var="p">
		<c:if test="${p.id==1 }">
   			<li><a href="role/findByPage.do" class="role_off"></a></li>
		</c:if>
		<c:if test="${p.id==2 }">
		<!-- 是否访问当前模块 -->
		<c:choose>
			<c:when test="${currentModule==2 }">
			<li><a href="admin/findByPage.do" class="admin_on"></a></li>
			</c:when>
			<c:otherwise>
			<li><a href="admin/findByPage.do" class="admin_off"></a></li>
			</c:otherwise>
		</c:choose>
			
   		</c:if>
		<c:if test="${p.id==3 }">
			<c:choose>
			<c:when test="${currentModule==3 }">
			  <li><a href="product/findByPage.do" class="fee_on"></a></li>
			</c:when>
			<c:otherwise>
			  <li><a href="product/findByPage.do" class="fee_off"></a></li>
			</c:otherwise>
		</c:choose>
   		</c:if>
        </c:forEach>
