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
	<td>회원번호</td>
	<td>회원이름</td>	
	<td>회원등급</td>
	<td>매출</td>
 </tr>

<c:forEach items="${li}" var="m">
 <tr>
	<td>${m.custno}</td>
	<td>${m.custname}</td>
	<td>
	 <c:choose>	
	   <c:when test="${m.grade eq 'A' }"> VIP  </c:when>
	   <c:when test="${m.grade eq 'B' }"> 일반인 </c:when>
	   <c:otherwise> 직원 </c:otherwise>	
	 </c:choose>	
	</td>
	<td>${m.price}</td>
 </tr>
</c:forEach>
</table>

</div>
<br/>
</section>
<c:import url="/include/footer.jsp" />