<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Space Rental</title>
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
</head>
<body>
	<div class="container">
		<h1>Ubiquitous를 사용해주셔서 감사합니다.</h1>
		<p class="alert alert-success">
			<strong>${requestScope.id }</strong> 님 탈퇴 처리 되었습니다.
			<a href="${pageContext.request.contextPath}/">홈으로 돌아가기</a>
		</p>
	</div>
</body>
</html>