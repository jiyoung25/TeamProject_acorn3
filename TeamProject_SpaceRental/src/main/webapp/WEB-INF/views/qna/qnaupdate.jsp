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
<<<<<<< HEAD
	<!-- 네비바 include -->
	   <c:choose>
	      <c:when test="${not empty sessionScope.id }">
	         <jsp:include page="/WEB-INF/include/navbar2.jsp"/>
	      </c:when>
	      <c:otherwise>
	         <jsp:include page="/WEB-INF/include/navbar.jsp"/>
	      </c:otherwise>
	   </c:choose> 

	<!-- footer include -->
	  <jsp:include page="/WEB-INF/include/footer.jsp"/>
	  
	  
	<script>
		alert("${id} 님 글을 수정 했습니다.");
		location.href = "${pageContext.request.contextPath}/qna/qnadetail?num=${param.num}";
	</script>
	
=======
	<script>
		alert("${id} 님 글을 수정 했습니다.");
		location.href = "${pageContext.request.contextPath}/qna/qnadetail?num=${param.num}";
	</script>
>>>>>>> refs/remotes/origin/daheen
</body>
</html>