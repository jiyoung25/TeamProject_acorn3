<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Review :Ubiquitous</title>
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<%-- import from static folder --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/star.css" />
<style>
   .content{
      border: 1px dotted gray;
   }
   
   /* 댓글 프로필 이미지를 작은 원형으로 만든다. */
   .profile-image{
      width: 50px;
      height: 50px;
      border: 1px solid #cecece;
      border-radius: 50%;
   }
   /* ul 요소의 기본 스타일 제거 */
   .comments ul{
      padding: 0;
      margin: 0;
      list-style-type: none;
   }
   .comments dt{
      margin-top: 5px;
   }
   .comments dd{
      margin-left: 50px;
   }
   .comment-form textarea, .comment-form button{
      float: left;
   }
   .comments li{
      clear: left;
   }
   .comments ul li{
      border-top: 1px solid #888;
   }
   .comment-form textarea{
      width: 84%;
      height: 100px;
   }
   .comment-form button{
      width: 14%;
      height: 100px;
   }
   /* 댓글에 댓글을 다는 폼과 수정폼은 일단 숨긴다. */
   .comments .comment-form{
      display: none;
   }
   /* .reply_icon 을 li 요소를 기준으로 배치 하기 */
   .comments li{
      position: relative;
   }
   .comments .reply-icon{
      position: absolute;
      top: 1em;
      left: 1em;
      color: red;
   }
   pre {
     display: block;
     padding: 9.5px;
     margin: 0 0 10px;
     font-size: 13px;
     line-height: 1.42857143;
     color: #333333;
     word-break: break-all;
     word-wrap: break-word;
     background-color: #f5f5f5;
     border: 1px solid #ccc;
     border-radius: 4px;
   }   
   
   .loader{
      /* 로딩 이미지를 가운데 정렬하기 위해 */
      text-align: center;
      /* 일단 숨겨 놓기 */
      display: none;
   }   
   
   .loader svg{
      animation: rotateAni 1s ease-out infinite;
   }
   
   @keyframes rotateAni{
      0%{
         transform: rotate(0deg);
      }
      100%{
         transform: rotate(360deg);
      }
   }
   
   a:link {
   	text-decoration: none;
   }
   
   span.star{
		font-size: 1.5rem;
   }
   
   .grid-a-button{
   		display: grid;
    	grid-template-columns: 5fr 1fr 7fr;
   }
   
	.container img {
		max-width: 100%;
		height: auto;
		object-fit: cover;
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
   	
   	<%-- 리뷰 내용 --%>
	<div class="container">	
		<h1 class="mt-3 mb-3">Review 상세 보기</h1>
		<!-- 룸이름 -->
		<!-- 리뷰제목 -->
		<div class="title" style="padding: .43em 0em .35em .7em; margin: 1em 0; font-weight: bold; color: #232323; background: #f1f3f5; border-left: solid 10px;">
			<div class="room">
				<h5>${dto.space_name }.</h5>
			</div>
			<h3>${dto.review_title  }</h3>
		</div>
		<!-- 작성자, 등록일, 조회수, 별점 -->
		<div class="user">
			<strong>by.</strong>${dto.review_writer } 
	    	<strong>작성일</strong>: ${dto.review_regdate }
	    	<strong>조회수</strong>: ${dto.viewcount }
	    	<strong>별점</strong>:
			<span class="star">
				★★★★★
				<span style="width: ${dto.star *10 }%;">★★★★★</span>
			</span>
		</div>
		
		<br>
		
		<!-- 내용 -->
		<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-body-tertiary p-3 rounded-2" tabindex="0">
	 	   <p style="width: 100%; height: 100%; object-fit:cover;">${dto.review_content }</p>
		</div>
    	
    	<br>
    	
    	<div class="grid-a-button">
    		<div>
				<%-- 만일 이전글(더 옛날글)의 글번호가 0 이 아니라면 (이전글이 존재한다면) --%>
				<c:if test="${dto.prevNum ne 0 }">
					<a href="usersReviewDetail?review_num=${dto.prevNum }" class="btn btn-outline-dark" role="button">이전 글</a>
				</c:if>
				<%-- 만일 다음글(더 최신글)의 글번호가 0 이 아니라면 (다음글이 존재한다면) --%>
				<c:if test="${dto.nextNum ne 0 }">
					<a href="usersReviewDetail?review_num=${dto.nextNum }" class="btn btn-outline-dark" role="button">다음 글</a>
				</c:if>
			</div>
			
			<div> </div>
			
    		<div style="text-align: right;">
				<c:if test="${usersCode eq 2 }">
					<a href="${pageContext.request.contextPath}/seller/sellerReview" class="btn btn-outline-dark" role="button">리뷰 목록으로</a>
				</c:if>
				<c:if test="${sessionScope.id eq dto.review_writer }">
					<button type="button" class="btn btn-outline-dark" 
						onclick="location.href=`${pageContext.request.contextPath}/users/reviewList`">
						나의 리뷰 목록
					</button>
					<button type="button" class="btn btn-outline-dark"
						onclick="location.href=`${pageContext.request.contextPath}/users/reviewupdateform?review_num=${dto.review_num }`">
						수정
					</button>
					<button type="button" class="btn btn-outline-dark" onclick="deleteConfirm()">
						삭제
					</button>
					
					<script>
						function deleteConfirm() {
							const isDelete = confirm("이 글을 삭제 하겠습니까?");
							if (isDelete) {
								location.href = "reviewDelete?review_num=${dto.review_num}";
							}
						}
					</script>
				</c:if>
			</div>
		</div>

	</div>
	<script src="${pageContext.request.contextPath}/js/gura_util.js"></script>
	<!-- <script>
   
	   //클라이언트가 로그인 했는지 여부
	   let isLogin=${ not empty id };
	   
	   document.querySelector(".insert-form")
	      .addEventListener("submit", funtion(e){
	         //만일 로그인 하지 않았으면 
	         if(!isLogin){
	            //폼 전송을 막고 
	            e.preventDefault();
	            //로그인 폼으로 이동 시킨다.
	            location.href=
	               "${pageContext.request.contextPath}/users/loginform?url=${pageContext.request.contextPath}/review/reviewdetail?review_num=${dto.review_num}";
	         }
	    });
	</script> -->
	
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>