<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/error/500.jsp</title>
</head>
<body>
	<div class="container">
		<h3>500</h3>
		<p>
			서버 내부에서 에러가 발생했습니다. 신속히 복구 하겠습니다.
			<a href="${pageContext.request.contextPath}/">인덱스로</a>
		</p>
	</div>
</body>
</html>