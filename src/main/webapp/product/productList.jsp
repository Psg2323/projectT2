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
<h2> 회원 목록 </h2>
<table border=1>
 <tr>
	<td>상품번호</td>
	<td>상품이름</td>
	<td>상품가격</td>
	<td>상품이미지</td>
	<td>날짜</td>
 </tr>

<c:forEach items="${li}" var="m">
 <tr>
	<td> ${m.productId}  </td>
	<td> <a href="${path}/productOne.do?productId=${m.productId}">
	${m.productName} </a></td>
	<td> ${m.productPrice}  </td>
	<td align="center"><img src="${path}/product/files/${m.productImgStr}" width=40 height=40/></td>
	<td>${m.productDate}</td>
 </tr>
</c:forEach>
</table>
<hr/>
<form action="${path}/productList.do">
	<select name="ch1">
		<option value="productName"> 상품이름 </option>
		<option value="productId"> 상품번호 </option>
	</select>
	<input type="text" name="ch2">
	<input type="submit" value="검색">
</form>
</div>
<br/>
</section>
<c:import url="/include/footer.jsp" />