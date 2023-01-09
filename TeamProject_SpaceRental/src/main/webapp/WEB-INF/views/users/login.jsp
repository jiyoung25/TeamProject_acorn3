<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/login.jsp</title>
</head>
<body>
	<div class="container">
		<h1>Login notification</h1>
		<c:choose>
			<c:when test="${not empty id }">
				<h3>로그인 성공</h3>
				<p>
					<strong>${id }</strong>님 로그인 되었습니다.
					<a href="${pageContext.request.contextPath}/">확인</a>
				</p>
			</c:when>
			<c:otherwise>
				<h3>로그인 실패</h3>
				<p>
					로그인 정보를 다시 확인해주세요.
					<a href="${pageContext.request.contextPath}/users/loginform">로그인 다시 시도하기</a>
				</p>
			</c:otherwise>
		</c:choose>
	</div>	
</body>
</html>