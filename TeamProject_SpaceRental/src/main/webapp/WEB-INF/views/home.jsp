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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chatbot.css">
	<script src="${pageContext.request.contextPath}/js/chatbot.js"></script>
</head>

<body>
	<!-- 네비바 include -->
	<c:choose>
		<c:when test="${not empty sessionScope.id }">
			<jsp:include page="/WEB-INF/include/navbar2.jsp"/>
		</c:when>
		<c:otherwise>
			<jsp:include page="/WEB-INF/include/navbar.jsp"/>
		</c:otherwise>
	</c:choose>  

        <!--사이드바-->
          <div class="offcanvas offcanvas-end " tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header ">
              <h5 class="offcanvas-title mx-auto" id="offcanvasNavbarLabel">My Page</h5>
              <button type="button" class="btn-close " data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="container">
                    <div class="text-center m-5">
                        <!-- Profile picture image-->
                        <img class="img-fluid rounded-circle mb-1" src="https://source.unsplash.com/jSUsJWvnnEA/500x500" alt="..." style="max-width: 150px; max-height: 150px">
                        <!-- Profile picture help block-->
                        <div class="caption text-muted mb-4">
                            <p class="fw-bold">에이콘</p>
                        </div>
                        <!-- Profile picture upload button-->
                        <button type="button" class="btn btn-secondary" disabled>프로필 관리</button>
                    </div>
                </div>
             
              	<ul class="navbar-nav justify-content-end flex-grow-1 pe-3 ml-3">
                  <li class="nav-item">
                    <a class="nav-link " href="#">나의 예약</a>
                  </li>
                  <hr class="my-2">

                  <li class="nav-item">
                    <a class="nav-link" href="#">나의 후기</a>
                  </li>

                  <hr class="my-2">

                  <li class="nav-item">
                      <a class="nav-link" href="#">나의 Q&A</a>
                  </li>

                  <hr class="my-2">

                  <li class="nav-item">
                      <a class="nav-link" href="#">프로필 수정</a>
                  </li>
				      </ul>
            </div>
          </div>
        </div>
      </nav>


	<!--carousel-->		
	<div id="carouselExampleCaptions" class="carousel slide bg-light" data-bs-ride="carousel">
		<div class="carousel-indicators">
		<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="https://images.unsplash.com/photo-1573164574511-73c773193279?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80" class="d-block w-100" alt="...">
			<div class="carousel-caption d-none d-md-block">
			<h5>First slide label</h5>
			<p>Some representative placeholder content for the first slide.</p>
			</div>
		</div>
		<div class="carousel-item">
			<img src="https://images.unsplash.com/photo-1537365587684-f490102e1225?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80" class="d-block w-100" alt="...">
			<div class="carousel-caption d-none d-md-block">
			<h5>Second slide label</h5>
			<p>Some representative placeholder content for the second slide.</p>
			</div>
		</div>
		<div class="carousel-item">
			<img src="https://images.unsplash.com/photo-1519671482749-fd09be7ccebf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="d-block w-100" alt="...">
			<div class="carousel-caption d-none d-md-block">
			<h5>Third slide label</h5>
			<p>Some representative placeholder content for the third slide.</p>
			</div>
		</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Next</span>
		</button>
	</div>

	<!--카테고리 영역 시작-->
	<div class="text-center m-5">
		<h2 class="section-heading text-uppercase">Service list</h2>
		<h3 class="section-subheading text-muted">다양한 공간을 만나보세요</h3>
	</div>

	<!--카테고리-->
		<div class="row">
			<!--파티룸-->
			<div class="col-lg-4">
			  <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
			  <h2 class="fw-normal">파티룸</h2>
			  <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/space/list?cate_num=1">보러가기</a></p>
			</div>
			<!--연습실-->
			<div class="col-lg-4">
			  <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
			  <h2 class="fw-normal">연습실</h2>
			  <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/space/list?cate_num=2">보러가기</a></p>
			</div>
			<!--공유주방 -->
			<div class="col-lg-4">
			  <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
			  <h2 class="fw-normal">공유주방</h2>
			  <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/space/list?cate_num=3">보러가기</a></p>
			</div>
		    

			<div class="row">
				<!--스터디룸-->
				<div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
					<h2 class="fw-normal">스터디룸</h2>
					<p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/space/list?cate_num=4">보러가기</a></p>
				</div>
				<!--강의실-->
				<div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
					<h2 class="fw-normal">강의실</h2>
					<p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/space/list?cate_num=5">보러가기</a></p>
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