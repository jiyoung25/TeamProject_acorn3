<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>
	<c:choose>
		<c:when test="${cate_num eq 1 }">
			${cate_name } 목록
		</c:when>
		
	</c:choose>
</title>
</head>
<body>

</body>
</html>