<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>로그인 :Ubiquitous</title>
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp" />
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">

<style>
.gradient-custom-2 {
	/* fallback for old browsers */
	background: #fccb90;
	/* Chrome 10-25, Safari 5.1-6 */
	background: -webkit-linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	background: linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
}

#kakaoLoginBtn:hover {
	cursor: pointer;
}
</style>
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
					<jsp:include page="/WEB-INF/include/navbar_sessionO_admin.jsp"/>
					<jsp:include page="/WEB-INF/include/sidebar_admin.jsp"/>
	            </c:when>
			</c:choose>
		</c:otherwise>
	</c:choose>

	<section class="h-100 gradient-form" style="background-color: #eee;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-xl-5">
					<div class="card rounded-3 text-black">
						<div class="row g-0">
							<div class="card-body p-md-5 mx-md-4">

								<div class="text-center">
									<h4 class="mt-1 mb-5 pb-1">
										<strong>Ubiquitous</strong>
									</h4>
								</div>
								<p>아이디/비밀번호 입력</p>
								<form action="${pageContext.request.contextPath}/users/login"
									method="post">
									<div class="mb-4">
										<%-- url정보 담기(loginfilter) --%>
										<c:choose>
											<c:when test="${ empty param.url }">
												<input type="hidden" name="url"
													value="${pageContext.request.contextPath}/" />
											</c:when>
											<c:otherwise>
												<input type="hidden" name="url" value="${param.url }" />
											</c:otherwise>
										</c:choose>
										<input type="text" name="id" id="form2Example11"
											class="form-control" value="${cookie.savedId.value }"
											placeholder="아이디" autofocus />
									</div>

									<div class="mb-2">
										<input type="password" id="form2Example22" name="inputPwd"
											class="form-control" placeholder="비밀번호" autofocus />
									</div>

									<input type="checkbox" name="remember" value="true"
										${not empty cookie.savedId? 'checked':''  } />아이디 기억하기 <br />
									<br />

									<div class="text-center pt-1 mb-5 pb-1">
										<button class="btn btn-outline-secondary btn-block mb-3"
											type="submit">Login</button>
										<div>
											<img id="kakaoLoginBtn"
												src="${pageContext.request.contextPath}/image/kakao_login_medium_wide.png"
												onClick="onKakaoLoginBtn()" />
										</div>


										<a class="text-muted" href="#!">비밀번호를 잊으셨나요?</a>
									</div>

									<div
										class="d-flex align-items-center justify-content-center pb-4">
										<p class="mb-0 me-2">아이디가 없으신가요?</p>
										<button type="button" class="btn btn-outline-secondary"
											onClick="signup()" id="signupBtn">회원가입</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		const signup = function(){
			location.href="${pageContext.request.contextPath}/users/signupform";
		}
		const onKakaoLoginBtn = function(){
			//카카오 로그인시에는 redirect url을 cookie값으로 보낸다.
			let url = "${param.url}";
			document.cookie = 'url=${param.url}';
			window.location.href='https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=2d35e9bcdd28d0e1fb622729f22bab0e&redirect_uri=http://3.39.204.231:8080/ubiquitous/users/kakaoLoginCode';
		};
	</script>
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp" />
</body>

</html>