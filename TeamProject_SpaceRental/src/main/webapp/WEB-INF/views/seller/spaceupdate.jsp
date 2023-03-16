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
<title>공간수정폼</title>
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
	      		</c:when>
	      	</c:choose>
      	</c:otherwise>
   	</c:choose>
   
	<div class="container text-center ">
		<div class="row">
			<div class="col-md-6">
				<h1>공간 등록</h1>
				<form action="${pageContext.request.contextPath}/seller/update" method="post" id="updateForm">
					<div>
						<label for="space_name">공간명</label><br />
		            	<input type="text" name="space_name" id="space_name" style="width: 315px" value=${dto.space_name } />
					</div>
					<div style="display:hidden">
						카테고리
						<select name="cate_name">
							<option value="${dto.cate_name }">${dto.cate_name }</option>	
						</select>
					</div>
					<div>
						<label for="oneliner">공간 한 줄 소개</label><br />
						<input type="text" name="oneliner" id="oneliner" style="width: 315px" value="${dto.oneliner }" />
					</div>
					<div>
						<label for="intro">공간 소개</label><br />
						<textarea name="intro" id="intro" cols="40" rows="10" >${dto.intro } </textarea>
					</div>
					<input type="hidden" id="mainImagePath" name="mainImagePath" />
					<div>
					<label for="addr">주소</label><br />				
						<input type="text" name="addr" id="addr" value="${dto.addr }">
						<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
					</div>
					<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>				
				    <input type="hidden" name="space_num" value="${dto.space_num }"/>
				</form>
			</div>
			
			<div class="col-md-6">
				<form action="${pageContext.request.contextPath}/seller/ajax_upload" method="post" id="ajaxForm"enctype="multipart/form-data">
				    <div>
				    	<label for="image">이미지를 다시 선택해주세요</label>
				    	<br>
				    	<input type="file" name="image" id="image" 
				    		accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
				    </div>
				</form>
		
		  		<div class="img-wrapper">
		     		<img src="${pageContext.request.contextPath}/${dto.mainImagePath }" value="${dto.mainImagePath }" />
		  		</div>
		  		<button id="submitBtn" class="btn btn-outline-secondary">저장</button>
		  	</div>
		</div>
	</div>
	
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
				//data : {mainImagePath:"/upload/xxx.jpg"} 형식의 obj
				console.log(data);
				//이미지 경로에 context Path 추가하기
				const path = "${pageContext.request.contextPath}" + data.mainImagePath;
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