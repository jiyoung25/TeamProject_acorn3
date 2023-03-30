<%@page import="com.team.project.dib.dto.DibDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
#noneVisible {
	display: none;
}

#dibSubmitBtn {
	display: none;
}

.nonClickedHeart {
	width: 30px;
	height: 30px;
	color: gray;
}

.clickedHeart {
	width: 30px;
	height: 30px;
	color: red;
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
	margin: auto;
	margin-bottom: 10px;
}

.reservationForm {
	padding: 2em 2em;
	margin: 2em 10px;
	font-weight: bold;
	color: #565656;
	background: #f8f9fa;
	box-shadow: 0px 0px 0px 10px #f8f9fa;
	border: solid 2px #d3d3d3;
	border-radius: 8px;
}

.heartBtn {
	transition: all 0.2s linear;
}

.heartBtn:hover {
	transform: scale(1.4);
}

#spaceName {
	/* 한 줄 자르기 */
	display: inline-block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
<title>공간 상세 페이지</title>
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp" />
<%-- vue.js, axios --%>
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<%-- import from static --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/star.css" />
<%--페비콘 링크 --%>
<link rel="icon"
	href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
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

	<%-- 본문 시작 --%>
	<div class="container">
		<div class="row">
			<!--공간사진-->
			<div class="col align-center">
				<div class="row mt-3 mb-3">
					<div id="imgWrapper"
						style="width: 100%; height: 400px; overflow: hidden;">
						<img
							src="${pageContext.request.contextPath}${spaceDto.mainImagePath }"
							class="img-fluid"
							style="width: 100%; height: 100%; object-fit: cover;">
					</div>
				</div>
				<!--공간이름-->
				<div class="row text-center">
					<div class="fs-1 text-center col" id="spaceName"
						style="padding: 0.5em; margin: 1em 0; border: solid 3px #000000;">
						<div class="row">
							<div class="col-10">${spaceDto.space_name }</div>
							<div class="col-2">
								<!-- 찜하기 -->
								<div class="container text-center">
									<form
										action="${pageContext.request.contextPath}/space/dib_insert"
										id="dibForm">
										<svg v-bind:class="classObject" v-on:click="clickHeartBtn"
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor"
											class="bi bi-suit-heart-fill heartBtn align-middle"
											viewBox="0 0 16 16" style="cursor: pointer;">
											<path
												d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
										</svg>
										<input type="hidden" name="space_num"
											value="${spaceDto.space_num }" /> <input type="hidden"
											name="users_num" value="${spaceDto.users_num }" /> <input
											type="hidden" name="users_id" value="${id }" />
										<button type="submit" id="dibSubmitBtn">제출</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- 탭 이름 -->
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link ${empty param.tab? 'active':'' }" id="home-tab"
								data-bs-toggle="tab" data-bs-target="#home-tab-pane"
								type="button" role="tab" aria-controls="home-tab-pane"
								aria-selected="true">공간 소개</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link ${param.tab == 'review'? 'active':'' }" id="review-tab" data-bs-toggle="tab"
								data-bs-target="#review-tab-pane" type="button" role="tab"
								aria-controls="review-tab-pane" aria-selected="false">Review</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link ${param.tab == 'qna'? 'active':'' }" id="qna-tab" data-bs-toggle="tab"
								data-bs-target="#qna-tab-pane" type="button" role="tab"
								aria-controls="qna-tab-pane" aria-selected="false">Q&A</button>
						</li>
					</ul>
					<!-- 탭 내용 -->
					<div class="tab-content" id="myTabContent">
						<%-- 1. 공간 소개 --%>
						<div class="tab-pane fade ${empty param.tab? 'show active':'' }" id="home-tab-pane"
							role="tabpanel" aria-labelledby="home-tab" tabindex="0">
							<div class="alert alert-secondary text-black mt-3" role="alert">
								<h4 class="alert-heading">한 줄 소개</h4>
								<hr>
								<p class="mb-0">${spaceDto.oneliner }</p>
								<br>
								<h4 class="alert-heading">상세 소개</h4>
								<hr>
								<p class="mb-0">${spaceDto.intro }</p>
								<br>
								<h4 class="alert-heading">주소</h4>
								<hr>
								<p class="mb-0">${spaceDto.addr }${spaceDto.addr2 }</p>
							</div>
							<div id="map" style="width: 100%; height: 350px;"></div>
						</div>
						<%-- 2. 사용자가 사용한 방 -> 리뷰 쓰기 가능 --%>
						<div class="tab-pane fade ${param.tab == 'review'? 'show active':'' }" id="review-tab-pane" role="tabpanel"
							aria-labelledby="review-tab" tabindex="0">
							<div class="mt-3 mb-3">
								<form
									action="${pageContext.request.contextPath}/review/reviewInsertform"
									method="POST">
									<c:choose>
										<c:when
											test="${empty possibleReview && not empty sessionScope.id}">
											<div class="row">
												<div class="col-9">
													<select name="possibleReview" id="possibleReview"
														class="form-select">
														<option value="">방을 이용해주세요.</option>
													</select>
												</div>
												<div class="col-3">
													<button class="btn btn-outline-dark" style="width: 100%;"
														disabled>리뷰 쓰기</button>
												</div>
											</div>
										</c:when>
										<c:when
											test="${not empty possibleReview && not empty sessionScope.id}">
											<div class="row">
												<div class="col-9">
													<select name="possibleReview" id="possibleReview"
														class="form-select">
														<c:forEach items="${possibleReview }" var="item">
															<option
																value="${item.reserv_num }&&${item.space_num}&&${item.cate_num}"><strong>${item.space_name }
																	방 리뷰쓰기</strong></option>
														</c:forEach>
													</select>
												</div>
												<div class="col-3">
													<button class="btn btn-outline-dark" style="width: 100%;">리뷰
														쓰기</button>
												</div>
											</div>
										</c:when>
									</c:choose>
								</form>
							</div>
							<div class="container">
								<table class="table align-middle mb-0 bg-white">
									<thead class="bg-light">
										<tr>
											<th>작성자</th>
											<th>제목</th>
											<th>별점</th>
											<th>작성일</th>
											<c:if test="${ usersCode eq 1}">
												<th>삭제</th>
											</c:if>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty reviewlist }">
												<c:forEach var="tmp" items="${reviewlist }">
													<tr>
														<td>${tmp.review_writer }</td>
														<td><a
															href="${pageContext.request.contextPath}/review/reviewdetail?review_num=${tmp.review_num}&space_num=${param.space_num}"
															style="text-decoration: none;">${tmp.review_title }</a></td>
														<td>
															<%-- 별점 --%> <span class="star"> ★★★★★ <span
																style="width: ${tmp.star *10 }%;">★★★★★</span>
														</span>
														</td>
														<td>${tmp.review_regdate }</td>
														<c:if test="${ usersCode eq 1}">
															<td><a
																href="${pageContext.request.contextPath}/space/reviewDelete?review_num=${tmp.review_num}&cate_num=${cate_num }&space_num=${space_num}"
																onClick="deleteLink(); return false;">삭제</a></td>
														</c:if>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan='4' class="text-center">등록된 리뷰가 존재하지 않습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>

								<%-- 리뷰 페이지네이션 --%>
								<nav>
									<ul class="pagination justify-content-center">
										<%--
											startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
										--%>
										<c:if test="${startPageNum ne 1 }">
											<li class="page-item"><a class="page-link"
												href="detail?cate_num=${param.cate_num }&space_num=${param.space_num}&pageNum=${startPageNum-1 }&tab=review">Prev</a>
											</li>
										</c:if>
										<c:forEach var="i" begin="${startPageNum }"
											end="${endPageNum }">
											<li class="page-item ${pageNum eq i ? 'active' : '' }"><a
												class="page-link"
												href="detail?cate_num=${param.cate_num }&space_num=${param.space_num}&pageNum=${i }&tab=review">${i }</a>
											</li>
										</c:forEach>
										<%--
								           	마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
										--%>
										<c:if test="${endPageNum lt totalPageCount }">
											<li class="page-item"><a class="page-link"
												href="detail?cate_num=${param.cate_num }&space_num=${param.space_num}&pageNum=${endPageNum+1 }&tab=review">Next</a>
											</li>
										</c:if>
									</ul>
								</nav>
							</div>
						</div>
						<%-- QnA --%>
						<div class="tab-pane fade ${param.tab == 'qna'? 'show active':'' }" id="qna-tab-pane" role="tabpanel"
							aria-labelledby="qna-tab" tabindex="0">
							<button type="button"
								onclick="location.href='${pageContext.request.contextPath}/qna/qnaInsertform?cate_num=${param.cate_num }&space_num=${param.space_num}'"
								class="btn btn-outline-dark mt-3 mb-3" style="width: 100%;">Q&A
								추가하기</button>
							<table class="table align-middle mb-0 bg-white">
								<thead class="bg-light">
									<tr>
										<th>작성자</th>
										<th>제목</th>
										<th>작성일</th>
										<c:if test="${ usersCode eq 1}">
											<th>삭제</th>
										</c:if>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty list }">
											<c:forEach var="tmp" items="${list }">
												<tr>
													<td>${tmp.writer }</td>
													<td><a
														href="${pageContext.request.contextPath}/qna/qnadetail?num=${tmp.num}&space_num=${param.space_num}"
														style="text-decoration: none;">${tmp.title }</a></td>
													<td>${tmp.regdate }</td>
													<c:if test="${ usersCode eq 1}">
														<td><a
															href="qnaDelete?num=${tmp.num}&cate_num=${cate_num }&space_num=${space_num}"
															onClick="deleteLink(); return false;">삭제</a></td>
													</c:if>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan='4' class="text-center">등록된 Q&A가 존재하지 않습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<%-- QnA 페이지네이션 --%>
							<nav>
								<ul class="pagination justify-content-center">
									<%--
						        	qnaStartPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
						        	&condition=${condition}&keyword=${encodedK}
						        --%>
									<c:if test="${qnaStartPageNum ne 1 }">
										<li class="page-item"><a class="page-link"
											href="detail?cate_num=${param.cate_num }&space_num=${param.space_num}&qnaPageNum=${qnaStartPageNum-1 }&condition=${condition}&keyword=${encodedK}&tab=qna">이전글</a>
										</li>
									</c:if>
									<c:forEach var="i" begin="${qnaStartPageNum }"
										end="${qnaEndPageNum }">
										<li class="page-item ${qnaPageNum eq i ? 'active' : '' }">
											<a class="page-link"
											href="detail?cate_num=${param.cate_num }&space_num=${param.space_num}&qnaPageNum=${i }&condition=${condition}&keyword=${encodedK}&tab=qna">${i }</a>
										</li>
									</c:forEach>
									<%--
						        	마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
						        --%>
									<c:if test="${qnaEndPageNum lt qnatotalPageCount }">
										<li class="page-item"><a class="page-link"
											href="detail?cate_num=${param.cate_num }&space_num=${param.space_num}&qnaPageNum=${qnaEndPageNum+1 }&condition=${condition}&keyword=${encodedK}&tab=qna">다음글</a>
										</li>
									</c:if>
								</ul>
							</nav>

							<!-- 검색 폼 -->
							<form action="detail" method="get">
								<div class="row">
									<div class="col-3">
										<select name="condition" id="condition" class="form-select">
											<option value="title_content"
												${condition eq 'title_content' ? 'selected' : '' }>제목
												+ 내용</option>
											<option value="title"
												${condition eq 'title' ? 'selected' : '' }>제목</option>
											<option value="writer"
												${condition eq 'writer' ? 'selected' : '' }>작성자</option>
										</select>
									</div>
									<div class="col-7">
										<input type="text" name="keyword" class="form-control"
											placeholder="검색어..." value="${keyword }" /> <input
											type="hidden" name="cate_num" value=${param.cate_num }>
										<input type="hidden" name="space_num"
											value=${param.space_num }>
									</div>
									<div class="col-2">
										<button type="submit" class="btn btn-outline-dark">검색</button>
									</div>
								</div>
							</form>
							<c:if test="${not empty condition }">
								<p>
									<strong>${qnatotalRow }</strong> 개의 자료가 검색 되었습니다. <a
										href="${pageContext.request.contextPath}/space/detail?cate_num=${param.cate_num}&space_num=${param.space_num}">리셋</a>
								</p>
							</c:if>
						</div>
						<div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel"
							aria-labelledby="disabled-tab" tabindex="0">...</div>
					</div>
				</div>
			</div>
			<!--예약폼-->
			<div class="col-md-4 col-lg-5 reservationForm mt-4">
				<div class="col">
					<h3 class="text-center mt-3 mb-5">Reservation Form</h3>
					<!--요금안내-->
					<div class="row">
						<div class="col-4 text-center">
							<label for="staticEmail" class="col-form-label">시간당</label>
						</div>
						<div class="col-8">
							<input class="form-control" type="text" value="1000"
								aria-label="Disabled input example" disabled readonly>
						</div>
					</div>
					<hr class="my-4">
					<form id="selectTime"
						action="${pageContext.request.contextPath}/space/reservation"
						method="POST" v-on:submit="submitBtnClicked">
						<!--예약 인원-->
						<div class="row">
							<div class="col-4 text-center mb-3">
								<label for="reserv_count" class="col-form-label">인원 선택</label>
							</div>
							<div class="col-8 ">
								<select name="reserv_count" id="reserv_count"
									v-bind:value="reserv_count_value"
									v-on:click="reservCountSelected" class="form-select"
									aria-label="Default select example">
									<option value="0">--</option>
									<option value="1">1명</option>
									<option value="2">2명</option>
									<option value="3">3명</option>
									<option value="4">4명</option>
								</select>
							</div>
						</div>
						<!--예약 날짜-->
						<div class="row">
							<div class="col-4 text-center mb-3">
								<label for="reserv_date" class="col-form-label">예약일 선택</label>
							</div>
							<div class="col-8 ">
								<%--최소: 내일부터, 최대: 2달 --%>
								<input type="date" id="reserv_date" name="reserv_date"
									class="form-control" min="${minday }" max="${maxday }"
									v-model="day" v-on:input="dayBtnClicked" />
							</div>
						</div>
						<!--시간 선택-->
						<div class="row">
							<div class="col-4 text-center">
								<div>시간 선택</div>
							</div>
							<div class="col-8">
								<div>
									<div class="row row-cols-4 row-cols-md-2 row-cols-lg-4">
										<c:forEach var="i" begin="7" end="10">
											<div class="col" style="padding: 1px;">
												<button type="button" class="btn btn-outline-dark"
													style="width: 100%;" value="${i }" id="timeBtn${i }"
													v-on:click="timeBtnClicked">${i }:00</button>
											</div>
										</c:forEach>
									</div>
									<div class="row row-cols-4 row-cols-md-2 row-cols-lg-4">
										<c:forEach var="i" begin="11" end="14">
											<div class="col" style="padding: 1px;">
												<button type="button" class="btn btn-outline-dark"
													style="width: 100%;" value="${i }" id="timeBtn${i }"
													v-on:click="timeBtnClicked">${i }:00</button>
											</div>
										</c:forEach>
									</div>
									<div class="row row-cols-4 row-cols-md-2 row-cols-lg-4">
										<c:forEach var="i" begin="15" end="18">
											<div class="col" style="padding: 1px;">
												<button type="button" class="btn btn-outline-dark"
													style="width: 100%;" value="${i }" id="timeBtn${i }"
													v-on:click="timeBtnClicked">${i }:00</button>
											</div>
										</c:forEach>
									</div>
									<div class="row row-cols-4 row-cols-md-2 row-cols-lg-4">
										<c:forEach var="i" begin="19" end="22">
											<div class="col" style="padding: 1px;">
												<button type="button" class="btn-outline-dark btn"
													style="width: 100%;" value="${i }" id="timeBtn${i }"
													v-on:click="timeBtnClicked">${i }:00</button>
											</div>
										</c:forEach>
									</div>
								</div>
								<p id="noneVisible">{{count}}{{time1}}{{time2}}</p>
								<br />
							</div>
							<br />
						</div>
						<hr class="my-4">
						<div class="row text-center">
							<div class="col-4 mt-2">예약 정보</div>
							<div class="col-8">
								<div class="accordion" id="accordionExample">
									<div class="accordion-item">
										<h2 class="accordion-header" id="headingOne">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse" data-bs-target="#collapseOne"
												aria-expanded="true" aria-controls="collapseOne">예약
												정보 상세 보기</button>
										</h2>
										<div id="collapseOne" class="accordion-collapse collapse"
											aria-labelledby="headingOne"
											data-bs-parent="#accordionExample">
											<div class="accordion-body">
												<p>
													<strong>입실 시간: </strong>{{checkInTime}}
												</p>
												<p>
													<strong>퇴실 시간: </strong>{{checkOutTime}}
												</p>
												<p>
													<strong>비용: </strong>{{totalMoney}}
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr class="my-4">
						<div class="row">
							<div class="col-4 text-center">
								<label for="reserv_comment" class="col-form-label">요청사항</label>
							</div>
							<div class="col-8">
								<textarea class="form-control" id="reserv_comment"
									name="reserv_comment" rows="3"></textarea>
							</div>
						</div>
						<hr class="my-4">
						<!--예약안내사항-->
						<p class="fw-bold ">최소 2시간부터 예약 가능합니다.</p>
						<p class="fw-bold ">최대 예약정원은 4명입니다.</p>
						<p class="fw-bold ">예약변경 및 취소는 판매자에게 문의 바랍니다.</p>
						<hr class="my-4">
						<input type="hidden" name="reserv_time" v-bind:value="timeData" />
						<input type="hidden" name="space_num"
							value="${spaceDto.space_num }" /> <input type="hidden"
							name="users_id" value="${id }" /> <input type="hidden"
							name="totalMoney" v-bind:value="totalMoney" />
						<div class="text-center">
							<button type="button" class="btn btn-outline-dark mb-2"
								v-on:click="resetBtnClicked">다시 선택하기</button>
							<button type="submit" class="btn btn-dark mb-2">예약하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp" />

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
					if((this.count*1)%2 === 1){
						this.time1 = e.target.value;
						this.time1 *= 1
						for(let i=7; i<23; i++){
							document.querySelector("#timeBtn"+i).classList.remove("active");
						}
					}
					if((this.count*1)%2 === 0){
						this.time2 = e.target.value;
						this.time2 *= 1;
						
						if(this.time1==this.time2){
							this.count=0;
							this.time1=0;
							this.time2=0;
							this.checkInTime=0;
							this.checkOutTime=0;
							alert("시간을 다시 선택해주세요.");
							return;
						} else if(this.time1>this.time2){
							this.checkInTime = this.time2;
							this.checkOutTime = this.time1;
						} else{
							this.checkInTime = this.time1;
							this.checkOutTime = this.time2;
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
									//다시 시간을 선택할 수 있도록 count, checkInTime, checkOutTime, time1, time2 리셋해주기
									this.count=0;
									this.time1=0;
									this.time2=0;
									this.checkInTime=0;
									this.checkOutTime=0;
									alert("이미 예약되어있는 시간입니다.\n시간을 다시 선택해주세요.");
									return;
								}
							}
						}

						console.log((this.checkInTime)*1);
						console.log(typeof ((this.checkInTime)*1));
						console.log((this.checkOutTime)*1);
						for(let i=((this.checkInTime)*1); i<=((this.checkOutTime)*1); i++){
							let timeBtn = "#timeBtn" + i; 
							document.querySelector(timeBtn).classList.add("active");
						}
						
						
						this.totalMoney = Math.abs(this.checkOutTime-this.checkInTime)*this.money*this.reserv_count;
						this.timeData= this.checkInTime + '-' +this.checkOutTime
					}
				},
				resetBtnClicked:function(){
					this.count=0;
					this.time1=0;
					this.time2=0;
					if(this.checkInTime!=0 &&this.checkOutTime!=0){
						for(let i=this.checkInTime; i<=this.checkOutTime; i++){
							document.querySelector("#timeBtn"+i).classList.remove("active");
						}
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
					for(let i=7; i<=22; i++){
						let timeBtn = "#timeBtn"+i;
						document.querySelector(timeBtn).classList.remove("disabled");
						document.querySelector(timeBtn).classList.remove("duplicate");
						document.querySelector(timeBtn).classList.remove("active");
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
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a606f0cedbe2671e138a677a7e0f3ff&libraries=services"></script>
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
	<script>
		//팝오버
		const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
		const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
	</script>
</body>
</html>
