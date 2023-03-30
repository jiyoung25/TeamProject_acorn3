<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
<title>공간 리스트(판매자) :Ubiquitous</title>
<style>
   /* card 이미지 부모요소의 높이 지정 */
   .img-wrapper{
      height: 200px;
      /* transform 을 적용할대 0.3s 동안 순차적으로 적용하기 */
      transition: transform 0.3s ease-out;
   }
   /* .img-wrapper 에 마우스가 hover 되었을때 적용할 css */
   .img-wrapper:hover{
      /* 원본 크기의 1.1 배로 확대 시키기*/
      transform: scale(1.1);
   }
   
   .card .card-text{
      /* 한줄만 text 가 나오고  한줄 넘는 길이에 대해서는 ... 처리 하는 css */
      display:block;
      white-space : nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
   }
   	.img-wrapper img{
	   	width: 100%;
	   	height: 100%;
	   	/* fill | contain | cover | scale-down | none(default) */
	   	/*	
	   		cover - 부모의 크기에 맞게 키운 후, 자른다. 비율은 일정하게 증가한다. 
	   		contain - 안잘린다. 대신 빈 공간이 남을 수 있다.
	   		fill - 부모의 크기에 딱 맞게, 비율 관계 없이 맞춘다.(이미지가 일그러질 수 있다.)
	   		scale-down - 가로, 세로 중에 큰 것을 부모의 크기에 맞춘 상태까지만 커지거나 작아지고, 비율은 일정하다.
	   	*/
		object-fit: contain;	
   	}
   	a {
		 text-decoration-line: none;
		/*   text-decoration-line: underline; */
		/*   text-decoration-line: overline; */
		/*   text-decoration-line: line-through; */
		/*   text-decoration-line: underline line-through overline; */
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
	<div class="container">	
		<h1 class="mt-3 mb-3">내 공간정보 관리</h1>
			<button class="btn btn-outline-dark" onclick="location.href=`${pageContext.request.contextPath}/seller/spaceinfo`">새 공간 등록하기</button>
			<div style="height: 25px;"></div>
		   	<div class="row">
				<c:forEach var="tmp" items="${list }">
					<div class="col-4 col-md-3 col-lg-2">
		         		<div class="card mb-3">	            		
		               		<div class="img-wrapper" onclick="location.href=`${pageContext.request.contextPath}/space/detail?space_num=${tmp.space_num}`">
		                  		<img class="card-img-top" src="${pageContext.request.contextPath }${tmp.mainImagePath}" style="cursor:pointer;" />
		               		</div>
		            		<div class="card-body">
		            			<p class="card-text"><strong>${tmp.space_name}</strong></p>
		               			<p><small>공간번호: ${tmp.space_num}</small></p>							
								<a href="spaceupdate?space_num=${tmp.space_num}">수정</a>
								<a href="delete?space_num=${tmp.space_num }" onClick="deleteLink(); return false;">삭제</a>						
		            		</div>
		         		</div>
		      		</div>
				</c:forEach>
		</div>
	   	<script>
	   		const deleteLink = function(){
	   			confirm("해당 글을 삭제하시겠습니까?")?this.submit():"";
	   		}
	   	</script>
	   	
	   <!-- footer include -->
	  <jsp:include page="/WEB-INF/include/footer.jsp"/>
	</div>
</body>
</html>