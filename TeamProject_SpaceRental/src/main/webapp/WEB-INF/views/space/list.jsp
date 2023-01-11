<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>느어엉</title>
</head>
<body>
	<h3>공간 리스트</h3>
	<c:forEach var="tmp" items="${list }">
		${tmp.space_name}
	</c:forEach>
</body>
</html>