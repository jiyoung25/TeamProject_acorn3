<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Space Rental</title>
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<style>
	a {
		text-decoration: none;
	}
	
	a:hover {
		font-weight: bold;
		text-decoration: none;
 	}
</style>
</head>
<body>
	<%-- 네비바 --%>
	<c:choose>
		<c:when test="${empty sessionScope.id }">
	       	<jsp:include page="/WEB-INF/include/navbar_sidebar_SessionX.jsp"/>
	     	</c:when>
	     	<c:otherwise>
	      	<c:choose>
	      		<c:when test="${usersCode eq 2 }">
	      	  		<jsp:include page="/WEB-INF/include/navbar_sessionO_seller.jsp"/>
	         		<jsp:include page="/WEB-INF/include/sidebar_seller.jsp"/>
	      		</c:when>
	      		<c:when test ="${usersCode eq 3 }">
					<jsp:include page="/WEB-INF/include/navbar_sessionO_users.jsp"/>
			      	<jsp:include page="/WEB-INF/include/sidebar_user.jsp"/>
	      		</c:when>
	      		<c:when test = "${usersCode eq 1 }">
	      			<jsp:include page="/WEB-INF/include/navbar_sessionO_admin.jsp"/>
	      		</c:when>
	      	</c:choose>
	     	</c:otherwise>
	  	</c:choose>

	<div class="container">
		<h1>Ubiquitous를 사용해주셔서 감사합니다.</h1>
		<p class="alert alert-success">
			<strong>${requestScope.id }</strong> 님 탈퇴 처리 되었습니다.
			<a href="${pageContext.request.contextPath}/">홈으로 돌아가기</a>
		</p>
	</div>
</body>
</html>