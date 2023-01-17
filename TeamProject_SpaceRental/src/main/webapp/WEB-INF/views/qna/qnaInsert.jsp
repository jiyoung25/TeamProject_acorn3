<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/views/qna/qnaInsertjsp</title>
</head>
<body>
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
		alert("새글이 추가 되었습니다.");
		location.href="${pageContext.request.contextPath}/space/detail?cate_num=${cate_num}&space_num=${space_num}";
	</script>
	
</body>
</html>