<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필관리 :Ubiquitous</title>
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<style>
    #profileImage{
		width: 200px;
	    height: 200px;
	    border: 1px solid #cecece;
	    border-radius: 50%;
	}
	
	input.form-control {
		width: 250px;
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
	<!--프로필 사진-->
	<div class="container ">
		<div class="row">
			<div class="col-md-6 text-center">
				<div class="card-title mx-auto p-5">
                    <p class="fs-1 text-center fw-bold" style="color:#000000; ">My profile</p>
                </div>
                <!-- 사용자 프로필사진-->
                <div class=" text-center">				    
					<c:choose>
						<c:when test="${ empty dto.profile }">
							<img id="profileImage" class="img-fluid rounded-circle mb-1"
			                        src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
			                        alt="..." style="max-width: 150px; max-height: 150px">
						</c:when>
						<c:otherwise>
							<img id="profileImage" src="${pageContext.request.contextPath }${ dto.profile}">
						</c:otherwise>
					</c:choose>
                </div>
                <!--사용자 이름-->
                <div class="text-center caption fst-italic text-muted mb-4 p-5">
                    <p>${sessionScope.id }</p>
                </div>                				
                <br>
            </div>
            
			<!--프로필 정보 영역-->
			<div class="col-md-6 mx-auto p-5" style="background-color:;" >	
		        <!--아이디 및 가입일-->
		        <div>
		            <label for="address2" class="form-label">아이디</label>
		            <input class="form-control" type="text" value="${id }" aria-label="readonly input example" readonly>                        
		        </div>    
		        <div>
		            <label for="address2" class="form-label">가입일</label>
		            <input class="form-control" type="text" value="${dto.regdate }" aria-label="readonly input example" readonly>
		        </div>
		        <!--이메일-->
		        <div>
		            <label for="exampleFormControlInput1" class="form-label">Email</label>
		            <input type="email" class="form-control" placeholder="${dto.email }" aria-label="readonly input example" readonly>
		        </div>
		        
            	<hr class="my-5">
	            <!--수정 및 탈퇴하기 버튼-->
	            <div>		                
	                <button type="button" class=" btn btn-outline-success " onclick="location.href='${pageContext.request.contextPath}/users/updateform' ">정보수정</button>
	      
	           		 <!--탈퇴하기 버튼-->
	                <button type="button" class="btn btn-outline-dark " data-bs-toggle="modal" data-bs-target="#staticBackdrop">회원탈퇴</button>
	            </div>
	            <!-- Modal -->
	            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
	                tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	                <div class="modal-dialog">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Message</h1>
	                            <button type="button" class="btn-close" data-bs-dismiss="modal"
	                                aria-label="Close"></button>
	                        </div>
	                        <div class="modal-body">
	
	                            탈퇴하면 되돌릴 수 없습니다.
	                            <br>
	                            정말 탈퇴하시겠습니까 ?
	
	                        </div>
	                        <div class="modal-footer">
	                            <button type="button" class="btn btn-secondary"
	                                data-bs-dismiss="modal">아니오</button>
	                            <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/users/delete' ">예</button>
	                        </div>
	                    </div>
	                </div>
				</div>
            </div>
		</div>
	</div>
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
</body>
</html>
