<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/views/review/reviewInsertjsp</title>
</head>
<body>
	<script>
		alert("새로운 Review가 추가 되었습니다.");
		location.href="${pageContext.request.contextPath}/space/detail?cate_num=${cate_num}&space_num=${space_num}";
	</script>
</body>
</html>