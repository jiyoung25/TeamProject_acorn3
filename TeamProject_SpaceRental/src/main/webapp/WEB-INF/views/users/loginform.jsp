<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>Login form</title>
</head>
<body>
	<div class="container">
		<h3>Login Form</h3>
		<form action="${pageContext.request.contextPath}/users/login" method="post">
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" value="${cookie.cookId.value }" />
			<label for="pwd">비밀번호</label>
			<input type="password" name="pwd" id="pwd" />
			<br>
			<input type="checkbox" name="remember" value="true" ${cookie.cookId eq true? 'checked':''  } />아이디 기억하기
			<br>
			<button type="submit">로그인</button>
		</form>
		<p>아이디가 없으신가요? <a href="${pageContext.request.contextPath}/users/signupform">회원가입</a></p>
	</div>
</body>
</html>