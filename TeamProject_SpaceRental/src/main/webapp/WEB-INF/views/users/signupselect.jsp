<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/views/users/signupselect.jsp</title>
</head>
<body>
	<div class="container">
		<h3><a href="${pageContext.request.contextPath}/users/signupform_manager">관리자로 회원가입하기</a></h3>
		<h3><a href="${pageContext.request.contextPath}/users/signupform_seller">판매자로 회원가입하기</a></h3>
		<h3><a href="${pageContext.request.contextPath}/users/signupform_users">구매자로 회원가입하기</a></h3>
	</div>
</body>
</html>