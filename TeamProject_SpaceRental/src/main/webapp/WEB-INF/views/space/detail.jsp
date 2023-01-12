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
		${dibDto.dibson_num }
		<!-- 찜하기 -->
		<form action="${pageContext.request.contextPath}/space/dib_insert" id="dibForm">
			<div>
				<svg v-bind:class="[ isClicked ? 'clickedHeart' : 'nonClickedHeart']" v-on:click="clickHeartBtn" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-through-heart-fill" viewBox="0 0 16 16">
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
		<h3 id="qna">Q&A</h3>
		<div class="tmp"></div>
		<a href="${pageContext.request.contextPath}/space/list?cate_num=${cate_num}" >목록으로</a>
	
	</div>
	
	<script>
		let dibForm = new Vue({
			el:"#dibForm",
			data:{
				isClicked:false
			},
			methods:{
				clickHeartBtn:function(){
					this.isClicked = !this.isClicked
					const dibson_num = ${dibDto.dibson_num };
					console.log(dibson_num);
					if(this.isClicked == true){
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
		                       
		                    })
					} else if(this.isClicked == false){
						fetch("${pageContext.request.contextPath}/space/dib_delete?dib_delete=${dibDto.dibson_num}",
		                        {
		                           data: {
		                              dibson_num: ${empty dibDto.dibson_num? 0 : dibDto.dibson_num}
		                           }
		                        }
		                  )
		                    .then(function(response){
		                       console.log(response);
		                        return response.text();
		                    })
		                    .then(function(data){
		                       
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