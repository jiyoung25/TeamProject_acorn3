<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>예약 확인</title>
</head>
<body>
	<div class="container">
		<p>예약이 완료되었습니다.</p>
		<p>판매자의 예약 확인을 기다려주세요.</p>
		<a href="${pageContext.request.contextPath}/users/reserv_list">예약 리스트</a>
		<a href="${pageContext.request.contextPath}/">홈으로</a>
	</div>
</body>
</html>