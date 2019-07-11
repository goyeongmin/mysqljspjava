<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />											
			<!--       /Layout32/css/main.css -->
</head>

<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>

	<div id="rightcolumn">
<%
	request.setCharacterEncoding("euc-kr");

%>

상품등록화면<br></br>

<form action="<%= request.getContextPath() %>/Goods/goods_insert_pro.jsp" method="post">
<!-- <input type="hidden" name="g_code"> -->
<input type="hidden" name="g_code">
<input type="hidden" name="m_id" value="<%= S_ID %>">
	상품명 : <input type="text" name="g_name"> <br>
	카테고리 : <input type="text" name="g_cate"> <br>
	가격 : <input type="text" name="g_price"> <br>
	색상 : <input type="text" name="g_color"> <br>
	사이즈 : <input type="text" name="g_size"> <br>
	상세설명 : <input type="text" name="g_desc"> <br>
	<input type="submit" value="상품등록버튼">
</form>

	</div>
	
<%@ include file="/module/hadan.jsp" %>
</body>
</html>