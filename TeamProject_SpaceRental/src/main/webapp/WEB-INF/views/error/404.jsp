<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/error/404.jsp</title>
</head>
<body>
	<div class="container">
		<h3>404</h3>
		<p>
			요청하신 페이지는 존재 하지 않습니다.
			<a href="${pageContext.request.contextPath}/">인덱스로</a>
		</p>
	</div>
</body>
</html>