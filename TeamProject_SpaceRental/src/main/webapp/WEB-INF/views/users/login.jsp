<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<style>
	a {
		text-decoration-line: none;
	}
</style>
<title>/views/users/login.jsp</title>
</head>
<body>
	<%-- 네비바 --%>
	<c:choose>
		<c:when test="${empty sessionScope.id }">
        	<jsp:include page="/WEB-INF/include/navbar_sidebar_SessionX.jsp"/>
      	</c:when>
      	<c:otherwise>
	      	<c:choose>
	      		<c:when test="${usersCode eq 2 }">
	      	  		<jsp:include page="/WEB-INF/include/navbar_sessionO_seller.jsp"/>
	         		<jsp:include page="/WEB-INF/include/sidebar_seller.jsp"/>
	      		</c:when>
	      		<c:when test ="${usersCode eq 3 }">
					<jsp:include page="/WEB-INF/include/navbar_sessionO_users.jsp"/>
			      	<jsp:include page="/WEB-INF/include/sidebar_user.jsp"/>
	      		</c:when>
	      		<c:when test = "${usersCode eq 1 }">
	      		</c:when>
	      	</c:choose>
      	</c:otherwise>
   	</c:choose>
   
	<div class="container">
		<c:choose>
			<c:when test="${not empty id }">
				<script>
					console.log('${url}');
					location.href = '${url}';
				</script>
			</c:when>
			<c:otherwise>
				<h3 class="mt-3 mb-3">로그인 실패</h3>
				<p class="alert alert-danger">
					로그인 정보를 다시 확인해주세요.
					<a href="${pageContext.request.contextPath}/users/loginform?url=${encodedUrl}" class='alert-link'>로그인 다시 시도하기</a>
				</p>
			</c:otherwise>
		</c:choose>
		
	</div>	
	
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
</body>
</html>