<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/views/review/reviewdetail.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
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
</style>
</head>
<body>
	<div class="container">
		<%-- 만일 이전글(더 옛날글)의 글번호가 0 이 아니라면 (이전글이 존재한다면) --%>
		<c:if test="${dto.prevNum ne 0 }">
			<a href="reviewdetail?review_num=${dto.prevNum }">이전글</a>
		</c:if>
		<%-- 만일 다음글(더 최신글)의 글번호가 0 이 아니라면 (다음글이 존재한다면) --%>
		<c:if test="${dto.nextNum ne 0 }">
			<a href="reviewdetail?review_num=${dto.nextNum }">다음글</a>
		</c:if>
		
		<h3>글 상세 보기</h3>
		<table>
			<tr>
				<th>글번호</th>
				<td>${dto.review_num }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.review_writer }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.review_title }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${dto.viewcount }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${dto.review_regdate }</td>
			</tr>
			<tr>
				<td colspan="2">
					<div>${dto.review_content }</div>
				</td>
			</tr>
		</table>
		<c:if test="${usersCode eq 2 }">
			<a href="${pageContext.request.contextPath}/seller/sellerReview">뒤로가기</a>
		</c:if>
		<c:if test="${sessionScope.id eq dto.review_writer }">
			<a href="reviewupdateform?review_num=${dto.review_num }">수정</a>
			<a href="javascript:" onclick="deleteConfirm()">삭제</a>
			<script>
				function deleteConfirm() {
					const isDelete = confirm("이 글을 삭제 하겠습니까?");
					if (isDelete) {
						location.href = "delete?review_num=${dto.review_num}";
					}
				}
			</script>
		</c:if>

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
</body>
</html>