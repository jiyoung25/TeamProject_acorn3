<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Space Rental</title>

<%-- 폰트 --%>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>

<%-- vue.js --%>
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.min.js"></script>

<%-- animate.css --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

<%-- import from static folder --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chatbot.css">
<script src="${pageContext.request.contextPath}/js/chatbot.js"></script>
<style>
	.container > img {
	  position: absolute;
	  width: 100%;
	  height: 100%
	  /* height: 100%; */
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	}
	.card-img-top {
		height : 15rem;
		object-fit : cover;
	}
</style>
</head>

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
	      		</c:when>
	      	</c:choose>
	     	</c:otherwise>
	  	</c:choose>



	<!--카테고리 영역 시작-->
	<div class="m-5 p-5 text-center  ">
	   <div class="row">
			<div class="col-md-4">
				<h2><img src="https://cdn-icons-png.flaticon.com/512/9131/9131526.png" style="width: 50px;" alt=""></h2>
			</div>
			<div class="col-md-4">
				<h2 class="section-heading text-uppercase" style="font-family: 'Black Han Sans', sans-serif;">Service list</h2>
				<h3 class="section-subheading text-muted">다양한 공간을 만나보세요</h3>
			</div>
			<div class="col-md-4">
				<h2><img src="https://cdn-icons-png.flaticon.com/512/9131/9131526.png" style="width: 50px;" alt=""></h2>
			</div>
		</div>
	</div>
	
	<!--카테고리-->
	<div class="container text-center">
		<div class="row">
		   <!--파티룸-->
			<div class="col" >
				<img src="https://cdn-icons-png.flaticon.com/512/2279/2279642.png" style=" width: 200px; " alt="">
				<h2 class="fw-normal" style="font-family: 'Black Han Sans', sans-serif;">파티룸</h2>
				<p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/space/list?cate_num=1">보러가기</a></p>
			</div>
			<!--연습실-->
			<div class="col">
			    <img src="https://cdn-icons-png.flaticon.com/512/4488/4488230.png" style=" width: 200px; " alt="">
				<h2 class="fw-normal" style="font-family: 'Black Han Sans', sans-serif;">연습실</h2>
				<p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/space/list?cate_num=2">보러가기</a></p>
			</div>
			<!--공유주방 -->
			<div class="col">
			    <img src="https://cdn-icons-png.flaticon.com/512/3575/3575648.png" style=" width: 200px; " alt="">
				<h2 class="fw-normal" style="font-family: 'Black Han Sans', sans-serif;">공유주방</h2>
				<p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/space/list?cate_num=3">보러가기</a></p>
			</div>
			<!--스터디룸-->
			<div class="col">
			    <img src="https://cdn-icons-png.flaticon.com/512/4536/4536658.png" style=" width: 200px; " alt="">
				<h2 class="fw-normal" style="font-family: 'Black Han Sans', sans-serif;">스터디룸</h2>
				<p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/space/list?cate_num=4">보러가기</a></p>
			</div>
			<!--강의실-->
			<div class="col">
			    <img src="https://cdn-icons-png.flaticon.com/512/4557/4557212.png" style=" width: 200px; " alt="">
				<h2 class="fw-normal" style="font-family: 'Black Han Sans', sans-serif;">강의실</h2>
				<p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/space/list?cate_num=5">보러가기</a></p>
			</div>
		</div>
	</div>
    <!---카테고리 끝-->

	<!--carousel-->
	<div class="container text-center">     
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" data-interval="5000">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="https://images.unsplash.com/photo-1573164574511-73c773193279?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="https://images.unsplash.com/photo-1537365587684-f490102e1225?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="https://images.unsplash.com/photo-1519671482749-fd09be7ccebf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
   	</br>
	<!-- card -->
	<div class="container">
		<h4><strong>최근 등록된 리뷰</strong></h3>
		<div class="row text-center">
			<c:forEach var="tmp" items="${recentReviewList }">
				<div class="col-md-3">
					<div class="card" style="width: 18rem;">
						<img src="${pageContext.request.contextPath}/${tmp.mainImagePath }" class="card-img-top" alt="...">
						<div class="card-body">
						    <h5 class="card-title">${tmp.space_name }</h5>
						    <p class="card-text">
						    	★: ${tmp.star/2 }점
						    </p>
						    <p>${tmp.review_content }</p>
						</div>
					</div>
				</div>
			</c:forEach>	
		</div>
	</div>
   
	<!-- 챗봇 -->
	<div id="divBox" class="animate__animated animate__fadeIn">
		<span v-on:click="onChat" v-if="!isChatBotOn">
			<img id="chatIcon" src="${pageContext.request.contextPath}/image/speak.png"/>
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
							<button type="button" class="btn btn-light" value="${tmp.num }" onClick="onChatbot(event)">${tmp.question }</button>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
      
	<!--footer-->
	<div class="container">
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item"><a href="#" class="nav-link px-2 text-muted">top</a></li>
			</ul>
			<p class="text-center text-muted">© 2023 Company, Inc</p>
		</footer>
	</div>
        
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
