<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/error/info.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>Oops!</h1>
		<p class="alert alert-danger">
		
			<%--
				예외 컨드롤러에서 
				ModelAndView mView = new ModelAndView();
				mView.addObject("exception", nde);
				exception 이라는 키값으로 예외객체를 담았기 때문에
				예외 메세지는 
				${exception.message} (는 ${exception.getMessage() } 를 대신한다)
				로 출력할수있다.
			--%>
			
			<strong>${exception.message}</strong>
			<a href="${pageContext.request.contextPath}/">인덱스로 돌아가기</a>
		</p>
	</div>
</body>
</html>