<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<!-- axios import -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<title>navigator test</title>
</head>
<body>
	<!-- 지도 -->
	<div id="map" style="width: 100%; height: 350px;"></div>
	<!-- 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a606f0cedbe2671e138a677a7e0f3ff&libraries=services"></script>
	<script>
		<!-- 현재 위치 가져오기 -->
		//기본 위치 설정
		let locPosition = new kakao.maps.LatLng(37.4812845080678, 126.952713197762);
		function currentLocation() {
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
			if (navigator.geolocation) {
				// GeoLocation을 이용해서 접속 위치를 얻어옵니다
				navigator.geolocation.getCurrentPosition(function(position) {
					var lat = position.coords.latitude, // 위도
					    lon = position.coords.longitude; // 경도
					// geolocation으로 얻어온 좌표로 현재 위치를 생성합니다
					locPosition = new kakao.maps.LatLng(lat, lon); 
				});
			}
			return true
		}
		currentLocation();
	
	
		<%-- addr, space_name, mainImagePath, space_num을 담은 sellerDto List 가져오기 --%>
		let response = "";
		let spaceInfo = [];
		const getSpaceInfo = (async function(){
			response = await axios.get("${pageContext.request.contextPath}/space/marker?cate_num=${param.cate_num }");
			spaceInfo = response.data;
		
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: locPosition, // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			spaceInfo.forEach(function(arr){
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    // 마커 이미지를 생성합니다.
				var markerImage = new kakao.maps.MarkerImage('${pageContext.request.contextPath}'+arr.mainImagePath, imageSize); 
				//방 이름
				var title= arr.space_name;
				// db에 저장된 주소들로 좌표를 검색합니다
				var latlng = "";
			    geocoder.addressSearch(arr.addr , function(result, status) {
					latlng= new kakao.maps.LatLng(result[0].y, result[0].x);
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: latlng, // 마커를 표시할 위치
				        title : title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        image : markerImage, // 마커 이미지
				        clickable: true
				    });
				    
				 	// 마커를 지도에 표시합니다.
				    marker.setMap(map);
				 	
				 	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
				 	let space_num = arr.space_num;
				    var iwContent = '<div style="padding:5px;">'+title+'</div>'
				    			+'<button type="button" onClick="location.href=`${pageContext.request.contextPath}/space/detail?cate_num=${param.cate_num}&space_num='+space_num+'`">방 구경하기</button>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

				    // 인포윈도우를 생성합니다
				    var infowindow = new kakao.maps.InfoWindow({
				        content : iwContent,
				        removable : iwRemoveable
				    });

				    // 마커에 클릭이벤트를 등록합니다
				    kakao.maps.event.addListener(marker, 'click', function() {
				          // 마커 위에 인포윈도우를 표시합니다
				          infowindow.open(map, marker);  
				    });
				    
			        map.setCenter(locPosition);
				    console.log(title + markerImage + latlng);
				});
			});
		});
		getSpaceInfo();
	</script>
</body>
</html>