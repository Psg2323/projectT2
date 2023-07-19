<%@ page language="java"  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
 
 <c:set var="path" value="${pageContext.request.contextPath}" 
 		scope="session"/>
 <c:set var="key" value="42d66efb0d933f58b88f200dc5569877" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마주스토리/마주이야기</title>
<link href="${path}/include/top.css" rel="stylesheet" type="text/css"  />
<style type="text/css">

</style>

</head>
<body>

<header>
 <b> 마주스토리 / 마주이야기 쇼핑몰 </b>
</header>
<nav>
&emsp;<a href="${path}/ShopForm.do">회원등록</a>
&emsp;<a href="${path}/ShopSelectAll.do">회원목록</a>
&emsp;<a href="${path}/ShopSales.do">회원매출조회</a>

<c:if test="${not empty user }">
&emsp;<a href="${path}/CompanySelect.do">Company목록</a>
&emsp;<a href="${path}/EvSelect.do">전기차충전소</a>
&emsp;<a href="${path}/EvSelectMap.do">전기차충전소지도</a>
&emsp;<a href="${path}/CompanySelectMap.do">Company지도</a>
</c:if>

&emsp;<a href="${path}/product/productForm.jsp">상품등록</a>
&emsp;<a href="${path}/productList.do">상품목록</a>
&emsp;<a href="${path}/GuestBookInsert.do">방명록 추가</a>
&emsp;<a href="${path}/GuestBookList.do">방명록 보기</a>
<c:if test="${empty m.custno}">
&emsp;<a href="${path}/login/login.jsp">로그인</a>
</c:if>
<c:if test="${! empty m.custno}">
&emsp;<a href="${path}/logout.do?custno=${m.custno}">${m.custname}님</a>
&emsp;<a href="${path}/CartList.do?custNo=${m.custno}">내 장바구니</a>
&emsp;<a href="${path}/MoneyList.do">주문 목록</a>
</c:if>
&emsp;&emsp;<a href="${path}/index.jsp">홈으로.</a>
</nav>
