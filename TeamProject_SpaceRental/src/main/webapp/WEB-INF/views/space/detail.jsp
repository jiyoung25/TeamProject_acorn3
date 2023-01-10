<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
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
	#reservationForm > #timeBox > .timeTable{
		display: inline-block;
		text-align: left;
		width: 60px;
		height: 30px;
		border: 1px sodild black;
	}
	
	.time_wrapper{
		width: 30px;
		height: 30px;
		background-color:yellow;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.js"></script>
<title>공간 상세 페이지</title>
</head>
<body>
	<div class="container">
		<h1>공간 상세 페이지</h1>

		<form id ="selectTime" action="shop/reservation">
			<div id="reservationForm">
				<%--최소: 내일부터, 최대: 2달 --%>
				<input type="date" name="date" min="${minday }" max="${maxday }" />
				<br />
				<p>선택하신 날짜의 시간당 요금은 {{MONEY}}원 입니다.</p>
				<div id="timeBox">
					<c:forEach var="i" begin="0" end="34" step="1">
						<c:choose>
							<c:when test="${i lt 24 }">
								<div class="timeTable">
									<div id="time_wrapper" onClick="clickedTime">
										<div>${i }</div>
										<div class="time"></div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="timeTable">
									<div id="time_wrapper" onClick="clickedTime">
										<div>${i-24 }</div>
										<div class="time"></div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</form>
	</div>
	<script>
		let selectTime = new Vue({
			el:"#selectTime",
			data: {
				MONEY: 0
			}
		})
	</script>
</body>
</html>