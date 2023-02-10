<%@page import="com.team.project.dib.dto.DibDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style>
	
	.reservationForm{
		display:flex;
		padding : 20px;
		grid-template-columns: 1fr 1fr;
		grid-auto-row : 1fr
		
	}
	
	@media screen and (max-width: 768px){
		.reservationForm{
			flex-direction: column;
		}
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
		width: 50px;
		height: 50px;
		color: gray;
	}
	.clickedHeart{
		width: 50px;
		height: 50px;
		color: red;
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
	      		</c:when>
	      	</c:choose>
      	</c:otherwise>
   	</c:choose>
		<!-- 찜하기 -->
		<form action="${pageContext.request.contextPath}/space/dib_insert" id="dibForm">
			<div>
				<h1>${spaceDto.space_name }</h1>
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
		<form id="selectTime" action="${pageContext.request.contextPath}/space/reservation" method="POST" v-on:submit="submitBtnClicked">
			<div class="reservationForm">
				<div>
						<img src="${pageContext.request.contextPath}/${spaceDto.mainImagePath }"/>
				</div>
				<div>
					<h3> Reservation Form </h3>
					<%--최소: 내일부터, 최대: 2달 --%>
					<label for="reserv_date">날짜 선택</label>
					<input type="date" id="reserv_date" name="reserv_date" min="${minday }" max="${maxday }" v-model="day" v-on:input="dayBtnClicked"/>
					<br />
					<p>선택하신 날짜의 시간당 요금은 1000원 입니다.</p>
					
						<c:forEach var="i" begin="0" end="24">
							<button type="button" class="timeBtn btn btn-info" value="${i }" id="timeBtn${i }"
								v-on:click="timeBtnClicked">${i }:00</button>
						</c:forEach>
						<ul v-for="item in timeList">
							<li>{{item.reserv_time}}</li>
						</ul>
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
						<button type="button" v-on:click="resetBtnClicked">다시 선택하기</button>
					<button type="submit">예약하기</button>
				</div>
			</div>
		</form>
			
			
		<h3 id="space_name">공간 제목</h3>
		<div class="tmp">
			<p>${spaceDto.space_name }</p>
		</div>
		<h3 id="oneliner">한 줄 소개</h3>
		<div class="tmp">
			<p>${spaceDto.oneliner }</p>
		</div>
		<h3 id="intro">상세 소개</h3>
		<div class="tmp">
			<p>${spaceDto.intro }</p>
		</div>
		<h3 id="addr">주소</h3>
		<div class="tmp">
			<p>${spaceDto.addr }</p>
		</div>
		<h3 id="review">Review <a href="${pageContext.request.contextPath}/review/reviewInsertform?cate_num=${cate_num }&space_num=${space_num}">추가하기</a></h3>
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
				<ul class="pagination">
					<%--
	               startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
	            	--%>
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
		            <%--
		               마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
		             --%>
		            <c:if test="${endPageNum lt totalPageCount }">
		               <li class="page-item">
		                  <a class="page-link" href="detail?cate_num=${cate_num }&space_num=${space_num}&pageNum=${endPageNum+1 }">Next</a>
		               </li>
		            </c:if>
				</ul>
			</nav>
		</div>
		<h3 id="qna">Q&A <a href="${pageContext.request.contextPath}/qna/qnaInsertform?cate_num=${cate_num }&space_num=${space_num}">추가하기</a></h3>
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
		      <nav>
		         <ul class="pagination">
		            <%--
		               qnaStartPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
		               &condition=${condition}&keyword=${encodedK}
		            --%>
		            <c:if test="${qnaStartPageNum ne 1 }">
		               <li class="page-item">
		                  <a class="page-link" href="detail?cate_num=${cate_num }&space_num=${space_num}&qnaPageNum=${qnaStartPageNum-1 }&condition=${condition}&keyword=${encodedK}">Prev</a>
		               </li>
		            </c:if>
		            <c:forEach var="i" begin="${qnaStartPageNum }" end="${qnaEndPageNum }">
		               <li class="page-item ${qnaPageNum eq i ? 'active' : '' }">
		                  <a class="page-link" href="detail?cate_num=${cate_num }&space_num=${space_num}&qnaPageNum=${i }&condition=${condition}&keyword=${encodedK}">${i }</a>
		               </li>
		            </c:forEach>
		            <%--
		               마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
		             --%>
		            <c:if test="${qnaEndPageNum lt qnatotalPageCount }">
		               <li class="page-item">
		                  <a class="page-link" href="detail?cate_num=${cate_num }&space_num=${space_num}&qnaPageNum=${qnaEndPageNum+1 }&condition=${condition}&keyword=${encodedK}">Next</a>
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
		    		<input type="text" name="keyword" placeholder="검색어..." 
		    			value="${keyword }" />
		    		<input type="hidden" name="cate_num" value=${cate_num }>
		    		<input type="hidden" name="space_num" value=${space_num }>
		    		<button type="submit">검색</button>
				</form>
				<c:if test="${not empty condition }">
					<p>
						<strong>${qnatotalRow }</strong> 개의 자료가 검색 되었습니다.
						<a href="${pageContext.request.contextPath}/space/detail?cate_num=${cate_num}&space_num=${space_num}">리셋</a>
					</p>
				</c:if>
		   </div>
		<a href="${pageContext.request.contextPath}/space/list?cate_num=${cate_num}" >목록으로</a>
		
	
	</div>
	
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
				reserv_count:0,
				reserv_count_value:0,
				timeList:{}
			},
			methods:{
				timeBtnClicked:function(e){
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
					}
					
					//비동기 처리한 결과를 바로 vue의 data에 적용해서 쓰기 위해, fetch가 아닌 async/await를 사용한다.
					const response = await axios.get('${pageContext.request.contextPath}/space/reservation/getTime?reserv_date='+this.day);
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
</body>
</html>