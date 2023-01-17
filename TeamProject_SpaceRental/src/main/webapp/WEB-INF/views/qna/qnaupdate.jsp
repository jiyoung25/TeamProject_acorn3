<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/views/qna/qnaupdate.jsp</title>
</head>
<body>
	<script>
		alert("${id} 님 글을 수정 했습니다.");
		location.href = "${pageContext.request.contextPath}/qna/qnadetail?num=${param.num}";
	</script>
</body>
</html>