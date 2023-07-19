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
	<td>번호</td>
	<td>회사</td>
	<td>대표</td>
	<td>주력상품</td>
	<td>위치</td>
	<td>위도</td>
	<td>경도</td>
 </tr>

<c:forEach items="${li}" var="m">
 <tr>
	<td>${m.idx}</td>
	<td>${m.entrprsNm}</td>
	<td>${m.rprsntvNm}</td>
	<td>${m.mainGoods}</td>	
	<td>${m.rdnmadr}</td>	
	<td>${m.logitude}</td>
	<td>${m.latitude}</td>
 </tr>
</c:forEach>
</table>

<form action="${path}/CompanySelect.do">
	<select name="ch1">
		<option value="idx"> 번호 </option>
		<option value="rdnmadr"> 위치 </option>
	</select>
	<input type="text" name="ch2">
	<input type="submit" value="검색">
</form>
</div>
<br/>
</section>
<c:import url="/include/footer.jsp" />