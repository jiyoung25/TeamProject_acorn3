<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<title>비밀번호 수정 :Ubiquitous</title>
<style>
	label {
	  display: inline-block; /* 레이블을 인라인 블록 요소로 정의하여 박스의 좌측에 위치시킵니다. */
	  width: 130px; /* 레이블의 너비를 정의합니다. */
	  text-align: center; /* 레이블의 텍스트를 우측 정렬합니다. */
	  margin-right: 10px; /* 레이블과 박스 사이의 간격을 조절합니다. */
	}
</style>
</head>
<body>
	<%-- 네비바 --%>
	<c:choose>
		<c:when test="${empty sessionScope.id }">
        	<jsp:include page="/WEB-INF/include/navbar_sidebar_SessionX.jsp"/>
        	<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
      	</c:when>
      	<c:otherwise>
	      	<c:choose>
	      		<c:when test="${usersCode eq 2 }">
	      	  		<jsp:include page="/WEB-INF/include/navbar_sessionO_seller.jsp"/>
	         		<jsp:include page="/WEB-INF/include/sidebar_seller.jsp"/>
	         		<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
	      		</c:when>
	      		<c:when test ="${usersCode eq 3 }">
					<jsp:include page="/WEB-INF/include/navbar_sessionO_users.jsp"/>
			      	<jsp:include page="/WEB-INF/include/sidebar_user.jsp"/>
			      	<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
	      		</c:when>
	      		<c:when test = "${usersCode eq 1 }">
	      			<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
	      		</c:when>
	      	</c:choose>
      	</c:otherwise>
   	</c:choose> 
   
	<div class="container text-center" >
		<div class="row shadow p-3 mb-5 mt-5 bg-body rounded">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<h3 class="mt-3">비밀 번호 변경</h3>
				<form action="${pageContext.request.contextPath}/users/pwd_update" method="post" id="myForm">
					<div class="row text-center mt-4">
						<div class="input-group">
							<span class="input-group-text" style="width:35%; justify-content: center; align-items: center; display: flex;">기존 비밀번호</span>
							<input  type="password" name="pwd" id="pwd" class="form-control" />
						</div>
					</div>
					<div class="row text-center mt-4">
						<div class="input-group">
							<span class="input-group-text" style="width:35%; justify-content: center; align-items: center; display: flex;">새 비밀번호</span>
							<input  type="password" name="newPwd" id="newPwd" class="form-control" />
						</div>
					</div>
					<div class="row text-center mt-4">
						<div class="input-group mb-4">
							<span class="input-group-text" style="width:35%; justify-content: center; align-items: center; display: flex;">새 비밀번호 확인</span>
							<input  type="password" id="newPwd2" class="form-control" />
						</div>
					</div>
					<div class="row">
						<div class="col"><button type="submit" class="btn btn-dark" style="width:100%">수정하기</button></div>
						<div class="col"><button type="reset" class="btn btn-outline-dark" style="width:100%">리셋</button></div>
					</div>
				</form>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
	
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
	
	<script>
		//폼에 submit 이벤트가 일어났을때 실행할 함수를 등록하고 
		document.querySelector("#myForm").addEventListener("submit", function(e){
			let pwd1=document.querySelector("#newPwd").value;
			let pwd2=document.querySelector("#newPwd2").value;
			//새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
			if(pwd1 != pwd2){
				alert("비밀번호를 확인 하세요!");
				e.preventDefault();//폼 전송 막기 
			}
		});
	</script>
</body>
</html>


