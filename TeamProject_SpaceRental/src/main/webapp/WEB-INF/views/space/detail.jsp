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

</style>
<title>공간 상세 페이지</title>
</head>
<body>
	<div class="container">
		<h1>공간 상세 페이지</h1>
		<ul>
			<li><a href="#selectTime">예약 폼</a></li>
			<li><a href="#oneliner">한줄 소개</a></li>
			<li><a href="#intro">상세 소개</a></li>
			<li><a href="#review">이용 후기</a></li>
			<li><a href="#qna">Q&A</a></li>
		</ul>
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
	</div>
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