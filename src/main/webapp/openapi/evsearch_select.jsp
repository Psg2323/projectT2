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
	<td>이름</td>
	<td>주소</td>
	<td>충전타입</td>
	<td>상태</td>
 </tr>

<c:forEach items="${li}" var="m">
 <tr>
	<td>${m.idx}</td>
	<td>${m.csNm}</td>
	<td>${m.addr}</td>
	<td>${m.cpNm}</td>
	<td>${m.cpStat}</td>
 </tr>
</c:forEach>
</table>

</div>
<br/>
</section>
<c:import url="/include/footer.jsp" />