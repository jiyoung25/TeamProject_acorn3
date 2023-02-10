<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>예약리스트 보기(판매자)</title>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet"/>
<!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
   	
	<div class="container" id="reservMenu">
		<%-- 예약리스트 메뉴 --%>
		<div>
			<button v-on:click="onReservMenu(event)" 
				id="request_reserv" value="1" 
				> 예약 요청 </button>
			<button v-on:click="onReservMenu(event)" 
				id="wait_pay" value="2"> 결제 대기 </button>
			<button v-on:click="onReservMenu(event)" 
				id="complete_pay" value="3"> 결제 완료 </button>
			<button v-on:click="onReservMenu(event)" 
				id="pass_reserv" value="4"> 거절/지난 예약 </button>
		</div>
		
   		<%-- 예약 목록 --%>
		<c:choose>
			<c:when test="${param.reservCateNum eq 1 }">
				<h3>예약 요청 목록</h3><p>판매자가 회원님의 예약을 확인하고 있습니다.</p>
			</c:when>
			<c:when test="${param.reservCateNum eq 2 }">
				<h3>결제 대기 목록</h3><p>결제해주시면 예약이 확정됩니다.</p>
			</c:when>
			<c:when test="${param.reservCateNum eq 3 }">
				<h3>결제 완료 목록</h3><p>결제가 완료된 목록입니다.</p>
			</c:when>
			<c:when test="${param.reservCateNum eq 4 }">
				<h3>거절/지난 예약</h3><p>예약이 취소된 목록입니다.</p>
			</c:when>
		</c:choose>
		{{reservCateNum}}
		<div id="reservList">
			<table class="table">
			  <thead>
					<tr class="table-info">
						<th scope="row">예약 번호</th>
						<th scope="row">방 이름</th>
						<th scope="row">예약자 명</th>
						<th scope="row">예약자 수</th>
						<th scope="row">예약 날짜</th>
						<th scope="row">예약 시간</th>
						<th scope="row">예약 등록일</th>
						<th scope="row">총 비용</th>
						<th scope="row" v-if="reservCateNum === '1'"> 예약 취소 </th>
						<th scope="row" v-if="reservCateNum === '2'"> 결제하기 </th>
						<th scope="row" v-if="reservCateNum === '2'"> 예약 거절</th>
					</tr>
			  </thead>
				<tbody>
					<tr v-for="item in resultList">
						<td>{{item.reserv_num }}</td>
						<td>{{item.space_name }}</td>
						<td>{{item.users_id }}</td>
						<td>{{item.reserv_count }}</td>
						<td>{{item.reserv_date }}</td>
						<td>{{item.reserv_time }}</td>
						<td>{{item.reserv_reg }}</td>
						<td>{{item.totalMoney }}</td>
						<td v-if="reservCateNum === '1'"> <button id="rejectBtn" type="button" v-on:click="checkBtn()">예약 취소</button> </td>
						<td v-if="reservCateNum === '2'"> <button id="payBtn" type="button" v-on:click="checkBtn()">결제하기</button> </td>
						<td v-if="reservCateNum === '2'"> <button id="notpayBtn" type="button" v-on:click="checkBtn()">취소</button> </td>
					</tr>
				</tbody>	
			</table>
		</div>
	
		<%-- 페이징 --%>
		<nav>
			<ul class="pagination">
				<%--
		        	startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
		        	&condition=${condition}&keyword=${encodedK}
		        --%>
		        <c:if test="${startPageNum ne 1 }">
		            <li class="page-item">
		            	<a class="page-link" href="reservationlist?${pathQuery }&pageNum=${startPageNum-1 }">Prev</a>
		        	</li>
		        </c:if>
		        <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		            <li class="page-item ${pageNum eq i ? 'active' : '' }">
		            	<a class="page-link" href="reservationlist?${pathQuery }&pageNum=${i }">${i }</a>
		        	</li>
		        </c:forEach>
		        <%--
		           마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
		        --%>
		        <c:if test="${endPageNum lt totalPageCount }">
		            <li class="page-item">
		            	<a class="page-link" href="reservationlist?${pathQuery }&pageNum=${endPageNum+1 }">Next</a>
		        	</li>
		    	</c:if>
			</ul>
		</nav>
	</div>
	<!-- 수락 / 거절 버튼 -->
	<script>
		const checkBtn = function(clickedId){
			if(clickedId.includes("pay")){
				console.log(clickedId);
				//결제O- true, 예약 취소- false
				let isPaid = clickedId.indexOf("not") == 0 ? "false" : "true";
				let reserv_num_pay = clickedId.indexOf("not") == 0 ? clickedId.substr(9) : clickedId.substr(6);
				console.log(reserv_num_pay);
				fetch("${pageContext.request.contextPath}/users/reservation/goPay?num="+reserv_num_pay+"&isPaid="+isPaid)
	              .then(function(response){
	                  console.log(response);
	                  return response.text();
	              })
	              .then(function(data){
	            	  location.reload();
	              })
			} else if(clickedId.includes("reject")){
				//수락- true, 거절- false
				let isReservOk = "false";
				//예약 번호
				let reserv_num = clickedId.substr(9);
				fetch("${pageContext.request.contextPath}/seller/reservation/check-reserv?num="+reserv_num+"&isReservOk="+isReservOk)
	              .then(function(response){
	                  console.log(response);
	                  return response.text();
	              })
	              .then(function(data){
	            	  location.reload();
	              })
			}
		}
	</script>
	<!-- vue를 이용한 ajax메뉴 -->
	<script>
		const basicRoot = "${pageContext.request.contextPath}/users/getreservationlistToUser";
		const reservMenu = new Vue({
			el:"#reservMenu",
			data:{
				resultList:{},
				reservCateNum:1
			},
			methods:{
				onReservMenu: async function(event){
					this.reservCateNum = event.target.value;
					let gofor = "";
					if(this.reservCateNum == 1){
						gofor = basicRoot;
					} else if(this.reservCateNum == 2){
						gofor = basicRoot + "?checkReserv=true";
					} else if(this.reservCateNum == 3){
						gofor = basicRoot + "?checkReserv=true&isPaid=true";
					} else if(this.reservCateNum == 4){
						gofor = basicRoot + "?checkReserv=false";
					}
					console.log(gofor);
					//비동기 처리한 결과를 바로 vue의 data에 적용해서 쓰기 위해, fetch가 아닌 async/await를 사용한다.
					const response = await axios.get(gofor);
					console.log(response.data);
					//받아온 결과를 vue의 state로 관리한다.
					this.resultList = response.data;
				},
				checkBtn : function(clickedId){
					console.log(clickedId);
				}
			}
		})
	</script>
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
</body>
</html>