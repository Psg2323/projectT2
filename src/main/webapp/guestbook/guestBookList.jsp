<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<section>
<br/>
<div align="center">
<h2> 방명록 목록보기 </h2>

totalCount = ${k.totalcount}
<form method="post" name="f1">
<table border=1>
 <tr>
	<td>rownum</td>
	<td>rnum</td>
	<td>title</td>
	<td>writer</td>
	<td>date_for</td>
	
 </tr>

<c:forEach items="${li}" var="c">

 	 <tr>
	<td>${c.rownum}</td>
	<td>${c.rnum }</td>
	<td>${c.title }</td>
	<td>${c.writer }</td>
	<td><c:set var="textVal" value="${c.dateStr}"/> ${fn:substring(textVal,0,10)}</td>
	</tr></c:forEach>
</table>
</form>

</div>
<br/>
</section>
<c:import url="/include/footer.jsp" />