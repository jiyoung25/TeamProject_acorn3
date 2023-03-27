<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
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
	<%-- 카카오 로그인 회원이라면 비밀번호를 바꿀 수 없다. --%>
	<c:if test="${fn:contains(sessionScope.id, 'kakao_') }">
		<script>
			alert("소셜 로그인 회원은 비밀번호를 바꿀 수 없습니다.");
			history.back();
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
   
	<div class="container text-center" >
		<div class="row shadow p-3 mb-5 mt-5 bg-body rounded">
			<div class="col-md-4"></div>
			<div class="col-lg-4">
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
						<small class="form-text text-muted">8자리이상 영문 대 소문자, 숫자, 특수문자를 사용하세요.</small>
					</div>
					<div class="row text-center mt-4">
						<div class="input-group mb-4">
							<span class="input-group-text" style="width:35%; justify-content: center; align-items: center; display: flex;">새 비밀번호 확인</span>
							<input  type="password" id="newPwd2" class="form-control" />
						</div>
					</div>
					<div class="row mb-5">
						<div class="col"><button type="submit" id="submitBtn" class="btn btn-dark" style="width:100%">수정하기</button></div>
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
		//비밀번호 검증식
		let isPwdValid = false;
		function checkPwd(){
			//먼저 2개의 클래스를 제거하고 
			document.querySelector("#newPwd").classList.remove("is-valid");
			document.querySelector("#newPwd").classList.remove("is-invalid");
			//입력한 두개의 비밀 번호를 읽어와서 
			const pwd=document.querySelector("#newPwd").value;
			const pwd2=document.querySelector("#newPwd2").value;
			
			//비밀번호를 검증할 정규 표현식
			const reg=/(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
			//만일 정규표현식 검증을 통과 하지 못했다면
			if(!reg.test(pwd)){
				document.querySelector("#newPwd").classList.add("is-invalid");
				isPwdValid=false;
				return; //함수를 여기서 끝내라 
			} else{
				isPwdValid=true;
			}
		}
		
		document.querySelector("#newPwd").addEventListener("input", function(){
			checkPwd();
		});
		
		//폼에 submit 이벤트가 일어났을때 실행할 함수를 등록하고 
		document.querySelector("#myForm").addEventListener("submit", function(e){
			//비밀번호가 검증식에 통과하지 못할 때 폼전송을 막는다.
			if(!isPwdValid){
				e.preventDefault();
				alert("비밀번호 양식을 확인해주세요.");
			}
			
			//새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
			let pwd1=document.querySelector("#newPwd").value;
			let pwd2=document.querySelector("#newPwd2").value;
			if(pwd1 != pwd2){
				alert("비밀번호를 확인 하세요!");
				e.preventDefault();//폼 전송 막기 
			}
		});
	</script>
</body>
</html>


