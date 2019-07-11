<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />														<!--       /Layout32/css/main.css -->
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
	<div id="rightcolumn">

<%
request.setCharacterEncoding("euc-kr");
String g_code = request.getParameter("g_code");
String m_id = request.getParameter("m_id");
String g_name = request.getParameter("g_name");
String g_cate = request.getParameter("g_cate");
String g_price = request.getParameter("g_price");
String g_color = request.getParameter("g_color");
String g_size = request.getParameter("g_size");
String g_desc = request.getParameter("g_desc");
System.out.println(g_code + "<- g_code ");
System.out.println(g_name + "<- g_name ");
System.out.println(g_cate + "<- g_cate ");
System.out.println(g_price + "<- g_price ");
System.out.println(g_color + "<- g_color ");
System.out.println(g_size + "<- g_size ");
System.out.println(g_desc + "<- g_desc ");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
PreparedStatement pstmt_insert = null;
ResultSet rs_insert = null;
int gcodesum = 0;


try{
	DriverDB db = new DriverDB();
	conn = db.driverDbcon();
	System.out.println(conn + "<-- conn");

rs = pstmt.executeQuery();
if(rs.next()){
	gcodesum = rs.getInt(1)+1;
	pstmt = conn.prepareStatement
			("INSERT INTO tb_goods VALUES (?, ?, ?, ?, ?, ?, ?, now(), ?)");
	
	pstmt.setString(1, "goods_" + gcodesum);
	pstmt.setString(2, m_id);
	pstmt.setString(3, g_name);
	pstmt.setString(4, g_cate);
	pstmt.setString(5, g_price);
	pstmt.setString(6, g_color);
	pstmt.setString(7, g_size);
	pstmt.setString(8, g_desc);
	pstmt.executeUpdate();
}
} finally {
	// 6. 사용한 Statement 종료
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	
	// 7. 커넥션 종료
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
</div>



<%@ include file="/module/hadan.jsp" %>
</body>
</html>