<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/views/users/signup</title>
</head>
<body>
	<div class="container">
		<p>
			<c:choose>
				<c:when test="${code eq 1 }">
					관리자님 가입되었습니다.
				</c:when>
				<c:when test="${code eq 2 }">
					판매자님 가입되었습니다.
				</c:when>
				<c:otherwise>
					회원님 가입되었습니다.
				</c:otherwise>
			</c:choose>
			<a href="${pageContext.request.contextPath}/users/loginform">로그인 하러가기</a>
		</p>
	</div>
</body>
</html>