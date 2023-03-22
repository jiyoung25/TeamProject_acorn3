<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
<title>리뷰 업데이트메세지 :Ubiquitous</title>
</head>
<body>
	<script>
		alert("${id} 님 글을 수정 했습니다.");
		location.href = "${pageContext.request.contextPath}/review/reviewdetail?review_num=${param.review_num}";
	</script>
</body>
</html>