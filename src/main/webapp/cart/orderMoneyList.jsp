<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 
<c:import url="/include/top.jsp" />
<style>
	td{
		text-align:center;
	}
</style>
<section>
<br/>
<div align="center">
<h2> 주문 목록 </h2>
<c:if test="${!empty li}">
<form method="post" name="f1">
<table border=1>
 <tr>
	<td>주문번호</td>
	<td>구매자번호</td>
	<td>배송비</td>
	<td>상품금액</td>
	<td>주문날짜</td>
 </tr>

<c:forEach items="${li}" var="o">
 <tr>
	<td><a href="${path}/OrderOne.do?orderG=${o.idx}">${o.idx}</a></td>
	<td>${o.custno}</td>
	<td>${o.baesongbi}</td>
	<td>
		<fmt:formatNumber value="${o.totalMoney}" pattern="#,###" /></td>
	<td><fmt:formatDate value="${o.getDate}" pattern="YYYY/MM/dd" /></td></td>
 </tr>
 </c:forEach>
</table>
</form>
</c:if>
<c:if test="${empty li}">
	주문 목록이 없습니다...
</c:if>
</div>
<br/>
</section>
<c:import url="/include/footer.jsp" />