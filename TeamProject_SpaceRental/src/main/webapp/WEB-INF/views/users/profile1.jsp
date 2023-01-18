<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Space Rental</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="icon" type="image/x-icon" href="assets/ficon.ico" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
  	<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.min.js"></script>
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
	      		<c:when test="${dto.code eq 2 }">
	      	  		<jsp:include page="/WEB-INF/include/navbar_sessionO_seller.jsp"/>
	         		<jsp:include page="/WEB-INF/include/sidebar_seller.jsp"/>
	      		</c:when>
	      		<c:otherwise>
					<jsp:include page="/WEB-INF/include/navbar_sessionO_users.jsp"/>
			      	<jsp:include page="/WEB-INF/include/sidebar_user.jsp"/>
	      		</c:otherwise>
	      	</c:choose>
      	</c:otherwise>
   	</c:choose> 
   
   
    <!--프로필 사진 수정영역-->
    <div class="wrapper">
        <div class="row p-5" style="width : 80% ; margin: 0 auto;">
            <div class="col-3 p-5 m-5 " style=" background-color: #c1b5dd">
                <div class="card-title mx-auto p-5">
                    <p class="fs-1 text-center fw-bold" style="color:#ffffff; ">My profile</p>
                </div>
                <!-- 사용자 프로필사진-->
                <div class=" text-center">
                    <img id="profileImage" class="img-fluid rounded-circle mb-1"
                        src="https://source.unsplash.com/jSUsJWvnnEA/500x500"
                        alt="..." style="max-width: 150px; max-height: 150px">
                </div>
                <!--사용자 이름-->
                <div class="text-center caption fst-italic text-muted mb-4 p-5">
                    <p>${sessionScope.id }</p>
                </div>
                <!-- 프로필사진 수정 버튼-->
                <div class="text-center">
                    <input type="file" id="file" onchange="uploadFile(this)" style="display:none" />
                    <button type="button" onclick="onclick=document.all.file.click()" class="btn"
                        style="color:white; background-color: blueviolet;">upload new picture</button>
                </div>				
                <br>
            </div>
        
    

        <!--프로필 정보 영역-->
        
        <div class="wrapper col p-5 m-5" style="background-color: rgb(255, 255, 255);">
                <div class="row g-3">
                    
                    <!--아이디 및 가입일 (수정불가항목)-->
                    <div class="row">
                    <div class="col m-2">
                        <label for="address2" class="form-label">아이디</span></label>
                        <input class="form-control" type="text" value="${id }" aria-label="readonly input example" readonly>
                        <p class="fst-italic" style="font-size: small; ">아이디 및 가입일은 변경할 수 없습니다</p>
                    </div>    
                    <div class="col m-2">
                            <label for="address2" class="form-label">가입일</span></label>
                            <input class="form-control" type="text" value="${dto.regdate }" aria-label="readonly input example"
                                readonly>
                        </div>
                    </div>
                

                    <!--이메일(수정가능항목)-->
                    <div class="mb-3 m-2">
                        <label for="exampleFormControlInput1" class="form-label">Email</label>
                        <input type="email" class="form-control" id="exampleFormControlInput1"
                            placeholder="${dto.email }">
                    </div>

                    
                    

                    <!--비밀번호-->
                    <div class="col-12 m-2">
                        <div class="row">
                            <label for="address2" class="form-label">password</span></label>
                            <div class="col">
                                <input class="form-control" type="text" value="보안상 표시하지 않습니다"
                                    aria-label="readonly input example" readonly>
                            </div>
                            
                            <div class="col">
                             <!-- 비밀번호 변경 모달 -->
                             <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                변경
                            </button>
                            
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                
                                    <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/users/pwd_updateform' ">continue</button>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                        </div>    
                        
                        <hr class="my-5">
                        
                        <!--수정 및 탈퇴하기 버튼 ( 수정되었습니다 알림창 뜨게함 )-->
                        <div class="row" >
                            <div id="liveAlertPlaceholder"></div>
                            <button type="button" class=" btn btn-outline-success " id="liveAlertBtn">정보수정</button>
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
                                            data-bs-dismiss="modal">no</button>
                                        <button type="button" class="btn btn-primary">Continue</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                        </div>

                       
                       </div> 
                    </div>
                    
      <!-- footer include -->
	  <jsp:include page="/WEB-INF/include/footer.jsp"/>
                   
        <script>

            <!--수정반영알림창-->
            const alertPlaceholder = document.getElementById('liveAlertPlaceholder')

            const alert = (message, type) => {
            const wrapper = document.createElement('div')
            wrapper.innerHTML = [
                `<div class="alert alert-${type} alert-dismissible" role="alert">`,
                `   <div>${message}</div>`,
                '   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>',
                '</div>'
            ].join('')

            alertPlaceholder.append(wrapper)
            }

            const alertTrigger = document.getElementById('liveAlertBtn')
            if (alertTrigger) {
            alertTrigger.addEventListener('click', () => {
                alert('성공적으로 반영되었습니다', 'success')
            })
            }

        </script>
        <script type="text/javascript">
            $('#btn-add').click(function (e) {
                e.preventDefault();
                $('#file').click();
            });

            function uploadFile(e) {
                console.log("File Name : ", e.value);
            }

        </script>
<<<<<<< HEAD
</body>       	
=======
    
>>>>>>> refs/remotes/origin/daheen
</html>
