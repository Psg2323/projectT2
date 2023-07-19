<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 
<c:import url="/include/top.jsp" />
<section>
<br/>
<div align="center">
<h2> 회원 목록 </h2>
<table border=1>

 	<tr>
 		<td width=50;>번호</td><td width=150;>${m.idx}</td>
 		<td rowspan=5>
 			<div id="map" style="width:320px;height:300px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${key}&libraries=services"></script>
			<script>

 

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch("${m.addr}", function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
			        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(result[0].y, result[0].x), // 지도의 중심좌표
				        level: 5 // 지도의 확대 레벨
				    };  
					//지도 생성
					var map = new kakao.maps.Map(mapContainer, mapOption); 
			        
			        
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+"${m.csNm}"+'</div>'
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
		        
		      
			
			</script>
 		</td></tr>
	<tr>
		<td>이름</td><td>${m.csNm}</td></tr>
	<tr>
		<td>주소</td><td>${m.addr}</td></tr>
	<tr>
		<td>충전타입</td><td>${m.cpNm}</td></tr>
	<tr>
		<td>상태</td><td>${m.cpStat}</td></tr>
</table>
<form>
<table border=1 width=540;>
<tr><td>
<input type=text name=a align="left" style="border:0 solid black;" size=60> <input type=submit value="저장">
</td></tr>
</table>
</form>
</div>
</section>
<c:import url="/include/footer.jsp" />