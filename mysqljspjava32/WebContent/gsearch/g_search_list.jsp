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
String gsk = request.getParameter("gsk");
String gsv = request.getParameter("gsv");
System.out.println(gsk + "<- gsk ");
System.out.println(gsv + "<- gsv ");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
PreparedStatement pstmt_insert = null;
ResultSet rs_insert = null;
try{
	DriverDB db = new DriverDB();
	conn = db.driverDbcon();
	System.out.println(conn + "<-- conn");
	if(gsk == null & gsv == null){
		System.out.println("01 gsk sv 둘다 null 조건");
		pstmt = conn.prepareStatement("select * from tb_goods");
	}else if(gsk != null & gsv.equals("")){
		System.out.println("02 gsk null 아니고 gsv 공백 조건");
		pstmt = conn.prepareStatement("select * from tb_goods");
	}else if(gsk != null & gsv != null){
		System.out.println("03 gsk gsv 둘다 null 아닌 조건");
		pstmt = conn.prepareStatement("select * from tb_goods where "+ gsk + "=?");	
		pstmt.setString(1, gsv);
	}
	// out.println(pstmt + "<-- pstmt m_search_list.jsp");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_search_list.jsp");
	//System.out.println(rs.next() + "<-- rs.next() m_search_list.jsp");

	while(rs.next()){
%>

		


<%		
	}
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	// 6. 사용한 Statement 종료
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	
	// 7. 커넥션 종료
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>	

</table>
<%@ include file="/module/hadan.jsp" %>

</body>
</html>

