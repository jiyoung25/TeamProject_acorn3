<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chatbot.css">
<script src="${pageContext.request.contextPath}/js/chatbot.js"></script>
<title>home</title>
</head>
<body>
	<div class="container">
		<h1>홈</h1>
		<ul>
			<li><a
				href="${pageContext.request.contextPath}/users/signupform">회원가입</a></li>
			<li><a href="${pageContext.request.contextPath}/users/loginform">로그인</a></li>
			<li><a href="javascript:" onclick="logoutConfirm()">로그아웃 하기</a></li>
		</ul>
		<div id="divBox" class="animate__animated animate__fadeIn">
			<span v-on:click="onChat" v-if="!isChatBotOn"> <svg
					id="chatIcon" xmlns="http://www.w3.org/2000/svg" width="16"
					height="16" fill="currentColor" class="bi bi-chat-left-dots-fill"
					viewBox="0 0 16 16">
                    <path
						d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H4.414a1 1 0 0 0-.707.293L.854 15.146A.5.5 0 0 1 0 14.793V2zm5 4a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
                </svg>
			</span>
			<div v-if="isChatBotOn">
				<div id="chatbot" class="animate__animated animate__fadeInUp">
					<div id="chatbot_head">
						<button v-on:click="onChat" type="button" class="btn-close" aria-label="Close"></button>
					</div>
					<div id="chatbot_body" class="wrap">
						<div id="chatbot_main"></div>
						<div id="chatbot_question">
							<c:forEach var="tmp" items="${qnaList }" >
								<button type="button" class="btn btn-light" value="${tmp.num }"
									onClick="onChatbot(event)">
									${tmp.question }
								</button>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function logoutConfirm(){
			let isLogout = confirm("로그아웃 하시겠습니까?");
			if(isLogout===true){
				location.href="${pageContext.request.contextPath}/users/logout";
			}
		}
	</script>
	<script>
        let divBox = new Vue({
            el: "#divBox",
            data: {
                isChatBotOn: false
            },
            methods: {
                onChat: function () {
                    this.isChatBotOn = !this.isChatBotOn;
                }
            }
        });
    </script>
</body>
</html>