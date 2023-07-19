<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 
<c:import url="/include/top.jsp" />
<style>
	td{
		text-align:center;
	}
	#td_sales{
		text-align:left;
	}
	table{
		width:700px; height:200px;
	}
</style>
<script>
	function delK(k1){
		alert(k1+"가 삭제 되었습니다");
		location.href="${path}/CartDelete.do?cartId="+k1+"&custNo="+${m.custno};
	}
	function delA(){
		alert("전체 삭제 되었습니다.");
		location.href="${path}/CartDeleteAll.do?custNo="+${m.custno};
	}

</script>
<section>
<br/>
<div align="center">
<h2> 장바구니 </h2>
<c:if test="${!empty li}">
<form method="post" name="f1">
<table border=1>
 <tr>
	<td>장바구니ID</td>
	<td>상품ID</td>
	<td>상품이름</td>
	<td>상품가격</td>
	<td>상품개수</td>
	<td>상품이미지</td>
	<td>취소</td>
 </tr>

<c:forEach items="${li}" var="c">
<input type=hidden name=cartId value="${c.cartId}"/>
<input type=hidden name=custNo value="${m.custno}"/>
<input type=hidden name=productId value="${c.productId}"/>
<input type=hidden name=productName value="${c.productName}"/>
 	 <tr>
	<td>${c.cartId}</td>
	<td>${c.productId}</td>
	<td>${c.productName}</td>
	<td>
		<fmt:formatNumber value="${c.productPrice}" pattern="#,###" /></td>
	<td>
	  <input type=number name=amount value="${c.amount }" />
		</td>
	<td><img src="${path}/product/files/${c.productImgStr}" width=40 height=40 /></td>
 	<td align="center"><input type=button value="삭제" onclick="delK('${c.cartId}')"></td>
 </tr>
 <c:set var="total" value="${c.productPrice * c.amount}" />
 <c:set var="sales" value="${sales+total}" />
 </c:forEach>
 <tr>
	<td colspan=7 id="td_sales">
		<c:if test="${sales > 30000}">
			&emsp;배송비:0 <c:set var="baesongbi" value="0" />		
			&emsp;장바구니 금액합계: <fmt:formatNumber value="${sales}" pattern="#,###" /></c:if>
		<c:if test="${sales < 30000}">
			&emsp;배송비:3000	 <c:set var="baesongbi" value="3000" />		
			&emsp;장바구니 금액합계: <fmt:formatNumber value="${sales+3000}" pattern="#,###" /></c:if>	
	</td>
 </tr>
 <tr>
 	<td colspan=7 align="center">
 		<input type=hidden name="totalMoney" value="${sales}" />
		<input type=hidden name="baesongbi" value="${baesongbi}" />  
 		<input type=submit value="주문하기" onclick="javascript:action='${path}/CartOrder.do'"/>&emsp;
 		<input type=submit value="수정하기" onclick="javascript:action='${path}/CartUpdate.do'"/>&emsp;
 		<input type=button value="전체삭제" onclick="delA()" />
 	</td>
 </tr>
</table>
</form>

</c:if>
<c:if test="${empty li}">
	구매목록이 없습니다
</c:if>
</div>
<br/>
</section>
<c:import url="/include/footer.jsp" />