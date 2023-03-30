<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
<title>공간 정보 수정 :Ubiquitous</title>
<style>

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
   	<section class="v-100" style="background-color: #eee;">
	  	<div class="container h-100">
	    	<div class="row row-cols-lg-6 h-100">
	      		<div class="col-lg-6"><br/>
	        		<div class="card text-black" style="border-radius: 25px;">
	          			<div class="card-body p-md-6">
	            			<div class="d-flex flex-row justify-content-center">
	              				<div class="col-md-12">
									<div class="container text-center">
										<div class="row">
											<div class="col-md-12">
												<h1>공간 수정</h1>
												<form action="${pageContext.request.contextPath}/seller/update" method="post" id="updateForm">
													<div>
														<label for="space_name">공간명</label><br />
										            	<input class="form-control" type="text" name="space_name" id="space_name" style="margin-left:auto;margin-right:auto;width: 320px" value='${dto.space_name }' />
													</div>
													<div style="display:hidden">
														카테고리
														<select class="form-select" name="cate_name" style="margin-left:auto;margin-right:auto;width: 320px">
															<option value="${dto.cate_name }">${dto.cate_name }</option>	
														</select>
													</div>
													<div>
														<label for="oneliner">공간 한 줄 소개</label><br />
														<input class="form-control" type="text" name="oneliner" id="oneliner" style="margin-left:auto;margin-right:auto;width: 320px" value="${dto.oneliner }" />
													</div>
													<div>
														<label for="intro">공간 소개</label><br />
														<textarea class="form-control" name="intro" id="intro" cols="40" rows="10" style="margin-left:auto;margin-right:auto;width: 320px">${dto.intro } </textarea>
													</div>
													<input type="hidden" id="mainImagePath" name="mainImagePath" />
													<div>
													<label for="addr">주소</label><br />				
														<input class="form-control" type="text" name="addr" id="addr" value="${dto.addr }" readonly style="margin-left:auto;margin-right:auto;width: 320px">
														<div class="input-group" style="margin-left:auto;margin-right:auto;width: 320px">
															<input class="form-control" type="text" name="addr2" id="addr2" value="${dto.addr2 }" aria-describedby="button-addon2">
															<button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="sample5_execDaumPostcode()">주소 검색</button>
														</div>
													</div>
													<div id="map" style="margin-left:auto;margin-right:auto;width:320px;height:320px;margin-top:10px;display:none"></div>				
												    <input type="hidden" name="space_num" value="${dto.space_num }"/>
												</form>
											</div>
										</div>
		         					</div>
	           					</div>
	         				</div>
	       				</div>
	     			</div>
	   			</div>
		   		<div class="col-lg-6"><br/>
	        		<div class="card text-black" style="border-radius: 25px;">
	          			<div class="card-body p-md-6">
	            			<div class="d-flex flex-row justify-content-center">
	              				<div class="col-md-12">			
									<div class="col-md-12">
										<form action="${pageContext.request.contextPath}/seller/ajax_upload" method="post" id="ajaxForm"enctype="multipart/form-data">
						    				<div class="text-center"><br><br>
										    	<label class="form-label" for="image">이미지를 다시 선택해주세요</label>
										    	<br>
										    	<input class="form-control" type="file" name="image" id="image"
										    		accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
										    </div>
										</form>
								  		<div class="img-wrapper">
								  		<br/>
								     		<img class="img-fluid" src="${pageContext.request.contextPath}${dto.mainImagePath }" value="${dto.mainImagePath }" />
								  		</div>
								  		<br/>
				  						<button id="submitBtn" class="btn btn-outline-secondary">저장</button>
				  					</div>
				  				</div>
							</div>
	          			</div>
            		</div>
          		</div>
        	</div><br/>
	  	</div>
	</section>
	   <!-- footer include -->
	  <jsp:include page="/WEB-INF/include/footer.jsp"/>
	  
	<script src="${pageContext.request.contextPath}/js/gura_util.js"></script>
	<script>
		//이미지를 선택했을 때, 실행할 함수 등록
		document.querySelector("#image").addEventListener("change", function(){
			//id 가 ajaxForm 인 form 을 ajax 전송 시킨다.
			const form = document.querySelector("#ajaxForm");
			//util 함수를 이용해서 ajax 전송
			ajaxFormPromise(form)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				//data : {mainImagePath:"xxx.jpg"} 형식의 obj
				console.log(data);
				//이미지 경로에 context Path 추가하기
				const path = "${pageContext.request.contextPath}/" + data.mainImagePath;
				//img 태그에 경로 추가
				document.querySelector(".img-wrapper img").setAttribute("src", path);
				//위의 form 의 input hidden 요소에 value 로 넣어서 db 에 저장
				document.querySelector("#mainImagePath").value = data.mainImagePath;
			});
		});		


		document.querySelector("#submitBtn").addEventListener("click", function(){
			document.querySelector("#updateForm").submit();
		});
	</script>
	
	
	<!-- 지도 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a606f0cedbe2671e138a677a7e0f3ff&libraries=services"></script>
	<script>
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };
	
	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("addr").value = addr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; //첫번째 결과의 값을 활용
	
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
	</script>

</body>
</html>