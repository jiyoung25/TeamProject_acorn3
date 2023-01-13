<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <title>Document</title>
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
        

     
      <!--선택된 카테고리의 공간들-->
     <section>
        <div class="container px-5">
            <div class="row gx-5 align-items-center">
                <div class="col-lg-6">
                    <div class="p-5"><img class="img-fluid rounded-circle" src="https://cdn-icons-png.flaticon.com/512/4599/4599564.png" alt="..."></div>
                </div>
                <div class="col-lg-6">
                    <div class="p-5">
                        <h2 class="display-4">스터디룸</h2>
                        <p>내용</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="cta">
        <div class="cta-content">
            <div class="container px-5">
                <h2 class="text-white display-1 lh-1 mb-4">
                    Stop waiting.
                    <br>
                    Start building.
                </h2>
                <a class="btn btn-outline-light py-3 px-4 rounded-pill" href="https://startbootstrap.com/theme/new-age" target="_blank">Download for free</a>
            </div>
        </div>
    </section>
    
    <div class="row gx-5 mb-5 m-5">
        <div class="col-lg-3 mb-5 ">
            <a class="card lift h-100" href="#!">
                <img class="card-img-top" src="https://source.unsplash.com/2d4lAQAlbDA/800x500" alt="...">
                <div class="card-body">
                    <h4 class="card-title mb-2">스터디카페1</h4>
                    <p class="card-text">강남역 5번출구앞</p>
                </div>
                <div class="card-footer bg-transparent border-top d-flex align-items-center justify-content-between">
                    <div class="small text-primary">See more</div>
                    <div class="small text-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 mb-5">
            <a class="card lift h-100" href="#!">
                <img class="card-img-top" src="https://source.unsplash.com/MP0bgaS_d1c/800x500" alt="...">
                <div class="card-body">
                    <h4 class="card-title mb-2">스터디카페2</h4>
                    <p class="card-text">강남역 5번출구앞</p>
                </div>
                <div class="card-footer bg-transparent border-top d-flex align-items-center justify-content-between">
                    <div class="small text-primary">See more</div>
                    <div class="small text-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 mb-5">
            <a class="card lift h-100" href="#!">
                <img class="card-img-top" src="https://source.unsplash.com/iAftdIcgpFc/800x500" alt="...">
                <div class="card-body">
                    <h4 class="card-title mb-2">스터디카페3</h4>
                    <p class="card-text">강남역 5번출구앞</p>
                </div>
                <div class="card-footer bg-transparent border-top d-flex align-items-center justify-content-between">
                    <div class="small text-primary">See more</div>
                    <div class="small text-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></div>
                </div>
            </a>
        </div>  
        <div class="col-md-3 mb-4">
            <a class="card lift h-100" href="#!">
                <img class="card-img-top" src="https://source.unsplash.com/iAftdIcgpFc/800x500" alt="...">
                <div class="card-body">
                    <h4 class="card-title mb-2">스터디카페4</h4>
                    <p class="card-text">서초역 1번출구앞</p>
                </div>
                <div class="card-footer bg-transparent border-top d-flex align-items-center justify-content-between">
                    <div class="small text-primary">See more</div>
                    <div class="small text-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></div>
                </div>
            </a>
        </div>
        <div class="col-md-3 mb-4">
            <a class="card lift h-100" href="#!">
                <img class="card-img-top" src="https://source.unsplash.com/iAftdIcgpFc/800x500" alt="...">
                <div class="card-body">
                    <h4 class="card-title mb-2">스터디카페5</h4>
                    <p class="card-text">방배역 7번출구앞</p>
                </div>
                <div class="card-footer bg-transparent border-top d-flex align-items-center justify-content-between">
                    <div class="small text-primary">See more</div>
                    <div class="small text-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></div>
                </div>
            </a>
        </div>         
        <div class="col-md-3 mb-4">
            <a class="card lift h-100" href="#!">
                <img class="card-img-top" src="https://source.unsplash.com/iAftdIcgpFc/800x500" alt="...">
                <div class="card-body">
                    <h4 class="card-title mb-2">스터디카페6</h4>
                    <p class="card-text">낙성대역 8번출구앞</p>
                </div>
                <div class="card-footer bg-transparent border-top d-flex align-items-center justify-content-between">
                    <div class="small text-primary">See more</div>
                    <div class="small text-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></div>
                </div>
            </a>
        </div>
        <div class="col-md-3 mb-4">
            <a class="card lift h-100" href="#!">
                <img class="card-img-top" src="https://source.unsplash.com/iAftdIcgpFc/800x500" alt="...">
                <div class="card-body">
                    <h4 class="card-title mb-2">스터디카페7</h4>
                    <p class="card-text">강남역 8번출구앞</p>
                </div>
                <div class="card-footer bg-transparent border-top d-flex align-items-center justify-content-between">
                    <div class="small text-primary">See more</div>
                    <div class="small text-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></div>
                </div>
            </a>
        </div> 
        <div class="col-md-3 mb-4">
            <a class="card lift h-100" href="#!">
                <img class="card-img-top" src="https://source.unsplash.com/iAftdIcgpFc/800x500" alt="...">
                <div class="card-body">
                    <h4 class="card-title mb-2">스터디카페8</h4>
                    <p class="card-text">사당역 4번출구앞</p>
                </div>
                <div class="card-footer bg-transparent border-top d-flex align-items-center justify-content-between">
                    <div class="small text-primary">See more</div>
                    <div class="small text-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></div>
                </div>
            </a>
        </div>            

        
        <!--페이지네이션-->
        <div class="container">
            <ul class="pagination justify-content-center my-4">
                <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Newer</a></li>
                <li class="page-item active" aria-current="page"><a class="page-link" href="#!">1</a></li>
                <li class="page-item"><a class="page-link" href="#!">2</a></li>
                <li class="page-item"><a class="page-link" href="#!">3</a></li>
                <li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
                <li class="page-item"><a class="page-link" href="#!">15</a></li>
                <li class="page-item"><a class="page-link" href="#!">Older</a></li>
            </ul>
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
                
    
</body>
</html>
