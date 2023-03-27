<%@page import="com.team.project.dib.dto.DibDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<%-- vue.js, axios --%>
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<%-- import from static --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/star.css" />
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
<style>
	body {
        background-color:
    }
	
	#noneVisible{
		display:none;
	}
	
	.tmp{
		height:50px;
		background-color:#F7F8E0;
	}
	#dibSubmitBtn{
		display : none;
	}
	.nonClickedHeart{
		width: 30px;
		height: 30px;
		color: gray;
	}
	.clickedHeart{
		width: 30px;
		height: 30px;
		color: red;
	}
	
	div.info{
		text-align: left;
	}	
	
	a {
		text-decoration: none;
	}
	
	a:hover {
		font-weight: bold;
		text-decoration: none;
 	}	
 	
 
	.img-fluid {
		width: 500px;
		height: 500px;
	}
	
	.grid-container {
		display: grid;
		width: 325px;
		grid-template-columns: 1fr 1fr 1fr 1fr;
		gap: 5px;
		margin:auto;
		margin-bottom: 10px;
	}
	.timeBtn{
		background-color:#ffdab9;
	}
	.timeBtn:focus {
		 background-color: #be7a7b; !important
	}
	.timeBtn:active {
		 background-color: #be7a7b; !important
	}
	.timeBtn:hover{
		background-color:#db9662;
	}
	.activeBtn{
		background-color: #be7a7b; !important
	}
</style>
<title>공간 상세 페이지</title>
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
   	
	<!-- 찜하기 -->
	<div class="container text-center">
		<form action="${pageContext.request.contextPath}/space/dib_insert" id="dibForm">
			<h3>찜하기</h3>
			<svg v-bind:class="classObject" v-on:click="clickHeartBtn" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-through-heart-fill" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M2.854 15.854A.5.5 0 0 1 2 15.5V14H.5a.5.5 0 0 1-.354-.854l1.5-1.5A.5.5 0 0 1 2 11.5h1.793l3.103-3.104a.5.5 0 1 1 .708.708L4.5 12.207V14a.5.5 0 0 1-.146.354l-1.5 1.5ZM16 3.5a.5.5 0 0 1-.854.354L14 2.707l-1.006 1.006c.236.248.44.531.6.845.562 1.096.585 2.517-.213 4.092-.793 1.563-2.395 3.288-5.105 5.08L8 13.912l-.276-.182A23.825 23.825 0 0 1 5.8 12.323L8.31 9.81a1.5 1.5 0 0 0-2.122-2.122L3.657 10.22a8.827 8.827 0 0 1-1.039-1.57c-.798-1.576-.775-2.997-.213-4.093C3.426 2.565 6.18 1.809 8 3.233c1.25-.98 2.944-.928 4.212-.152L13.292 2 12.147.854A.5.5 0 0 1 12.5 0h3a.5.5 0 0 1 .5.5v3Z"/>
			</svg>
	
			<input type="hidden" name="space_num" value="${spaceDto.space_num }" />
			<input type="hidden" name="users_num" value="${spaceDto.users_num }" />
			<input type="hidden" name="users_id" value="${id }" />
			<button type="submit" id="dibSubmitBtn" >제출</button>
		</form>
	</div>
	
	<!-- 예약 폼 -->
	<form id="selectTime" action="${pageContext.request.contextPath}/space/reservation" method="POST" v-on:submit="submitBtnClicked">
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<img src="${pageContext.request.contextPath}/${spaceDto.mainImagePath }" class="img-fluid"/>
					
					<br/>
					<br/>
					<br/>
					<%-- 공간 소개 --%>	
					<div class="info">
						<h1>${spaceDto.space_name }</h1>
					</div>
					<br/>
					<br/>
					
					<div class="info">
						<h3 id="oneliner">한 줄 소개</h3>
						<p>${spaceDto.oneliner }</p>
					</div>
					
					<div class="info">
						<h3 id="intro">상세 소개</h3>
						<p>${spaceDto.intro }</p>
					</div>
					
					<div class="info">
						<h3 id="addr">주소</h3>
						<p>${spaceDto.addr } ${spaceDto.addr2 }</p>						
					</div>
					
					<%-- 지도 --%>
					<div id="map" style="width:100%;height:350px;"></div>
				</div>
					
				<div class="col-lg-6 col-md-6">
					<div>
						<h3> Reservation Form </h3>
						<%--최소: 내일부터, 최대: 2달 --%>
						<label for="reserv_date">날짜 선택</label>
						<input type="date" id="reserv_date" name="reserv_date" min="${minday }" max="${maxday }" v-model="day" v-on:input="dayBtnClicked"/>
						<br />
						<p>선택하신 날짜의 시간당 요금은 1000원 입니다.</p>
						<div class="grid-container">
							<c:forEach var="i" begin="7" end="10">
								<button type="button" class="timeBtn btn" value="${i }" id="timeBtn${i }"
									v-on:click="timeBtnClicked">${i }:00</button>
							</c:forEach>
						</div>
						<div class="grid-container">
							<c:forEach var="i" begin="11" end="14">
								<button type="button" class="timeBtn btn btnAtive" value="${i }" id="timeBtn${i }"
									v-on:click="timeBtnClicked">${i }:00</button>
							</c:forEach>
						</div>
						<div class="grid-container">
							<c:forEach var="i" begin="15" end="18">
								<button type="button" class="timeBtn btn" value="${i }" id="timeBtn${i }"
									v-on:click="timeBtnClicked">${i }:00</button>
							</c:forEach>
						</div>
						<div class="grid-container">
							<c:forEach var="i" begin="19" end="22">
								<button type="button" class="timeBtn btn" value="${i }" id="timeBtn${i }"
									v-on:click="timeBtnClicked">${i }:00</button>
							</c:forEach>
						</div>
					</div>
					
					<p id="noneVisible">{{count}}{{time1}}{{time2}}</p>
					<br />
					<h3>선택 정보</h3>
					<label for="reserv_count">인원 선택</label>
					<select name="reserv_count" id="reserv_count" v-bind:value="reserv_count_value" v-on:click="reservCountSelected">
						<option value="0">--</option>
						<option value="1">1명</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
					</select>
					<p>입실 시간:{{checkInTime}}</p>
					<p>퇴실 시간:{{checkOutTime}}</p>
					<label for="reserv_comment">남길 말</label>
					<input type="text" name="reserv_comment" id="reserv_comment" />
					<p>비용:{{totalMoney}}</p>
					<br />
					<input type="hidden" name="reserv_time" v-bind:value="timeData" />
					<input type="hidden" name="space_num" value="${spaceDto.space_num }" />
					<input type="hidden" name="users_id" value="${id }" />
					<input type="hidden" name="totalMoney" v-bind:value="totalMoney" />
					<button type="button" class="btn btn-outline-secondary" v-on:click="resetBtnClicked">다시 선택하기</button>
					<button type="submit" class="btn btn-outline-secondary">예약하기</button>
				</div>
			</div>
		</div>
	</form>
	
	<%-- 리뷰 --%>
	<div class="container">
		<h3 id="review">Review</h3>
		<%-- 사용자가 사용한 방 -> 리뷰 쓰기 가능 --%>
		<form action="${pageContext.request.contextPath}/review/reviewInsertform" method="POST">
			<select name="possibleReview" id="possibleReview">
				<c:choose>
					<c:when test="${empty sessionScope.id }">
						<option value="">로그인 해주세요.</option>				
					</c:when>
					<c:when test="${empty possibleReview }">
						<option value="">방을 이용해주세요.</option>
					</c:when>
					<c:when test="${not empty possibleReview }">
						<c:forEach items="${possibleReview }" var="item">
							<option value="${item.reserv_num }&&${item.space_num}&&${item.cate_num}"><strong>${item.space_name } 방 리뷰쓰기</strong></option>
						</c:forEach>
					</c:when>
				</c:choose>
			</select>
			<button class="btn btn-outline-secondary">리뷰 쓰기</button>
		</form>
		<div class="container">
			<table class="table align-middle mb-0 bg-white">
				<thead class="bg-light">
					<tr>
						<th>작성자</th>
						<th>제목</th>
						<th>내용</th>
						<th>별점</th>
						<th>작성일</th>
						<c:if test="${ usersCode eq 1}">
							<th>삭제</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${reviewlist }">
						<tr>
							<td>${tmp.review_writer }</td>
							<td>${tmp.review_title }</td>
							<td>${tmp.review_content }</td>
							<td>
								<%-- 별점 --%>
								<span class="star">
									★★★★★
									<span style="width: ${tmp.star *10 }%;">★★★★★</span>
								</span>
							</td>
							<td>${tmp.review_regdate }</td>
							<c:if test="${ usersCode eq 1}">
								<td>
									<a href="${pageContext.request.contextPath}/space/reviewDelete?review_num=${tmp.review_num}&cate_num=${cate_num }&space_num=${space_num}" onClick="deleteLink(); return false;">삭제</a>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<%-- 리뷰 페이지네이션 --%>
			<nav>
				<ul class="pagination">
					<%--
						startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
					--%>
					<c:if test="${startPageNum ne 1 }">
						<li class="page-item">
							<a class="page-link" href="detail?cate_num=${param.cate_num }&space_num=${param.space_num}&pageNum=${startPageNum-1 }">Prev</a>
						</li>
					</c:if>
			        <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
						<li class="page-item ${pageNum eq i ? 'active' : '' }">
							<a class="page-link" href="detail?cate_num=${param.cate_num }&space_num=${param.space_num}&pageNum=${i }">${i }</a>
						</li>
			        </c:forEach>
			        <%--
			           	마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
					--%>
					<c:if test="${endPageNum lt totalPageCount }">
						<li class="page-item">
							<a class="page-link" href="detail?cate_num=${param.cate_num }&space_num=${param.space_num}&pageNum=${endPageNum+1 }">Next</a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>	
	
	<%-- QnA --%>
	<div class="container">
		<h3 id="qna">Q&A <a href="${pageContext.request.contextPath}/qna/qnaInsertform?cate_num=${param.cate_num }&space_num=${param.space_num}">추가하기</a></h3>
			<table class="table align-middle mb-0 bg-white">
				<thead class="bg-light">
					<tr>
						<th>작성자</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성일</th>
						<c:if test="${ usersCode eq 1}">
							<th>삭제</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${list }">
						<tr>
							<td>${tmp.writer }</td>
							<td>${tmp.title }</td>
							<td>${tmp.content }</td>
							<td>${tmp.regdate }</td>
							<c:if test="${ usersCode eq 1}">
								<td>
									<a href="qnaDelete?num=${tmp.num}&cate_num=${cate_num }&space_num=${space_num}" onClick="deleteLink(); return false;">삭제</a>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				
			<%-- QnA 페이지네이션 --%>
			<nav>
				<ul class="pagination">
					<%--
			        	qnaStartPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
			        	&condition=${condition}&keyword=${encodedK}
			        --%>
			        <c:if test="${qnaStartPageNum ne 1 }">
						<li class="page-item">
							<a class="page-link" href="detail?cate_num=${param.cate_num }&space_num=${param.space_num}&qnaPageNum=${qnaStartPageNum-1 }&condition=${condition}&keyword=${encodedK}">이전글</a>
						</li>
			        </c:if>
			        <c:forEach var="i" begin="${qnaStartPageNum }" end="${qnaEndPageNum }">
						<li class="page-item ${qnaPageNum eq i ? 'active' : '' }">
							<a class="page-link" href="detail?cate_num=${param.cate_num }&space_num=${param.space_num}&qnaPageNum=${i }&condition=${condition}&keyword=${encodedK}">${i }</a>
						</li>
			        </c:forEach>
			        <%--
			        	마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
			        --%>
			        <c:if test="${qnaEndPageNum lt qnatotalPageCount }">
						<li class="page-item">
							<a class="page-link" href="detail?cate_num=${param.cate_num }&space_num=${param.space_num}&qnaPageNum=${qnaEndPageNum+1 }&condition=${condition}&keyword=${encodedK}">다음글</a>
						</li>
			        </c:if>
				</ul>
			</nav>
			      
			<!-- 검색 폼 -->
			<form action="detail" method="get">
				<label for="condition">검색조건</label>
					<select name="condition" id="condition">
						<option value="title_content" ${condition eq 'title_content' ? 'selected' : '' }>제목 + 내용</option>
						<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
						<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
					</select>
				<input type="text" name="keyword" placeholder="검색어..." value="${keyword }" />
		    	<input type="hidden" name="cate_num" value=${param.cate_num }>
		    	<input type="hidden" name="space_num" value=${param.space_num }>
		    	<button type="submit" class="btn btn-outline-secondary" >검색</button>
			</form>
		</div>
		<c:if test="${not empty condition }">
			<p>
				<strong>${qnatotalRow }</strong> 개의 자료가 검색 되었습니다.
				<a href="${pageContext.request.contextPath}/space/detail?cate_num=${param.cate_num}&space_num=${param.space_num}">리셋</a>
			</p>
		</c:if>
			
	
	<a href="${pageContext.request.contextPath}/space/list?cate_num=${param.cate_num}" >목록으로</a>
	
	<%-- js --%>
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
					if("${id}"==""){
						alert("로그인 해주세요.");
						return;
					}
					this.isDibed = !this.isDibed;
					console.log(this.isDibed);
					if(this.isDibed == true){
						fetch("${pageContext.request.contextPath}/space/dib_insert?space_num=${spaceDto.space_num}&users_num=${spaceDto.users_num}",
		                        {
		                           data: {
		                              space_num: ${spaceDto.space_num},
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
				reserv_count:0,
				reserv_count_value:0,
				timeList:{}
			},
			methods:{
				timeBtnClicked: async function(e){
					this.count++;
					if(this.count == 1){
						this.time1 = e.target.value;
						this.time1 *= 1
					}
					if(this.count == 2){
						this.time2 = e.target.value;
						this.time2 *= 1
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
						console.log((this.checkInTime)*1);
						console.log(typeof ((this.checkInTime)*1));
						console.log((this.checkOutTime)*1);
						for(let i=((this.checkInTime)*1); i<=((this.checkOutTime)*1); i++){
							let timeBtn = "#timeBtn" + i; 
							document.querySelector(timeBtn).classList.add("activeBtn");
						}
						
						console.log(this.timeList);
						
						//this.timeList의 길이
						let timeListLength = this.timeList.length;
						
						if(timeListLength != 0){
							for(let i=0; i<timeListLength; i++){
								//이미 예약되어있는 시간의 시작과 끝을 Array type의 변수로 저장하기
								let alreadyReserved = this.timeList[i].reserv_time.split('-');
								//이미 예약되어있는 시간을 포함한 예약은 예약 요청을 수락하지 못하도록 하기
								if(this.checkInTime<=alreadyReserved[0] && alreadyReserved[1]<=this.checkOutTime){
									alert("이미 예약되어있는 시간입니다.\n시간을 다시 선택해주세요.");
									//다시 시간을 선택할 수 있도록 count, checkInTime, checkOutTime, time1, time2 리셋해주기
									this.count=0;
									this.time1=0;
									this.time2=0;
									this.checkInTime=0;
									this.checkOutTime=0;
								}
							}
						}
						
						this.totalMoney = Math.abs(this.checkOutTime-this.checkInTime)*this.money*this.reserv_count;
						this.timeData= this.checkInTime + '-' +this.checkOutTime
					}
				},
				resetBtnClicked:function(){
					this.count=0;
					this.time1=0;
					this.time2=0;
					for(let i=this.checkInTime; i<=this.checkOutTime; i++){
						document.querySelector("#timeBtn"+i).classList.remove("activeBtn");
					}
					this.checkInTime=0;
					this.checkOutTime=0;
					this.totalMoney=0;
					this.reserv_count=0;
					this.reserv_count_value=0;
				},
				dayBtnClicked:async function(){
					console.log(this.day);
					//정보를 리셋한다. (다른 날짜를 갔다 오면 현재 입력한 예약한 시간이 미리 선택되어있을 수도 있음.)
					this.resetBtnClicked();
					for(let i=0; i<=24; i++){
						let timeBtn = "#timeBtn"+i;
						document.querySelector(timeBtn).classList.remove("disabled");
						document.querySelector(timeBtn).classList.remove("duplicate");
						document.querySelector(timeBtn).classList.remove("activeBtn");
					}
					
					//비동기 처리한 결과를 바로 vue의 data에 적용해서 쓰기 위해, fetch가 아닌 async/await를 사용한다.
					const response = await axios.get('${pageContext.request.contextPath}/space/reservation/getTime?space_num=${param.space_num}&reserv_date='+this.day);
					//받아온 결과를 vue의 state로 관리한다.
					this.timeList = response.data;
					
					//리스트를 돈다.
					let startToEndTime = [];
					for(let i=0; i<this.timeList.length; i++){
						//시작 시간과 끝 시간을 구한다.
						startToEndTime = this.timeList[i].reserv_time.split("-");
						let start = startToEndTime[0]*1;
						console.log(start);
						let end = startToEndTime[1]*1;
						console.log(end);
						let cnt = start;
						//시작시간과 끝 시간은 2번 겹치면 disabled 처리한다. (ex. A는 12-15시 예약, B는 15-18시 예약 고려함)
						for(let j=start; j<=end; j++){
							if( (start != 0 && cnt == start) || (end != 24 && cnt == end) ){
								let timeBtn = "#timeBtn"+j;
								if(document.querySelector(timeBtn).classList.contains("duplicate")){
									document.querySelector(timeBtn).classList.add("disabled");
								} else{
									document.querySelector(timeBtn).classList.add("duplicate");
								}
								cnt++;
							} else {
								let timeBtn = "#timeBtn"+j;
								document.querySelector(timeBtn).classList.add("disabled");
								cnt++;
							}
						}
					}
					
				},
				reservCountSelected:function(e){
					this.reserv_count = e.target.value;
					this.reserv_count_value = e.target.value;
					this.totalMoney = Math.abs(this.checkOutTime-this.checkInTime)*this.money*this.reserv_count;
				},
				submitBtnClicked:function(e){
					if(this.totalMoney == 0 || this.day==""){
						e.preventDefault();
						alert("예약 양식을 다시 확인해주세요.");
					}
				}
				
			}
		})
	</script>
	
	<!-- 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a606f0cedbe2671e138a677a7e0f3ff&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${spaceDto.addr}', function(result, status) {
		// 정상적으로 검색이 완료됐으면 
	    if (status === kakao.maps.services.Status.OK) {
	    	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	        	map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${spaceDto.space_name }</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    	map.setCenter(coords);
		} 
	});    
	</script>
	<script>
   		const deleteLink = function(){
			confirm("해당 글을 삭제하시겠습니까?")?this.submit():"";
		}
	</script>
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp" />
</body>
</html>






