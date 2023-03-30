<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	#profileImage{
		width: 200px;
	    height: 200px;
	    border: 1px solid #cecece;
	    border-radius: 50%;
	}
</style>

<!-- 로그인이 되어있는 상태-->
<!-- 구매자 사이드바-->
<nav id="navAndSide">
	<div class="offcanvas offcanvas-end " tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
	    <div class="offcanvas-header ">
			<h5 class="offcanvas-title mx-auto" id="offcanvasNavbarLabel">My Page</h5>
			<button type="button" class="btn-close " data-bs-dismiss="offcanvas" aria-label="Close"></button>
	    </div>
	    <div class="offcanvas-body">
	        <div class="container">
	            <div class="text-center m-5">
	                <!-- 사용자 사진-->
	                <c:choose>
						<c:when test="${ empty sessionScope.profile }">
							<img id="profileImage" class="img-fluid rounded-circle mb-1"
					        	src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
					        	alt="..." style="max-width: 150px; max-height: 150px">
						</c:when>
						<c:otherwise>
							<img id="profileImage" src="${pageContext.request.contextPath }/${profile}">
						</c:otherwise>
					</c:choose>
	            	<!-- 시용자 이름-->
	            	<div class="caption text-muted mb-4">
	            		<p class="fw-bold"><strong>${id }</strong></p>
	            	</div>
	                    
	            	<!-- 사용자 프로필 관리하기버튼-->
	            	<button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/users/profile1' ">프로필 관리</button>
				</div>
	        </div>
	            
	        <%-- 사이드바 메뉴 --%>
	 		<ul class="navbar-nav justify-content-end flex-grow-1 pe-3 ml-3 text-center fw-bold">
	 			<!-- 관리자 qna, review 관리 -->
	        	<li class="nav-item">
	        		<a class="nav-link" href="${pageContext.request.contextPath }/admin/adminReview">Review 관리</a>
	        	</li>
	        	<hr class="my-2">
	        	<li class="nav-item">
	        		<a class="nav-link" href="${pageContext.request.contextPath }/admin/adminQna">Q&A 관리</a>
	        	</li>
			</ul>
		</div>
	</div>
</nav>