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
<h2> 주문서 상세보기 </h2>
<c:if test="${!empty li}">
<form method="post" name="f1">
<table border=1 width="500">
<c:forEach items="${li}" var="z">
<c:set var="orderG" value="${z.orderG }" />
<c:set var="phone" value="${z.phone }" />
<c:set var="custno" value="${z.custNo }" />
<c:set var="custName" value="${z.custName }" />
<c:set var="address" value="${z.address }" />
<c:set var="pstcode" value="${z.pstcode }" />
<c:set var="detailaddress" value="${z.detailaddress }" />
<c:set var="baesongbi" value="${z.baesongbi }" />
<c:set var="totalMoney" value="${z.totalMoney }" />
</c:forEach>
 <tr>
 	<td>주문 그룹번호</td>
 	<td colspan=3>${orderG}</td>
 	</tr>
 <tr>
 	<td rowspan=4>주문자<br>정보</td>
 	<td>고객번호</td>
 	<td colspan=2>${custno}</td></tr>
 <tr>
 	<td>이름</td>
 	<td colspan=2>${custName}</td></tr>
 <tr>
 	<td>연락처</td>
 	<td colspan=2>${phone}</td></tr>
 <tr>
 	<td>주소</td>
 	<td colspan=2>${address}</td></tr>	
 		
 <tr><td colspan=4> 주문서 </td></tr>	
 <tr>	 
 	<td>주문번호</td>
 	<td>상품명</td>
 	<td>수량</td>
 	<td>주문날짜</td></tr>
<c:forEach items="${li}" var="z">
 <tr>
 	<td>${z.idx}</td>
 	<td>${z.productName}</td>
 	<td>${z.amount}</td>
	<td><fmt:formatDate value="${z.getDate}" pattern="YYYY/MM/dd" /></td>
 </tr>
</c:forEach>
</table>
</form>
</c:if>
<hr>
배송비 + 상품 총 금액 = ${baesongbi} + ${totalMoney} = ${baesongbi + totalMoney}

</div>
<br/><br/><br/>
</section>
<c:import url="/include/footer.jsp" />