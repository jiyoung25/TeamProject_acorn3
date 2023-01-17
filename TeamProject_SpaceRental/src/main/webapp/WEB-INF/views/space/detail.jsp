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
            <div class="col-6 m-5 p-4">
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
                        <!--한줄소개 내용-->
                        <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                            ${spaceDto.oneliner }
                        </div>
                        <!--상세소개 내용-->
                        <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                            ${spaceDto.intro }
                        </div>
                        <!--위치 내용 / 지도 api 사용여부는 고민중-->
                        <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
                            ${spaceDto.addr }
                        </div>
                      </div>

                </div>
            </div>




        <!--예약폼-->
        <!-- 찜하기 -->
        <div class="col">
		<form action="${pageContext.request.contextPath}/space/dib_insert" id="dibForm">
			<div>
				<svg v-bind:class="classObject" v-on:click="clickHeartBtn" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-through-heart-fill" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M2.854 15.854A.5.5 0 0 1 2 15.5V14H.5a.5.5 0 0 1-.354-.854l1.5-1.5A.5.5 0 0 1 2 11.5h1.793l3.103-3.104a.5.5 0 1 1 .708.708L4.5 12.207V14a.5.5 0 0 1-.146.354l-1.5 1.5ZM16 3.5a.5.5 0 0 1-.854.354L14 2.707l-1.006 1.006c.236.248.44.531.6.845.562 1.096.585 2.517-.213 4.092-.793 1.563-2.395 3.288-5.105 5.08L8 13.912l-.276-.182A23.825 23.825 0 0 1 5.8 12.323L8.31 9.81a1.5 1.5 0 0 0-2.122-2.122L3.657 10.22a8.827 8.827 0 0 1-1.039-1.57c-.798-1.576-.775-2.997-.213-4.093C3.426 2.565 6.18 1.809 8 3.233c1.25-.98 2.944-.928 4.212-.152L13.292 2 12.147.854A.5.5 0 0 1 12.5 0h3a.5.5 0 0 1 .5.5v3Z"/>
				</svg>
			</div>
			<input type="hidden" name="space_num" value="${spaceDto.space_num }" />
			<input type="hidden" name="users_num" value="${spaceDto.users_num }" />
			<input type="hidden" name="users_id" value="${id }" />
			<button type="submit" id="dibSubmitBtn" >제출</button>
		</form>
		<!-- 예약 폼 -->
		<form id="selectTime" action="${pageContext.request.contextPath}/space/reservation" method="POST">
			<div id="reservationForm">
				<!--최소: 내일부터, 최대: 2달 -->
				<input type="date" name="reserv_date" min="${minday }" max="${maxday }" v-model="day" v-on:input="dayBtnClicked" />
				<br />
				<p>선택하신 날짜의 시간당 요금은 1000원 입니다.</p>
				<div id="timeBox">
					<c:forEach var="i" begin="0" end="24">
						<button type="button" class="timeBtn btn btn-info" value="${i }"
							v-on:click="timeBtnClicked">${i }:00</button>
					</c:forEach>
					<p id="noneVisible">{{count}}{{time1}}{{time2}}</p>
					<br />
					<h3>선택 정보</h3>
					<select name="reserv_count" id="reserv_count" v-on:click="reservCountSelected">
						<option value="0">--</option>
						<option value="1">1명</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
					</select>
					{{reserv_count}}
					<p>입실 시간:{{checkInTime}}</p>
					<p>퇴실 시간:{{checkOutTime}}</p>
					<p>남길 말<input type="text" name="reserv_comment" /></p>
					<p>비용:{{totalMoney}}</p>
					<br />
					<input type="hidden" name="reserv_time" v-bind:value="timeData" />
					<input type="hidden" name="space_num" value="${spaceDto.space_num }" />
					<input type="hidden" name="users_id" value="${id }" />
					<input type="hidden" name="totalMoney" v-bind:value="totalMoney" />
					<button type="button" v-on:click="resetBtnClicked">다시 선택하기</button>
				</div>
				<button type="submit">제출</button>
			</div>
		</form>
    </div>

            

            <!--qna-->
            <div class="margin:0 auto;">
            
                <div class="container " style="background-color: #e5e5e5; ">
                <div class="row">
                        <h3 id="qna"><p class="fs-3 text-center">QnA</p></h3>             
                        <a href="${pageContext.request.contextPath}/qna/qnaInsertform?cate_num=${cate_num }&space_num=${space_num}"  style="text-decoration: none; color:gray"><p class="fs-6 text-right"   >등록하기</p></a>
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
                                           <a href="${pageContext.request.contextPath}/qna/qnadetail?num=${tmp.num }&condition=${condition}&keyword=${encodedK}"  style="text-decoration: none;">${tmp.title }</a>
                                       </td>
                                       <td>${tmp.viewCount }</td>
                                       <td>${tmp.regdate }</td>
                                   </tr>
                               </c:forEach>
                           </tbody>
                        </table>
                        <nav >
                        </div>
                            <ul class="pagination justify-content-center">
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
       
            
     
     



            <!--후기 -->
            <div class="col m-3 p-3 ">
            <div class="container " style="background-color: #e5e5e5; ">
                <div>
                <h3 id="review"><p class="fs-3 text-center">Review</p></h3>
                <a href="${pageContext.request.contextPath}/review/reviewInsertform?cate_num=${cate_num }&space_num=${space_num}" style="text-decoration: none; color:gray"><p class="fs-6 text-right">추가하기</p></a>
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
                            <c:forEach var="tmp" items="${reviewlist }">
                                <tr>
                                    <td>${tmp.review_num }</td>
                                    <td>${tmp.review_writer }</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/review/reviewdetail?review_num=${tmp.review_num }">${tmp.review_title }</a>
                                    </td>
                                    <td>${tmp.viewcount }</td>
                                    <td>${tmp.review_regdate }</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <nav>
                        <ul class="pagination justify-content-center">
                            <!--
                           startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
                            -->
                            <c:if test="${startPageNum ne 1 }">
                               <li class="page-item">
                                  <a class="page-link" href="detail?cate_num=${cate_num }&space_num=${space_num}&pageNum=${startPageNum-1 }">Prev</a>
                               </li>
                            </c:if>
                            <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
                               <li class="page-item ${pageNum eq i ? 'active' : '' }">
                                  <a class="page-link" href="detail?cate_num=${cate_num }&space_num=${space_num}&pageNum=${i }">${i }</a>
                               </li>
                            </c:forEach>
                            <!--
                               마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
                             -->
                            <c:if test="${endPageNum lt totalPageCount }">
                               <li class="page-item">
                                  <a class="page-link" href="detail?cate_num=${cate_num }&space_num=${space_num}&pageNum=${endPageNum+1 }">Next</a>
                               </li>
                            </c:if>
                        </ul>
                    </nav>
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
                    <div class="row">
                    <p>
                        <strong>${totalRow }</strong> 개의 자료가 검색 되었습니다.
                    </p>
                    <p>    
                        <a href="detail" style="text-decoration: none; color: gray;" >리셋</a>
                        <a href="${pageContext.request.contextPath}/space/list?cate_num=${cate_num}"  style="text-decoration: none; color: gray;">목록으로</a>
                    </p>
                    
                    </div>
                </c:if>
                
               </div>
            </div>
        </div>
        </div>

        
        <!-- footer include -->
	 	<jsp:include page="/WEB-INF/include/footer.jsp"/>	

        
         <script>
            let dibForm = new Vue({
                el:"#dibForm",
                data: {
                    isDibed:false
                },
                mounted(){
                    if(${not empty dibson_num.dibson_num }){
                        let dibson_num = ${empty dibson_num.dibson_num? 0 : dibson_num.dibson_num }
                        if(dibson_num){
                            this.isDibed=true;
                            console.log(this.isDibed);
                        }
                    }
                },
                computed:{
                    classObject:function(){
                        return {'clickedHeart':this.isDibed, 'nonClickedHeart':!this.isDibed};
                    }
                },
                methods:{
                    clickHeartBtn:function(){
                        this.isDibed = !this.isDibed;
                        console.log(this.isDibed);
                        if(this.isDibed == true){
                            fetch("${pageContext.request.contextPath}/space/dib_insert?space_num=${spaceDto.space_num}&users_id=${id}&users_num=${spaceDto.users_num}",
                                    {
                                       data: {
                                          space_num: ${spaceDto.space_num},
                                          users_id: "${id}",
                                          users_num: ${spaceDto.users_num}
                                       }
                                    }
                              )
                              .then(function(response){
                                  console.log(response);
                                  return response.text();
                              })
                              .then(function(data){
                                   const goList = confirm("찜에 성공하셨습니다.\n찜 목록으로 가시겠습니까?");
                                   if(goList){
                                       location.href = "${pageContext.request.contextPath}/users/dib_list";
                                   } else{
                                       location.reload();
                                   }
                              })
                        } else if(this.isDibed == false){
                            fetch("${pageContext.request.contextPath}/space/dib_delete?dibson_num=${dibson_num.dibson_num}",
                                    {
                                       data: {
                                          dibson_num: ${empty dibson_num.dibson_num? 0 : dibson_num.dibson_num }
                                       }
                                    }
                            )
                            .then(function(response){
                                console.log(response);
                                return response.text();
                            })
                            .then(function(data){
                                   location.reload();
                            })
                        }
                    }
                }
            })
        </script>
        <script>
                let selectTime = new Vue({
                el:"#selectTime",
                data:{
                    money:1000,
                    count:0,
                    time1:0,
                    time2:0,
                    checkInTime:0,
                    checkOutTime:0,
                    totalMoney:0,
                    day:"",
                    timeData:"",
                    reserv_count:0
                },
                methods:{
                    timeBtnClicked:function(e){
                        this.count++;
                        if(this.count == 1){
                            this.time1 = e.target.value;
                        }
                        if(this.count == 2){
                            this.time2 = e.target.value;
                            if(this.time1==this.time2){
                                this.count==0;
                                alert("시간을 다시 선택해주세요.");
                            } else if(this.time1>this.time2){
                                this.checkInTime = this.time2;
                                this.checkOutTime = this.time1;
                            } else{
                                this.checkInTime = this.time1;
                                this.checkOutTime = this.time2;
                            }
                            this.totalMoney = Math.abs(this.checkOutTime-this.checkInTime)*this.money*this.reserv_count;
                            this.timeData= this.checkInTime + '-' +this.checkOutTime
                        }
                    },
                    resetBtnClicked:function(){
                        this.count=0;
                        this.time1=0;
                        this.time2=0;
                        this.checkInTime=0;
                        this.checkOutTime=0;
                        this.totalMoney=0;
                    },
                    dayBtnClicked:function(){
                        console.log(this.day);
                    },
                    reservCountSelected:function(e){
                        this.reserv_count= e.target.value;
                        this.totalMoney = Math.abs(this.checkOutTime-this.checkInTime)*this.money*this.reserv_count;
                    }
                    
                }
            })
        </script>

            

         
</body>
</html>