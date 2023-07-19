<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/include/top.jsp" />
<script>
	function deleteK(k){
		alert(k+" 삭제되었습니다.")
		location.href="${path}/productDelete.do?productId="+k;
	}
	function ListK(){
		location.href="${path}/productList.do";
	}
</script>
<section>
<br>
<div align=center>
<h2> 쇼핑몰 상품 상세보기(구매하기) </h2>
<form name=f1  method="post" action="${path}/CartInsert.do">
<table border=1 width=700 height=350>
<tr>
   <td align="center">상품이름</td>  
   <td>   
	   <input type=hidden name=productId value="${k.productId}"  />
	   <input type=hidden name=custno value="${m.custno}"  />
	   <input type=hidden name=custNo value="${m.custno}"  />	
	   <input type=hidden name=productImgStr value="${k.productImgStr}"  />		   
	   &emsp;<input type=text name=productName value="${k.productName}"   /> </td>
    <td rowspan=3 align="center">
      <img src="${path}/product/files/${k.productImgStr}" width=200  height=250  />
    </td></tr> 
<tr>
	<td align="center">상품가격</td>  
    <td>&emsp;<input type=text name=productPrice  value="${k.productPrice}"    /> </td></tr>
<tr>
	<td align="center">상품설명</td>  
    <td align="center" ><textarea cols=40  rows=9 name=productDesc >${k.productDesc}</textarea> 
    </td></tr>
<tr>
	<td align="center">구매수량</td>  
    <td colspan=2>&emsp; 
    <select name=amount>
      <c:forEach begin="1"  end="20"  var="i">
      <option value=${i}> ${i}개  </option>
      </c:forEach>
    </select>
    </td></tr>
<tr> 
    <td colspan=3 align="center"  >
    <input type=submit value="구매하기">&emsp;
    <input type=button value="삭제하기" onclick="deleteK('${k.productId}')"/>&emsp;
    <input type=button value="목록보기" onclick="ListK()">
    </td></tr>
</table>
</form>
</div>
<br>

</section>
<c:import url="/include/footer.jsp" />