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
��ǰ �˻� <br>
<table width="100%" border="1">
<tr>
	<td>��ǰ��</td><td>ī�װ�</td><td>����</td><td>����</td><td>������</td><td>�󼼼���</td><td>��ϳ�¥</td><td>�󼼺���</td><td>����</td><td>����</td>
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
		System.out.println("01 gsk sv �Ѵ� null ����");
		pstmt = conn.prepareStatement("select * from tb_goods");
	}else if(gsk != null & gsv.equals("")){
		System.out.println("02 gsk null �ƴϰ� gsv ���� ����");
		pstmt = conn.prepareStatement("select * from tb_goods");
	}else if(gsk != null & gsv != null){
		System.out.println("03 gsk gsv �Ѵ� null �ƴ� ����");
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
	// 6. ����� Statement ����
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	
	// 7. Ŀ�ؼ� ����
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>	

</table>
<%@ include file="/module/hadan.jsp" %>

</body>
</html>

