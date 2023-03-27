<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp" />
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
<style>
.form-check-input {
    margin-left: -0.5rem; !important
}
</style>
<title>카카오 회원가입 :Ubiquitous</title>
</head>
<body>
	<%--
		만약, 카카오계정으로 회원가입한 아이디가 존재하면 kakaoExist = "true", 아이디가 없으면 kakaoExist = "false"가 된다.
		kakaoExist가 "true"이면 로그인이 되었다는 팝업이 뜨고, 리다이렉트 시킨다.
		kakaoExist가 "false"이면 추가 회원가입 정보 입력 창이 뜬다.
	--%>
	<c:if test="${kakaoExist eq true }">
		<script>
			// 쿠키값을 받아오는 함수
			const getCookieValue = (key) => {
				let cookieKey = key + "="; 
				let result = "";
				const cookieArr = document.cookie.split(";");
				for(let i = 0; i < cookieArr.length; i++) {
					if(cookieArr[i][0] === " ") {
				    	cookieArr[i] = cookieArr[i].substring(1);
				    }
				    if(cookieArr[i].indexOf(cookieKey) === 0) {
				    	result = cookieArr[i].slice(cookieKey.length, cookieArr[i].length);
				    	return result;
				    }
				}
				return result;
			}
			//url이라는 이름으로 저장된 쿠키 값을 가져와서
			let url = getCookieValue("url");
			url = url == '' ? "${pageContext.request.contextPath}/" : url;
			console.log("url"+url);
			//쿠키를 삭제하고
			document.cookie = 'url=; expires=Thu, 01 Jan 1970 00:00:01 GMT;'
			//알림 + redirect시키기
			alert("로그인 되었습니다.");
			location.href = url;
		</script>
	</c:if>
	
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
					<jsp:include page="/WEB-INF/include/navbar_sessionO_admin.jsp"/>
					<jsp:include page="/WEB-INF/include/sidebar_admin.jsp"/>
	            </c:when>
			</c:choose>
		</c:otherwise>
	</c:choose>
	
	<%-- 본문 --%>
	<div class="container">
		<h3 class="mt-5 mb-3 text-center">KAKAO 계정 회원가입</h3>
		<h3 class="mt-3 mb-5 text-center">추가 정보 입력</h3>
		<form action="${pageContext.request.contextPath}/users/signup" method="POST">
			<%-- 입력하지 않아도 되는 정보 --%>
			<input type="hidden" name="id" value="${kakaoId }" />
			<input type="hidden" name="pwd" value="${kakaoPwd }" />
			<c:if test="${email ne '' }">
				<input type="hidden" name="email" value="${email }" />
			</c:if>
			
			<%--입력해야할 정보 --%>
			<div class="text-center">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-3">
						<div class="input-group mb-3">
							<div class="input-group-text">
								<input class="form-check-input mt-0" type="radio" aria-label="Radio button for following text input" type="radio" name="code" value="2" id="seller" />
							</div>
							<input type="text" class="form-control" aria-label="Text input with radio button" value="판매자" readonly>
						</div>
					</div>
					<div class="col-md-3">
						<div class="input-group mb-3">
							<div class="input-group-text">
								<input class="form-check-input mt-0" type="radio" aria-label="Radio button for following text input" type="radio" name="code" value="3" id="member" checked />
							</div>
							<input type="text" class="form-control" aria-label="Text input with radio button" value="회원" readonly>
						</div>
					</div>
					<div class="col-md-3"></div>
				</div>
				<div class="row">
					<div class="col-3"></div>
					<div class="col-md-6">
						<div class="row">
							<div class="input-group mb-3">
								<span class="input-group-text" style="width:20%; justify-content: center; align-items: center; display: flex;">ID</span>
								<input type="text" name="id" id="id" class="form-control" value="카카오 계정" disabled />
							</div>
						</div>
						<div class="row">
							<div class="input-group mb-3">
								<span class="input-group-text" style="width:20%; justify-content: center; align-items: center; display: flex;">E-mail</span>
								<input type="text" id="email" class="form-control" value="${email }" name="email" ${email eq "" ? "" : "disabled"} />
							</div>
						</div>
						<div class="row">
							<div>
								<button type="submit" id="submitBtn" class="btn btn-outline-dark" style="width:100%;"> 제출하기</button>
							</div>
						</div>
					</div>
					<div class="col-3"></div>
				</div>
			</div>
		</form>
	</div>
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp" />
	<%-- 이메일 검증식 --%>
	<script>
		let isEmailValid = false;
		document.querySelector("#email").addEventListener("input", function(){
			this.classList.remove("is-valid");
			this.classList.remove("is-invalid");
			//입력한 이메일
			const inputEmail=this.value;
			//이메일을 검증할 정규 표현식  
			const reg=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			//만일 입력한 이메일이 정규표현식 검증을 통과 하지 못했다면
			if(!reg.test(inputEmail)){
				this.classList.add("is-invalid");
				isEmailValid=false;
			}else{//통과 했다면 
				this.classList.add("is-valid");
				isEmailValid=true;
			}
		});
		document.querySelector("#submitBtn").addEventListener("click", function(e){
			if(!isEmailValid){
				e.preventDefault();
				alert("이메일을 확인해주세요.");
			}
		});
	</script>
</body>
</html>