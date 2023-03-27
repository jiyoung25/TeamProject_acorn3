<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<%-- vue.js, axios --%>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.js"></script>
	<style>
		.areaToggle{
			display : none;
		}
		.resetToggle{
			display : none;
		}
		#cities{
			float:left;
			list-style-type:none;
		}
		
		#search-button {
		    margin: 10px;
		}
		
		#cateimage {
			height: 350px;
		}
	</style>
<title>공간 리스트 :Ubiquitous</title>
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
		<%-- 공간명 및 이미지--%>
		<section>
			<c:choose>
        		<c:when test="${cate_num eq 1 }">
					<section>
						<div class="container px-5">
					    	<div class="row gx-5 align-items-center">
					        	<div class="col-lg-6">
					            	<div class="p-5"><img id="cateimage" class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/image/partyroom.png" alt="..."></div>
					            </div>
					            <div class="col-lg-6">
					            	<div class="p-5">
					                	<h2 class="display-4 text-center" style="font-family: 'Black Han Sans', sans-serif;">파티룸</h2>
					                    <br>
					                    <p class="text-center" style="font-family: Georgia, 'Times New Roman', Times, serif; color:grey">Good memories, Good service, Good people</p>
					                </div>
					            </div>
					        </div>
					    </div>
					</section>
				</c:when>
					   
				<c:when test="${cate_num eq 2 }">
					<section>
						<div class="container px-5">
							<div class="row gx-5 align-items-center">
						    	<div class="col-lg-6">
						        	<div class="p-5"><img id="cateimage" class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/image/practiceroom.png" alt="..."></div>
						        </div>
						        <div class="col-lg-6">
						        	<div class="p-5">
						            	<h2 class="display-4 text-center" style="font-family: 'Black Han Sans', sans-serif;">연습실</h2>
						                <br>
						            	<p class="text-center" style="font-family: Georgia, 'Times New Roman', Times, serif; color:grey">Good memories, Good service, Good people</p>
						        	</div>
						    	</div>
						    </div>
						</div>
					</section>
				</c:when>
					
				<c:when test="${cate_num eq 3 }">
					<section>
						<div class="container px-5">
							<div class="row gx-5 align-items-center">
								<div class="col-lg-6">
									<div class="p-5"><img id="cateimage" class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/image/kitchin.png" alt="..."></div>
								</div>
								<div class="col-lg-6">
									<div class="p-5">
										<h2 class="display-4 text-center" style="font-family: 'Black Han Sans', sans-serif;">공유주방</h2>
										<br>
										<p class="text-center" style="font-family: Georgia, 'Times New Roman', Times, serif; color:grey">Good memories, Good service, Good people</p>
				                    </div>
								</div>
							</div>
						</div>
					</section>
				</c:when>
				    
				<c:when test="${cate_num eq 4 }">
					<section>
						<div class="container px-5">
							<div class="row gx-5 align-items-center">
								<div class="col-lg-6">
									<div class="p-5"><img id="cateimage" class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/image/studyroom.png" alt="..."></div>
				                </div>
				                <div class="col-lg-6">
				                	<div class="p-5">
					                    <h2 class="display-4 text-center" style="font-family: 'Black Han Sans', sans-serif;">스터디룸</h2>
					                    <br>
					                    <p class="text-center" style="font-family: Georgia, 'Times New Roman', Times, serif; color:grey">Good memories, Good service, Good people</p>
				                	</div>
				                </div>
				            </div>
				        </div>
				    </section>
				</c:when>
				    
               	<c:when test="${cate_num eq 5 }">
			        <section>
			            <div class="container px-5">
			                <div class="row gx-5 align-items-center">
			                    <div class="col-lg-6">
			                        <div class="p-5"><img id="cateimage" class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/image/learningroom.png" alt="..."></div>
			                    </div>
			                    <div class="col-lg-6">
			                        <div class="p-5">
			                            <h2 class="display-4 text-center" style="font-family: 'Black Han Sans', sans-serif;">강의실</h2>
			                            <br>
			                            <p class="text-center" style="font-family: Georgia, 'Times New Roman', Times, serif; color:grey">Good memories, Good service, Good people</p>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </section>
				</c:when>
			</c:choose>
		</section>
  
		<%-- 카테고리별 내용 --%>
	    <div class="row">
	    	<%-- 지도 검색을 위한 버튼 --%>
	    	<div>
		    	<div class="col-lg-2">
					<button type="button" class="btn btn-outline-dark mb-2" onClick="location.href='${pageContext.request.contextPath}/space/navigator?cate_num=${param.cate_num }'" style="width:100%">지도로 보기</button>
		    	</div>
	    	</div>
	    	<%-- 위치 검색을 위한 toggle & checkbox --%>
	    	<div id="areaSelectForm" class="mb-3">
	    		<div class="col-lg-2">
	    			<button type="button" class="btn btn-outline-dark mb-3" v-on:click="onAreaClicked" style="width:100%; white-space: nowrap; ">지역 검색하기</button>
	    		</div>
	    		<div :class= "areaToggle ?'areaToggle' : ''">
	    			<div class="areaStyle row">
		    			<form v-on:submit.prevent="onAreaSearch()">
		    				<div style="border:2px solid black;padding:5px 20px; margin: 0 30px;">
			    				<div class="row" style="">
				    				<ul class="form-check" style="width:100%; height:100%; position:relative;list-style:none;">
				    					<li v-for="item in cities" id="cities" style="position:relative; height:100%; width:20%; float:left;"><input class="form-check-input areaCheckbox" type="checkbox" :value="item"/>{{item}}</li>
				    				</ul>
			    				</div>
			    				<div class="row">
			    					<div class="col">
			    						<button type="submit" id="search-button" class="btn btn-outline-dark">검색</button>
				    					<button type="button" v-on:click="OnareaResetBtn" class="btn btn-outline-dark" :class = "resetToggle ? 'resetToggle':''">검색 조건 리셋하기</button>
			    					</div>
			    				</div>
		    				</div>
	    				</form>
	    			</div>
	    		</div>
	    	</div>
	    </div>
	    
	    <%-- 공간 리스트 --%>
		<div class="row">
			<c:forEach var="tmp" items="${list }">
				<div class="col-lg-3 mb-5 ">
					<a class="card lift h-100" href="${pageContext.request.contextPath}/space/detail?cate_num=${cate_num}&space_num=${tmp.space_num}" style="text-decoration: none; color:black" >
				    	<img src="${pageContext.request.contextPath}${tmp.mainImagePath}"  style="height:155px;"/>
				        <div class="card-body row">
				        	<div>
				            	<h4 class="card-title mb-2 text-center">${tmp.space_name }</h4>
				             	<p class="card-text">${tmp.addr } ${tmp.addr2 }</p>
				            	<p class="card-text">${tmp.oneliner }</p>
				            </div>
						</div>
						<div class="card-footer bg-transparent border-top d-flex align-items-center justify-content-between">
							<div class="small text-primary">자세히 보기</div>
							<div class="small text-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></div>
				        </div>
				    </a>
				    <c:if test="${usersCode eq 1 }">
				    	<div>
				    		<a href="${pageContext.request.contextPath}/space/spaceDelete?space_num=${tmp.space_num }&cate_num=${cate_num }" onClick="deleteLink(); return false;">삭제</a>
				    	</div>
				    </c:if>
				</div>
			</c:forEach>
		</div>
		
		<%-- 페이지네이션 --%>
		<nav>
			<ul class="pagination justify-content-center">
				<!--
					startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
				    &condition=${condition}&keyword=${encodedK}
				-->
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
				    	<a class="page-link" href="list?cate_num=${cate_num }&pageNum=${startPageNum-1 }&condition=${condition}&keyword=${encodedK}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li class="page-item ${pageNum eq i ? 'active' : '' }">
				    	<a class="page-link" href="list?cate_num=${cate_num }&pageNum=${i }&condition=${condition}&keyword=${encodedK}">${i }</a>
				    </li>
				</c:forEach>
				<!--
					마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
				-->
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
				    	<a class="page-link" href="list?cate_num=${cate_num }&pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedK}">Next</a>
				    </li>
				</c:if>				
			</ul>
		</nav>
		
		<!-- footer include -->
	 	<jsp:include page="/WEB-INF/include/footer.jsp"/>	
		
		<!-- 검색 폼 
		<form action="list" method="get">
			<label for="condition">검색조건</label>	
			<select name="condition" id="condition">
				<option value="spaceName" ${condition eq 'spaceName' ? 'selected' : '' }>공간 이름</option>
			</select>
			<input type="text" name="keyword" placeholder="검색어..." value="${keyword }"/>
			<button type="submit">검색</button>
		</form>
		<c:if test="${not empty condition }">
			<p>
				<strong>${totalRow }</strong> 개의 자료가 검색 되었습니다.
				<a href="list">리셋</a>
			</p>
		</c:if>
		-->
	</div>
	
	<script>
		let areaSelectForm = new Vue({
			el:"#areaSelectForm",
			data:{
				areaToggle:true,
				resetToggle:true,
				cities:['서울', '경기', '인천', '강원', '충북', '충남', '대전', '전북', '전남', '광주', '경북', '경남', '대구', '부산', '울산', '제주'],
				selectedCities:[]
			},
			mounted(){
				if(${not empty param.search}){
					this.areaToggle=false;
					this.resetToggle=false;
					const searchedCities = '${param.search}';
					this.selectedCities = searchedCities.split(',');
				}
			},
			methods:{
				onAreaClicked:function(){
					this.areaToggle = !this.areaToggle;
				},
				onAreaSearch: function(){
					let checkedCites = [];
					const areaCheckboxes = document.querySelectorAll(".areaCheckbox");
					for(let i=0; i<areaCheckboxes.length; i++){
						if(areaCheckboxes[i].checked == true){
							checkedCites.push(areaCheckboxes[i].value);
						}
					}
					console.log(checkedCites.length);
					if(checkedCites.length!=0){
						location.href = '${pageContext.request.contextPath}/space/list?cate_num=${param.cate_num}&search='+checkedCites;
					}
					
				},
				OnareaResetBtn: function(){
					location.href = '${pageContext.request.contextPath}/space/list?cate_num=${param.cate_num}';
				}
				
			}
		})
	
	</script>
	<script>
   		const deleteLink = function(){
			confirm("해당 글을 삭제하시겠습니까?")?this.submit():"";
		}
	</script>
</body>
</html>