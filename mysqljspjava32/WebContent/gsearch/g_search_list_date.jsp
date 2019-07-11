<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
														<!--       /Layout32/css/main.css -->
	<style type="text/css">

		a { text-decoration:none }

	</style>
</head>

<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>

<%@ include file="/gsearch/g_search_form.jsp" %>


<br>
상품 검색 <br>
<table width="100%" border="1">
<tr>
	<td>상품명</td><td>카테고리</td><td>가격</td><td>색상</td><td>사이즈</td><td>상세설명</td><td>등록날짜</td><td>상세보기</td><td>수정</td><td>삭제</td>
</tr>

<%
	request.setCharacterEncoding("euc-kr");
	String sang = request.getParameter("sang");
	String date1 = request.getParameter("date1");
	String date2 = request.getParameter("date2");
	String price1 = request.getParameter("price1");
	String price2 = request.getParameter("price2");
	String upd = request.getParameter("upd");

	


	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt_insert = null;
	ResultSet rs_insert = null;
	DriverDB db = new DriverDB();
	conn = db.driverDbcon();
	System.out.println(conn + "<-- conn");
	
	pstmt = conn.prepareStatement("SELECT * FROM tb_goods WHERE g_name=? AND DATE_FORMAT(g_date,'%Y-%m-%d') between ? and ?" + "AND g_price*1 between ? and ?"+ "ORDER BY " + "g_price" + " " + upd);
	pstmt.setString(1, sang);	
	pstmt.setString(2, date1);
	pstmt.setString(3, date2);
	pstmt.setString(4, price1);
	pstmt.setString(5, price2);
	


	rs = pstmt.executeQuery();

	while(rs.next()){
%>
	<tr>
		<td><%= rs.getString("g_name")%></td>
		<td><%= rs.getString("g_cate")%></td>
		<td><%= rs.getString("g_price")%></td>
		<td><%= rs.getString("g_color")%></td>
		<td><%= rs.getString("g_size")%></td>
		<td><%= rs.getString("g_desc")%></td>
		<td><%= rs.getString("g_date")%></td>

	<td>
		<a href="<%='#'%>">상세보기</a>			
			
	</td>
	<td>
		<a href="<%='#'%>">수정버튼</a>			
			
	</td>
	<td>
		<a href="<%='#'%>">삭제버튼</a>			
		
	</td>
	
	</tr>
<%
	}
	rs.close();
	pstmt.close();
	conn.close();

%>

</table>
<%@ include file="/module/hadan.jsp" %>
</body>

</html>

