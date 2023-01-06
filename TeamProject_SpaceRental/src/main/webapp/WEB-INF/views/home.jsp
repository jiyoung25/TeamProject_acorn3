<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>home</title>
</head>
<body>
	<div class="container">
		<h1>홈</h1>
		<ul>
			<li><a href="${pageContext.request.contextPath}/users/signupselect">회원가입</a></li>
			<li><a href="${pageContext.request.contextPath}/users/loginform">로그인</a></li>
		</ul>
	</div>
</body>
</html>