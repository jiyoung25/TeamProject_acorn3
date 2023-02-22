<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Space Rental</title>
<style>   	
    body {
        background-color: #b461c5;
    }
    .wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 70vh;
    }
    #profileImage{
		width: 200px;
	    height: 200px;
	    border: 1px solid #cecece;
	    border-radius: 50%;
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
    <div class="wrapper">
        <div class="row p-5" style="width : 80% ; margin: 0 auto;">
            <div class="col-3 p-5 m-5 ">
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
        <div class="wrapper col p-5 m-5" style="background-color: rgb(255, 255, 255);">
			<div class="row g-3">
		        <!--아이디 및 가입일-->
		        <div class="row">
		        <div class="col m-2">
		            <label for="address2" class="form-label">아이디</label>
		            <input class="form-control" type="text" value="${id }" aria-label="readonly input example" readonly>                        
		        </div>    
		        <div class="col m-2">
		            <label for="address2" class="form-label">가입일</label>
		            <input class="form-control" type="text" value="${dto.regdate }" aria-label="readonly input example" readonly>
		            </div>
		        </div>
		        <!--이메일-->
		        <div class="mb-3 m-2">
		            <label for="exampleFormControlInput1" class="form-label">Email</label>
		            <input type="email" class="form-control" placeholder="${dto.email }" aria-label="readonly input example" readonly>
		        </div>
		        <!--비밀번호-->
		        <div class="col-12 m-2">
		            <div class="row">
		                <label for="address2" class="form-label">password</label>
		                <div class="col">
		                    <input class="form-control" type="text" value="보안상 표시하지 않습니다"
		                        aria-label="readonly input example" readonly>
		                </div>		                
		                <div class="col">
			                <!-- 비밀번호 변경 모달 -->
			                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#pwdModal">
			                    변경
			                </button>		                
			                <!-- Modal -->
			                <div class="modal fade" id="pwdModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			                    <div class="modal-dialog">
				                    <div class="modal-content">
				                        <div class="modal-header">
					                        <h1 class="modal-title fs-5" id="exampleModalLabel">Message</h1>
					                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				                        </div>
				                        <div class="modal-body">
				                        	비밀번호를 변경하시겠습니까 ?
				                        </div>
				                        <div class="modal-footer">
					                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					                        <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/users/pwd_updateform' ">확인</button>
				                        </div>
				                    </div>
			                    </div>
			                </div>
		            	</div>
		            </div>
		            <hr class="my-5">
		            <!--수정 및 탈퇴하기 버튼-->
		            <div class="row" >		                
		                <button type="button" class=" btn btn-outline-success " onclick="location.href='${pageContext.request.contextPath}/users/updateform' ">정보수정</button>
		            </div>
		            <div class="row">
		            <!--탈퇴하기 버튼-->
		                <button type="button" class="btn btn-outline-dark my-2 " data-bs-toggle="modal"
		                data-bs-target="#staticBackdrop">
		                회원탈퇴
		                </button>
		            </div>
		        </div>
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
