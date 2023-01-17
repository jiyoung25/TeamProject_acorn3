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
<style>
	#reservationForm {
		white-space: nowrap;
		overflow: scroll; border : 1px sodivd black;
		width: 400px;
		height: 800px;
		border: 1px sodivd black;
	}
	
	#reservationForm > #timeBox{
		overflow: scroll;
		white-space: nowrap;
	}
	
	#noneVisible{
		display:none;
	}
	
	.tmp{
		height:500px;
		background-color:yellow;
	}
	#dibSubmitBtn{
		display : none;
	}
	.nonClickedHeart{
		width: 100px;
		height: 100px;
		color: gray;
	}
	.clickedHeart{
		width: 100px;
		height: 100px;
		color: red;
	}
</style>
<title>공간 상세 페이지</title>
</head>
<body>
	<div class="container">
		<h1>공간 상세 페이지</h1>
		<!-- 목록 -->
		<ul>
			<li><a href="#selectTime">예약 폼</a></li>
			<li><a href="#oneliner">한줄 소개</a></li>
			<li><a href="#intro">상세 소개</a></li>
			<li><a href="#review">이용 후기</a></li>
			<li><a href="#qna">Q&A</a></li>
		</ul>
		<!-- 찜하기 -->
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
		<form id="selectTime" action="shop/reservation">
			<div id="reservationForm">
				<%--최소: 내일부터, 최대: 2달 --%>
				<input type="date" name="date" min="${minday }" max="${maxday }" />
				<br />
				<p>선택하신 날짜의 시간당 요금은 0원 입니다.</p>
				<div id="timeBox">
					<c:forEach var="i" begin="0" end="24">
						<button type="button" class="timeBtn btn btn-info" value="${i }"
							v-on:click="timeBtnClicked">${i }:00</button>
					</c:forEach>
					<p id="noneVisible">{{count}}{{time1}}{{time2}}</p>
					<br />
					<h3>선택 정보</h3>
					<p>입실 시간:{{checkInTime}}</p>
					<p>퇴실 시간:{{checkOutTime}}</p>
					<p>비용:{{totalMoney}}</p>
					<br />
					<button type="button" v-on:click="resetBtnClicked">다시 선택하기</button>
				</div>
			</div>
		</form>
		
		<!-- 내용 -->
		<h3 id="oneliner">한 줄 소개</h3>
		<div class="tmp"></div>
		<h3 id="intro">상세 소개</h3>
		<div class="tmp"></div>
		<h3 id="addr">주소</h3>
		<div class="tmp"></div>
		<h3 id="review">이용 후기</h3>
		<div class="tmp"></div>
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
		               startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
		               &condition=${condition}&keyword=${encodedK}
		            --%>
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
		            <%--
		               마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
		             --%>
		            <c:if test="${endPageNum lt totalPageCount }">
		               <li class="page-item">
		                  <a class="page-link" href="detail?cate_num=${cate_num }&space_num=${space_num}&pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedK}">Next</a>
		               </li>
		            </c:if>
		         </ul>
		      </nav>
		      
		      <!-- 검색 폼 -->
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
				money:30000,
				count:0,
				time1:0,
				time2:0,
				checkInTime:0,
				checkOutTime:0,
				totalMoney:0
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
						this.totalMoney = Math.abs(this.time1-this.time2)*this.money;
					}
				},
				resetBtnClicked:function(){
					this.count=0;
					this.time1=0;
					this.time2=0;
					this.checkInTime=0;
					this.checkOutTime=0;
					this.totalMoney=0;
				}
			}
		})
	</script>
</body>
</html>