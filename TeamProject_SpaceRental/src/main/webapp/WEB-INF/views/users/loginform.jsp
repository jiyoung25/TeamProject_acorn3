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
		<label for="id">아이디</label>
		<input type="text" name="id" id="id" />
		<label for="pwd">비밀번호</label>
		<input type="password" name="pwd" id="pwd" />
		<br>
		<input type="checkbox" />아이디 기억하기
		<br>
		<button type="submit">제출하기</button>
	</div>
</body>
</html>