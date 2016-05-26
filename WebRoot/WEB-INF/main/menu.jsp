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
		<c:if test="${p.id==1}">
                	<c:choose>
                		<c:when test="${currentModule==1}">
                		<li><a href="role/findByPage.do" class="role_on"></a></li>
                		</c:when>
                 		<c:otherwise>
                		<li><a href="role/findByPage.do" class="role_off"></a></li>
                		</c:otherwise>
                	</c:choose>
                </c:if>
                <c:if test="${p.id==2}">
                	<c:choose>
                		<c:when test="${currentModule==2}">
                 		<li><a href="admin/findByPage.do" class="admin_on"></a></li>
                		</c:when>
                		<c:otherwise>
                		<li><a href="admin/findByPage.do" class="admin_off"></a></li>
                		</c:otherwise>
                	</c:choose>
                </c:if>
                <c:if test="${p.id==3}">
                	<c:choose>
                		<c:when test="${currentModule==3}">
                 		<li><a href="product/findByPage.do" class="fee_on"></a></li>
                		</c:when>
                		<c:otherwise>
                		<li><a href="product/findByPage.do" class="fee_off"></a></li>
                		</c:otherwise>
                	</c:choose>
                </c:if>
				<c:if test="${p.id==4}">
                	<c:choose>
                		<c:when test="${currentModule==4}">
                 		<li><a href="navigation/findByPage.do" class="information_on"></a></li>
                		</c:when>
                		<c:otherwise>
                		<li><a href="navigation/findByPage.do" class="information_off"></a></li>
                		</c:otherwise>
                	</c:choose>
                </c:if>
        </c:forEach>
