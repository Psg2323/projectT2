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
	<td>회원번호</td>
	<td>회원주소</td>
	<td>가입날짜</td>
	<td>회원등급</td>
	<td>도시</td>
 </tr>

<c:forEach items="${li}" var="m">
 <tr>
	<td>${m.custno}</td>
	<td><a href="${path}/ShopEdit.do?custno=${m.custno}">
				 ${m.custname}</a></td>
	<td>${m.phone}</td>
	<td>${m.address}</td>
	
	<td>
	<fmt:parseDate value="${m.joindate}" var="registered" pattern="yyyy-MM-dd" />
	<fmt:formatDate value="${registered}" pattern="yyyy년 MM월 dd일"/>
	</td>
	
	<td>
	 <c:choose>	
	   <c:when test="${m.grade eq 'A' }"> VIP  </c:when>
	   <c:when test="${m.grade eq 'B' }"> 일반인 </c:when>
	   <c:otherwise> 직원 </c:otherwise>	
	 </c:choose>	
	</td>

	<td>${m.city}</td>
 </tr>
</c:forEach>
</table>
<form action="${path}/ShopSelectAll.do">
	<select name="ch1">
		<option value="custno"> 회원번호 </option>
		<option value="custname"> 회원이름 </option>
	</select>
	<input type="text" name="ch2">
	<input type="submit" value="검색">
</form>
</div>
<br/>
</section>
<c:import url="/include/footer.jsp" />