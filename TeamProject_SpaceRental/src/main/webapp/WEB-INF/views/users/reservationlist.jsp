<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>예약리스트 :Ubiquitous</title>
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<%-- vue --%>
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.js"></script>
<%-- axios --%>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
<style>
	.reservMenuList{
		cursor:pointer;
	}
	.pagination{
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
   	<div id="reservMenu">
		<div class="container">
			<div class="row">
				<%-- 예약리스트 메뉴 --%>
				<div class="col-md-2" style="margin-top:97px;">
					<ul class="list-group">
						<li class="list-group-item list-group-item-dark">나의 예약</li>
						<li class="list-group-item list-group-item-secondary list-group-item-action reservMenuList" :class="{'active': reservCateNum === 1}" v-on:click="onReservMenu" id="request_reserv" value="1" >예약 요청</li>
						<li class="list-group-item list-group-item-secondary list-group-item-action reservMenuList" :class="{'active': reservCateNum === 2}" v-on:click="onReservMenu" id="wait_pay" value="2">결제 대기</li>
						<li class="list-group-item list-group-item-secondary list-group-item-action reservMenuList" :class="{'active': reservCateNum === 3}" v-on:click="onReservMenu" id="complete_pay" value="3">결제 완료</li>
						<li class="list-group-item list-group-item-secondary list-group-item-action reservMenuList" :class="{'active': reservCateNum === 4}" v-on:click="onReservMenu" id="pass_reserv" value="4">거절/지난 예약</li>
					</ul>
				</div>
				
		   		<%-- 예약 목록 --%>
		   		<div class="col-md-10 mt-3 mb-1">
			   		<div v-if="reservCateNum === 1 ||reservCateNum === '1'">
			   			<h3>예약 요청 목록</h3><p>판매자가 회원님의 예약을 확인하고 있습니다.</p>
			   		</div>
			   		<div v-else-if="reservCateNum === 2 ||reservCateNum === '2'">
			   			<h3>결제 대기 목록</h3><p>결제해주시면 예약이 확정됩니다.</p>
			   		</div>
			   		<div v-else-if="reservCateNum === 3 ||reservCateNum === '3'">
			   			<h3>결제 완료 목록</h3><p>결제가 완료된 목록입니다.</p>
			   		</div>
			   		<div v-else-if="reservCateNum === 4 ||reservCateNum === '4'">
			   			<h3>거절/지난 예약</h3><p>예약이 취소된 목록입니다.</p>
			   		</div>
					<div id="reservList">
						<table class="table align-middle mb-0 bg-white">
						  <thead class="bg-light">
								<tr>
									<th scope="row">예약 번호</th>
									<th scope="row">방 이름</th>
									<th scope="row">예약자 수</th>
									<th scope="row">예약 날짜</th>
									<th scope="row">예약 시간</th>
									<th scope="row">예약 메시지</th>
									<th scope="row">예약 등록일</th>
									<th scope="row">총 비용</th>
									<th scope="row" v-if="reservCateNum === 1 || reservCateNum === '1'"> 예약 취소 </th>
									<th scope="row" v-if="reservCateNum === '2'"> 결제하기 </th>
									<th scope="row" v-if="reservCateNum === '2'"> 예약 거절</th>
								</tr>
						  </thead>
						  <tbody>
							  <tr v-for="item in resultList">
							  	<td>{{item.reserv_num }}</td>
							  	<td v-on:click="onSpaceBtn(item.cate_num,item.space_num)" style="cursor:pointer;">{{item.space_name }}</td>
							  	<td>{{item.reserv_count }}</td>
							  	<td>{{item.reserv_date }}</td>
								<td>{{item.reserv_time }}</td>
								<td>{{item.reserv_comment}}</td>
								<td>{{item.reserv_reg }}</td>
								<td>{{item.totalMoney }}</td>
								<td v-if="reservCateNum === 1|| reservCateNum === '1'"> <button type="button" class="btn btn-outline-dark" style="--bs-btn-padding-y: 0.1rem; --bs-btn-padding-x: .5rem;" :value="item.reserv_num" v-on:click="onRejectBtn">취소</button> </td>
								<td v-if="reservCateNum === 2|| reservCateNum === '2'"> <button type="button" class="btn btn-outline-dark" style="--bs-btn-padding-y: 0.1rem; --bs-btn-padding-x: .5rem;" :value="item.reserv_num" v-on:click="onPayBtn">결제하기</button> </td>
								<td v-if="reservCateNum === 2|| reservCateNum === '2'"> <button type="button" class="btn btn-outline-dark" style="--bs-btn-padding-y: 0.1rem; --bs-btn-padding-x: .5rem;" :value="item.reserv_num" v-on:click="onNotPayBtn">취소</button> </td>
							</tr>
						  </tbody>	
						</table>
					</div>
				
					<%-- 페이징 --%>
					<nav class="mt-3">
						<ul class="pagination justify-content-center">
							<%--
					        	startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
					        	&condition=${condition}&keyword=${encodedK}
					        --%>
					        <li class="page-item">
					            <a class="page-link" v-on:click="onPagenation" id="prev">Prev</a>
					        </li>
					        <%-- 페이지 번호 --%>
					        <li class="page-item" v-for="item in pageList">
					       		<a class="page-link pageBtn" :class="{'active': item == pageNum}" v-on:click="onPagenation" :id="item">{{item}}</a> 	
					        </li>
					        <%--
					           마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
					        --%>
					        <li class="page-item">
					            <a class="page-link" v-on:click="onPagenation" id="next">Next</a>
					        </li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	<!-- vue를 이용한 비동기 메뉴 -->
	<script>
		const basicRoot = "${pageContext.request.contextPath}/users/getreservationlistToUser";
		//한 페이지에 몇개씩 표시할 것인지
		const PAGE_ROW_COUNT=10;
		//하단 페이지를 몇개씩 표시할 것인지
		const PAGE_DISPLAY_COUNT=5;
		
		const reservMenu = new Vue({
			el:"#reservMenu",
			data:{
				resultList:{},
				reservCateNum:1,
				gofor:"${pageContext.request.contextPath}/users/getreservationlistToUser",
				pageNum: 1,
				totalRow: 1,
				pageList: [],
				startPageNum:1,
				endPageNum:1,
				totalPageCount:1
			},
			async mounted(){
				this.getList();
			},
			computed:{
			},
			methods:{
				getList: async function(){
					//비동기 처리한 결과를 바로 vue의 data에 적용해서 쓰기 위해, fetch가 아닌 async/await를 사용한다.
					const response = await axios.get(this.gofor);
					//받아온 결과를 vue의 state로 관리한다.
					this.resultList = response.data;
					
					if(this.resultList.length!=0){
						this.totalRow = this.resultList[0].totalRow;
						this.pageNum = this.resultList[0].pageNum;
					} else{
						this.totalRow = 1;
					}
					
					//하단 시작 페이지 번호
					this.startPageNum = 1 + (Math.floor((this.pageNum*1-1)/PAGE_DISPLAY_COUNT))*PAGE_DISPLAY_COUNT;
					//하단 끝 페이지 번호
					this.endPageNum=this.startPageNum*1+PAGE_DISPLAY_COUNT-1;
					//전체 페이지의 갯수
					this.totalPageCount=Math.ceil(this.totalRow/PAGE_ROW_COUNT);
					//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
					if(this.endPageNum > this.totalPageCount){
						this.endPageNum=this.totalPageCount; //보정해 준다.
					}

					this.pageList.splice(0);
					if(this.startPageNum == this.endPageNum){
						this.pageList = [this.startPageNum];
					} else{
						for(let i=this.startPageNum; i<=this.endPageNum; i++){
							this.pageList.push(i);
						}
					}
				},
				onReservMenu: async function(event){
					this.reservCateNum = event.target.value;
					if(this.reservCateNum == 1){
						this.gofor = basicRoot;
					} else if(this.reservCateNum == 2){
						this.gofor = basicRoot + "?checkReserv=true";
					} else if(this.reservCateNum == 3){
						this.gofor = basicRoot + "?checkReserv=true&isPaid=true";
					} else if(this.reservCateNum == 4){
						this.gofor = basicRoot + "?checkReserv=false";
					}
					console.log(this.gofor);
					this.getList();
					
				},
				onRejectBtn: async function(event){
					let reserv_num = event.target.value;
					//거절하고
					const response = await axios.get("${pageContext.request.contextPath}/seller/reservation/check-reserv?num="+reserv_num+"&isReservOk=false");
					//리스트 로딩
					this.getList();
				},
				onPayBtn: async function(event){
					let reserv_num = event.target.value;
					//돈 내고
					const response = await axios.get("${pageContext.request.contextPath}/users/reservation/goPay?num="+reserv_num+"&isPaid=true");
					//리스트 로딩
					this.getList();
				},
				onNotPayBtn: async function(event){
					let reserv_num = event.target.value;
					const response = await axios.get("${pageContext.request.contextPath}/users/reservation/goPay?num="+reserv_num+"&isPaid=false");
					this.getList();
				},
				onPagenation: async function(event){
					let id = event.target.id;
					
					//가야할 url에 이미 pageNum이 있다면, 이따 pageNum을 추가할 것이기 때문에 중복된다.
					//그러므로 pageNum 파라미터를 미리 지워준다.
					if(this.gofor.includes("pageNum")){
						this.gofor = this.gofor.substr(0 , this.gofor.indexOf("pageNum")*1-1);
					}
					
					//id가 prev인지, next인지, 숫자인지에 따라 pageNum이 결정된다.
					if(id.includes("prev")){
						this.pageNum = this.startPageNum*1-1;
						if(this.pageNum*1 <= 0){
							alert("첫 번째 페이지입니다.");
							this.pageNum = 1;
						}
					} else if(id.includes("next")){
						this.pageNum = this.endPageNum*1+1;
						if(this.pageNum > this.totalPageCount){
							alert("마지막 페이지입니다.");
							this.pageNum = this.totalPageCount;
						}
					} else{
						this.pageNum = id;
					}
					
					//reservCateNum == 1이면 pageNum을 파라미터로 넘길 때 "?"가 필요하고, 그 외에는 "&"이 필요하다.
					if(this.reservCateNum == 1){
						this.gofor += "?pageNum="+this.pageNum;
					} else{
						this.gofor += "&pageNum="+this.pageNum;
					}
					
					console.log(this.gofor);
					//pageNum을 파라미터로 넘긴 값으로 list를 받아오고, 버튼 활성화 시키기
					this.getList();
				},
				onSpaceBtn:function(cate_num,space_num){
					location.href="${pageContext.request.contextPath}/space/detail?cate_num="+cate_num+"&space_num="+space_num;
				}
			}
		})
	</script>
</body>
</html>