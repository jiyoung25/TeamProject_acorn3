<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
</head>
<style>


</style>

<body >


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

     <!--공간사진 및 예약폼-->

     <!--네비바와 상단메뉴 겹치는부분 수정예정-->
     <div>
     <div class="container"  >
        <div class="row">
            <!--공간사진-->
            <div class="col col m-5 p-4">
                <div class="row ">
                <img src="https://as2.ftcdn.net/v2/jpg/02/40/32/91/1000_F_240329133_inyyLY16TuwXtP0AVrbTvK0XGzEjxanV.jpg" alt="...">
                </div>

                <!--공간 메뉴탭-->
                <div class="row m-2 p-2" >
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <!--공간소개 탭-->
                        <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">공간소개</button>
                        </li>
                        <!--편의시설 탭-->
                        <li class="nav-item" role="presentation">
                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">편의시설</button>
                        </li>
                        <!--위치탭-->
                        <li class="nav-item" role="presentation">
                        <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">위치</button>
                        </li>
                    </ul>
                      
                    <!--공간메뉴탭 내용-->
                      <div class="tab-content" id="myTabContent">
                        <!--공간소개 내용-->
                        <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                            판매자가 등록한 공간소개글
                        </div>
                        <!--편의시설 내용-->
                        <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                            판매자가 등록한 편의시설 정보 (주차가능, 반려동물입실가능, 대형모니터, cctv, wifi 등)
                        </div>
                        <!--위치 내용 / 지도 api 사용여부는 고민중-->
                        <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
                            판매자가 등록한 공간 주소
                        </div>
                      </div>

                </div>
            </div>




            <!--예약폼-->
            <div class="col">
                <div class="col m-5 p-4">

                    <!--공간이름-->
                    <p class=" m-3 fs-1 text-center">공간이름</p>

                    

                    <hr class="my-4">


                        <!--예약자-->
                        <div class="row mb-2">
                            <div class="col-4  text-center">
                            <label for="inputName" class="col-form-label ">예약자</label>
                            </div>
                            <div class="col-8 ">
                              <input type="Name" class="form-control" id="inputName">
                            </div>
                          </div>
            
                        
                        
                        <!--인원선택-->
                        <div class="row mb-2">
                            <div class="col-4 text-center">인원</div>
                            <div class="col-8">
                                <select class="form-select" aria-label="Default select example">
                                    <option selected>인원선택</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </div>
                        </div>

                        <!--요금안내-->
                        <div class="row">
                            <div class="col-4 text-center">
                            <label for="staticEmail" class="col-form-label">2시간당</label>
                            </div>
                            <div class="col-8">
                                <input class="form-control" type="text" value="요금" aria-label="Disabled input example" disabled readonly>
                            </div>
                        </div>


                        <hr class="my-4">

                        <!--요청사항-->
                        <div class="m-3">
                            <label for="exampleFormControlTextarea1" class="form-label">요청사항</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="ex)현장결제할게요"></textarea>
                          </div>

                    
                        <hr class="my-4">
            
                        <!--예약안내사항-->
                        <div class="m-3">
                            <p class="fw-bold ">  2시간 단위로 예약가능합니다</p>
                            <p class="fw-bold ">  최대 예약정원은 10명입니다</p>
                            <p class="fw-bold ">  예약변경 및 취소는 판매자에게 문의 바랍니다</p>
                        </div>
                        <br>
                        <!--동의 체크박스-->
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="same-address">
                            <label class="form-check-label" for="same-address">공지사항 및 약관에 동의합니다.</label>
                        </div>
                        <br>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="save-info">
                            <label class="form-check-label" for="save-info">예약정보를 모두 확인했습니다.</label>
                        </div>
                
                        <hr class="my-4">
                
                        <button class="w-100 btn btn-primary btn-lg" type="submit">예약</button>
                        </form>

                        

                  </div>
    
            </div>
            </div>
            </div>
            

            <!--qna-->
            <div class="container p-3" style="background-color: #e5e5e5;">
            <div class="row">
            <div class="col-5 text-left" >
                <h3 id="qna"><p>QnA</p></h3>
            </div>
            <div class="col-7 text-center">               
                <a href="${pageContext.request.contextPath}/qna/qnaInsertform?cate_num=${cate_num }&space_num=${space_num}"><p class="fs-6 text-right">등록하기</p></a>
            </div>
            </div>
			<div class="container">
		      <table class="table table-striped">
		         <thead class="table-dark">
		            <tr>
		               <th>글번호</th>
		               <th>작성자</th>
		               <th>제목</th>
		               <th>조회수</th>
		               <th>작성일</th>
		            </tr>
		         </thead>
		         <tbody>
			         <c:forEach var="tmp" items="${list }">
			         	<tr>
			         		<td>${tmp.num }</td>
			         		<td>${tmp.writer }</td>
			         		<td>
			         			<a href="${pageContext.request.contextPath}/qna/qnadetail?num=${tmp.num }&condition=${condition}&keyword=${encodedK}">${tmp.title }</a>
			         		</td>
			         		<td>${tmp.viewCount }</td>
			         		<td>${tmp.regdate }</td>
			         	</tr>
			         </c:forEach>
		         </tbody>
		      </table>
		      <nav >
		         <ul class="pagination">
		            <!--
		               startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
		               &condition=${condition}&keyword=${encodedK}
		            -->
		            <c:if test="${startPageNum ne 1 }">
		               <li class="page-item">
		                  <a class="page-link" href="detail?cate_num=${cate_num }&space_num=${space_num}&pageNum=${startPageNum-1 }&condition=${condition}&keyword=${encodedK}">Prev</a>
		               </li>
		            </c:if>
		            <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		               <li class="page-item ${pageNum eq i ? 'active' : '' }">
		                  <a class="page-link" href="detail?cate_num=${cate_num }&space_num=${space_num}&pageNum=${i }&condition=${condition}&keyword=${encodedK}">${i }</a>
		               </li>
		            </c:forEach>
		            <!--
		               마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
		             -->
		            <c:if test="${endPageNum lt totalPageCount }">
		               <li class="page-item">
		                  <a class="page-link" href="detail?cate_num=${cate_num }&space_num=${space_num}&pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedK}">Next</a>
		               </li>
		            </c:if>
		         </ul>
		      </nav>
            </div>
        </div>
            
     
     



            <!--후기 -->
            <div class="col m-3 p-3 mb-3">
            <div class="container " style="background-color: #e5e5e5; ">

                <p class="fw-bold text-center ">이용 후기</p>

                
                <div class="d-flex m-2 p-3 " style="background-color: aliceblue;">
                    <!--고객 프로필 이미지-->
                    <div class="avatar avatar-lg">
                        <img class="img-fluid rounded-circle mb-1" src="assets/img/illustrations/profiles/profile-1.png" style="width: 50px;">
                    </div>
                    <!--댓글란-->
                    <div class="ms-3 ">
                        <a class="text-dark" href="#!"><h6 class="mb-1">댓글내용1</h6></a>
                        <!--사용자-->
                        <div class="small text-gray-500">
                            <p>${id }</p>
                        </div>
                    </div>
                </div>

                <div class="d-flex m-2 p-3" style="background-color: aliceblue;">
                    <!--고객 프로필 이미지-->
                    <div class="avatar avatar-lg">
                        <img class="img-fluid rounded-circle mb-1" src="assets/img/illustrations/profiles/profile-2.png" style="width: 50px;">
                    </div>
                    <!--댓글란-->
                    <div class="ms-3">
                        <a class="text-dark" href="#!"><h6 class="mb-1">댓글내용2</h6></a>
                        <!--사용자-->
                        <div class="small text-gray-500">
                            <p>${id }</p>
                        </div>
                    </div>
                </div>

                <div class="d-flex m-2 p-3" style="background-color: aliceblue;">
                    <!--고객 프로필 이미지-->
                    <div class="avatar avatar-lg"> 
                        <img class="img-fluid rounded-circle mb-1" src="assets/img/illustrations/profiles/profile-3.png" style="width: 50px;">
                    </div>
                    <!--댓글란-->
                    <div class="ms-3">
                        <a class="text-dark" href="#!"><h6 class="mb-1">댓글내용3</h6></a>
                        <!--사용자-->
                        <div class="small text-gray-500">
                            <p>${id }</p>
                        </div>
                        </div>
                </div>
               </div>
             


                <!-- 검색 폼 -->
                <div class="col m-3 p-3 text-right">
                <div class="container">
                <form action="detail?cate_num=${cate_num }&space_num=${space_num}" method="get">
                    <label for="condition">검색조건</label>
                    <select name="condition" id="condition">
                        <option value="title_filename" ${condition eq 'title_content' ? 'selected' : '' }>제목 + 내용</option>
                        <option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
                        <option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
                    </select>
                    <input type="text" name="keyword" placeholder="검색어..." 
                        value="${keyword }" />
                    <button type="submit">검색</button>
                </form>
                <c:if test="${not empty condition }">
                    <p>
                        <strong>${totalRow }</strong> 개의 자료가 검색 되었습니다.
                        <a href="detail">리셋</a>
                    </p>
                    <p>
                    <a href="${pageContext.request.contextPath}/space/list?cate_num=${cate_num}" >목록으로</a>
                    </p>
                </c:if>
                
               </div>
            </div>
        </div>
<<<<<<< HEAD
        
        <!-- footer include -->
	 	<jsp:include page="/WEB-INF/include/footer.jsp"/>	
=======
>>>>>>> refs/remotes/origin/daheen
               
            

         
</body>
</html>