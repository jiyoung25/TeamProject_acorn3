<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>/views/users/signupform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>관리자 회원 가입 폼 입니다.</h1>
		<form action="${pageContext.request.contextPath}/users/signup"
			method="post" id="myForm">
			<div>
				<label class="control-label" for="id">아이디</label> 
				<input class="form-control" type="text" name="id" id="id" />
			</div>
			<div>
				<label class="control-label" for="pwd">비밀번호</label> 
				<input class="form-control" type="password" name="pwd" id="pwd" />
			</div>
			<div>
				<label class="control-label" for="pwd2">비밀번호 확인</label> 
				<input class="form-control" type="password" name="pwd2" id="pwd2" />
			</div>
			<div>
				<label class="control-label" for="email">이메일</label> 
				<input class="form-control" type="text" name="email" id="email" />
			</div>
			<div>
				<label class="control-label" for="code"></label> 
				<input class="form-control" type="hidden" name="code" id="code" value=1 />
			</div>
			<button type="submit">가입</button>

		</form>
	</div>
</body>
</html>