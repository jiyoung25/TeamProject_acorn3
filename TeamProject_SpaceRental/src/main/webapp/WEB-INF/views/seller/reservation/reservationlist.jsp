<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>예약리스트 (판매자) :Ubiquitous</title>
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<%-- axios --%>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
<style>
	br{
		mso-data-placement:same-cell;
	}
	.reservMenuList:hover{
		cursor:pointer;
	}
</style>
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
   	
	<div class="container">
		<div class="row">
			<%-- 예약리스트 메뉴 --%>
			<div class="col-lg-2" style="margin-top:97px;">
				<ul class="list-group" id="reservListMenu">
					<li class="list-group-item list-group-item-dark">예약 리스트 확인</li>
					<li class="list-group-item list-group-item-secondary list-group-item-action reservMenuList ${empty param.reservCateNum || param.reservCateNum eq 1 ? 'active' : '' }"
					  	onClick="location.href='${pageContext.request.contextPath}/seller/reservation/reservationlist?reservCateNum=1'" 
						id="request_reserv" value="1">예약 요청</li>
					<li class="list-group-item list-group-item-secondary list-group-item-action reservMenuList ${param.reservCateNum eq 2 ? 'active' : '' }"
					 	onClick="location.href='${pageContext.request.contextPath}/seller/reservation/reservationlist?checkReserv=true&reservCateNum=2'" 
						id="wait_pay" value="2">결제 대기</li>
					<li class="list-group-item list-group-item-secondary list-group-item-action reservMenuList ${param.reservCateNum eq 3 ? 'active' : '' }"
						onClick="location.href='${pageContext.request.contextPath}/seller/reservation/reservationlist?checkReserv=true&isPaid=true&reservCateNum=3'" 
						id="complete_pay" value="3">결제 완료</li>
					<li class="list-group-item list-group-item-secondary list-group-item-action reservMenuList ${param.reservCateNum eq 4 ? 'active' : '' }"
						onClick="location.href='${pageContext.request.contextPath}/seller/reservation/reservationlist?checkReserv=false&reservCateNum=4'" 
						id="pass_reserv" value="4">거절/지난 예약</li>
				</ul>
			</div>
			
	   		<%-- 예약 목록 --%>
	   		<div class="col-lg-10 mt-3 mb-1">
				<c:choose>
					<c:when test="${(param.reservCateNum eq 1) || ( empty param.reservCateNum) }">
						<h3>예약 요청 목록</h3><p>들어온 예약 요청 목록입니다.</p>
					</c:when>
					<c:when test="${param.reservCateNum eq 2 }">
						<h3>결제 대기 목록</h3><p>결제 대기 중인 예약 목록입니다.</p>
					</c:when>
					<c:when test="${param.reservCateNum eq 3 }">
						<h3>결제 완료 목록</h3><p>결제가 완료된 목록입니다.</p>
					</c:when>
					<c:when test="${param.reservCateNum eq 4 }">
						<h3>거절/지난 예약</h3><p>예약이 취소된 목록입니다.</p>
					</c:when>
				</c:choose>
				<div id="reservList">
					<table class="table align-middle mb-0 bg-white">
						<thead class="bg-light">
							<tr>
								<th scope="row">예약<br>번호</th>
								<th scope="row">방<br>이름</th>
								<th scope="row">예약자 명</th>
								<th scope="row">예약자 수</th>
								<th scope="row">예약<br>날짜</th>
								<th scope="row">예약<br>시간</th>
								<th scope="row">예약<br>메시지</th>
								<th scope="row">예약<br>등록일</th>
								<th scope="row">총<br>비용</th>
								<c:choose>
									<c:when test="${(param.reservCateNum eq 1) or (empty param.reservCateNum)}">
										<th scope="row">예약<br>수락</th>
										<th scope="row">예약<br>거절</th>
									</c:when>
									<c:when test="${param.reservCateNum eq 2 }">
										<th scope="row">예약<br>거절</th>
									</c:when>
								</c:choose>
							</tr>
						</thead>
					    <c:forEach var="tmp" items="${list }">
							<tbody>
								<tr>
									<td>${tmp.reserv_num }</td>
									<td onClick="location.href='${pageContext.request.contextPath}/space/detail?cate_num=${tmp.cate_num }&space_num=${tmp.space_num }'" style="cursor:pointer;">
										${tmp.space_name }
									</td>
									<td>${tmp.users_id }</td>
									<td>${tmp.reserv_count }</td>
									<td>${tmp.reserv_date }</td>
									<td>${tmp.reserv_time }</td>
									<td>${tmp.reserv_comment }</td>
									<td>${tmp.reserv_reg }</td>
									<td>${tmp.totalMoney }</td>
									<c:choose>
										<c:when test="${(param.reservCateNum eq 1) or (empty param.reservCateNum)}">
											<td><button id="okBtn${tmp.reserv_num }" type="button" class="btn btn-outline-dark" style="--bs-btn-padding-y: 0.1rem; --bs-btn-padding-x: .5rem;" onClick="checkBtn(this.id, event)" value="${tmp.reserv_date }&&${tmp.space_num }&&${tmp.reserv_time}">Ok</button></td>
											<td><button id="rejectBtn${tmp.reserv_num }" type="button" class="btn btn-outline-dark" style="--bs-btn-padding-y: 0.1rem; --bs-btn-padding-x: .5rem;" onClick="checkBtn(this.id)">Reject</button></td>
										</c:when>
										<c:when test="${param.reservCateNum eq 2 }">
											<td><button id="rejectBtn${tmp.reserv_num }" type="button" class="btn btn-outline-dark" style="--bs-btn-padding-y: 0.1rem; --bs-btn-padding-x: .5rem;" onClick="checkBtn(this.id)">Reject</button></td>
										</c:when>
									</c:choose>
								</tr>
							</tbody>	
						</c:forEach>
					</table>
				</div>
			
				<%-- 페이징 --%>
				<nav class="mt-3">
					<ul class="pagination justify-content-center">
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
		</div>
	</div>

	<!-- 결제 수락/ 예약 거절 버튼 -->
	<script>
		const checkBtn = async function(clickedId, event){
			//수락- true, 거절- false
			let isReservOk = clickedId.indexOf("ok") == 0 ? "true" : "false";
			//예약 번호
			let reserv_num = clickedId.indexOf("ok") == 0 ? clickedId.substr(5) : clickedId.substr(9);
			//마지막에 fetch할 경로를 담을 변수(resultUrl) 미리 선언해두기
			let resultUrl = "";
			
			if(isReservOk == 'false'){
				resultUrl = '${pageContext.request.contextPath}/seller/reservation/check-reserv?num='+reserv_num+'&isReservOk=false'
				fetch(resultUrl)
	              .then(function(response){
	                  console.log(response);
	                  return response.text();
	              })
	              .then(function(data){
	            	  location.reload();
	              })
	              return;
			} else {
				resultUrl = '${pageContext.request.contextPath}/seller/reservation/check-reserv?num='+reserv_num+'&isReservOk=true'

				//[0]: 예약 날짜, [1]: 방 번호, [2]: 예약 시간
				let btnValues = event.target.value.split('&&');
				let reserv_date = btnValues[0];
				let space_num = btnValues[1];
				let reserv_time = btnValues[2];
				//희망 예약 시간의 시작과 끝을 array type으로 저장
				let hopeReservTime = reserv_time.split('-');
				
				//이미 예약요청을 수락한 reserv_time을 얻어오기 위한 비동기 작업
				const response = await axios.get('${pageContext.request.contextPath}/space/reservation/getTime?space_num='+space_num+'&reserv_date='+reserv_date);
				let resultList = response.data;
				
				if(resultList != null){
					for(let i=0; i<resultList.length; i++){
						console.log(resultList[i].reserv_time);
						//이미 예약되어있는 시간의 시작과 끝을 array type으로 선언
						let alreadyReserved = resultList[i].reserv_time.split('-');
						//이미 예약되어있는 시간을 포함한 예약은 예약 요청을 수락하지 못하도록 하기
						//경우 1) 희망 시간: 2-6시, 예약되어있는 시간: 3-8시  ==> 희망[0] <= 예약[0] && (희망[1]>=예약[0] && 희망[1] <= 예약[1]
						//경우 2) 희망 시간: 2-6시, 예약되어있는 시간: 3-5시  ==> 희망[0] <= 예약[0] && 희망[1] >= 예약[0] && 희망[1] >= 예약[1]
						//경우 3) 희망 시간: 2-6시, 예약되어있는 시간: 1-5시  ==> 희망[0] >= 예약[0] && 희망[0]<=예약[1] && 희망[1] >= 예약[1]
						//경우 4) 희망 시간: 2-6시, 예약되어있는 시간: 1-8시  ==> (희망[0] >= 예약[0] && 희망[0]<=예약[1]) && 희망[1] <= 예약[1]
						//희망 시간 = 예약 시간인 경우는 case1, 2, 3, 4 모두에 걸린다.
						const hrt0 = Number(hopeReservTime[0]);
						const hrt1 = Number(hopeReservTime[1]);
						const ar0 = Number(alreadyReserved[0]);
						const ar1 = Number(alreadyReserved[1]);
						const reservCase1 = (hrt0<=ar0) && (hrt1>=ar0 && hrt1<=ar1);
						const reservCase2 = (hrt0<=ar0) && (hrt1>=ar0) && (hrt1>=ar1);
						const reservCase3 = (hrt0>=ar0) && (hrt0<=ar0) && (hrt1>=ar1);
						const reservCase4 = (hrt0>=ar0 && hrt1<=ar1) && (hrt1<=ar1);
						console.log("reservCase1" + reservCase1);
						console.log("reservCase2" + reservCase2);
						console.log("reservCase3" + reservCase3);
						console.log("reservCase4" + reservCase4);
						console.log(reservCase1 == true || reservCase2 == true || reservCase3 == true || reservCase4 == true);
						
						//4가지의 경우 중 1개라도 true이면 예약하지 못한다.
						if(reservCase1 == true || reservCase2 == true || reservCase3 == true || reservCase4 == true){
							let confirmDelete = confirm("이미 예약되어있는 시간입니다.\n이 요청을 거절하시겠습니까?");
							//Y: 예약을 거절하는 url로, N: 수락도 거절도 안하도록
							resultUrl = confirmDelete ? '${pageContext.request.contextPath}/seller/reservation/check-reserv?num='+reserv_num+'&isReservOk=false'
									: ''
						}
					}
				}
				
				fetch(resultUrl)
	              .then(function(response){
	                  console.log(response);
	                  return response.text();
	              })
	              .then(function(data){
	            	  location.reload();
	              })
	            return;
			}
		}
	</script>
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
</body>
</html>