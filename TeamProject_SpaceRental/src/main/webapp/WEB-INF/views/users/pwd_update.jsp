<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
<style>
	a {
		text-decoration-line: none;
	}
</style>
<title>비밀번호 수정 성공여부 :Ubiquitous</title>
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
					<jsp:include page="/WEB-INF/include/sidebar_admin.jsp"/>
	            </c:when>
			</c:choose>
		</c:otherwise>
	</c:choose>
   
	<div class="container">
		<c:choose>
			<c:when test="${isSuccess }">
				<h3 class="mt-3 mb-3">비밀번호 수정 성공</h3>
				<p class="alert alert-success">
					<strong>${id }</strong> 님 비밀번호를 수정하고 로그 아웃되었습니다.
					<a href="${pageContext.request.contextPath}/users/loginform" class='alert-link'>다시 로그인 하러 가기</a>
				</p>
			</c:when>
			<c:otherwise>
				<h3 class="mt-3 mb-3">비밀번호 수정 실패</h3>
				<p class="alert alert-danger">
					이전 비밀번호가 일치하지 않습니다.
					<a href="${pageContext.request.contextPath}/users/pwd_updateform" class='alert-link'>다시 시도</a>
				</p>
			</c:otherwise>
		</c:choose>
	</div>

	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
</body>
</html>
