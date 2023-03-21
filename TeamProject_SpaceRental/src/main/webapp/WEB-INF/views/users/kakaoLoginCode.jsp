<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>카카오 회원가입 :Ubiquitous</title>
</head>
<body>
	<%--
		만약, 카카오계정으로 회원가입한 아이디가 존재하면 kakaoExist = "true", 아이디가 없으면 kakaoExist = "false"가 된다.
		kakaoExist가 "true"이면 로그인이 되었다는 팝업이 뜨고, home으로 리다이렉트 시킨다.
		kakaoExist가 "false"이면 추가 회원가입 정보 입력 창이 뜬다.
	--%>
	<c:if test="${kakaoExist eq 'true' }">
		<script>
			alert("로그인 되었습니다.");
			location.href="${pageContext.request.contextPath}/"
		</script>
	</c:if>
	
	<h3>추가 정보 입력</h3>
	<form action="${pageContext.request.contextPath}/users/signup" method="POST">
		<%-- 입력하지 않아도 되는 정보 --%>
		<input type="hidden" name="id" value="${kakaoId }" />
		<input type="hidden" name="pwd" value="${kakaoPwd }" />
		<c:if test="${email ne '' }">
			<input type="hidden" name="email" value="${email }" />
		</c:if>
		
		<%--입력해야할 정보 --%>
		<div>
			<label for="seller">판매자</label>
			<input type="radio" name="code" value="2" id="seller" />
			<label for="member">회원</label>
			<input type="radio" name="code" value="3" id="member" checked />
		</div>
		
		<div>
			<label for="id">아이디</label>
			<input type="text" id="id" value="카카오 계정" disabled />
		</div>
		<div>
			<label for="email">email</label>
			<input type="text" value="${email }" name="email" ${email eq "" ? "" : "disabled"}/>
		</div>
		<button type="submit"> 제출하기 </button>
	</form>
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp" />
</body>
</html>