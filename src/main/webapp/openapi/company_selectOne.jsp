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
 		<td rowspan=7>
 			<div id="map" style="width:320px;height:300px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${key}"></script>
			<script>
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng( ${m.latitude} ,${m.logitude} ), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng( ${m.latitude} ,${m.logitude} ); 
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);  
			
			/*]]>*/
			</script>
 		</td></tr>
	<tr>
		<td>회사</td><td>${m.entrprsNm}</td></tr>
	<tr>
		<td>대표</td><td>${m.rprsntvNm}</td></tr>
	<tr>
		<td>주력상품</td><td>${m.mainGoods}</td></tr>
	<tr>
		<td>위치</td><td>${m.rdnmadr}</td></tr>
	<tr>
		<td>위도</td><td>${m.logitude}</td></tr>
	<tr>
		<td>경도</td><td>${m.latitude}</td></tr>	
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