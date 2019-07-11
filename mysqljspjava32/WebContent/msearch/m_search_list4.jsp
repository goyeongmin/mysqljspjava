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

<%@ include file="/msearch/m_search_form.jsp" %>


<br>
ȸ�� �˻� <br>
<table width="100%" border="1">
<tr>
	<td>���̵�</td><td>���</td><td>����</td><td>�̸�</td><td>�̸���</td><td>����ó</td><td>�ּ�</td><td>����</td><td>����</td>
</tr>

<%
request.setCharacterEncoding("euc-kr");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<- sk ");
System.out.println(sv + "<- sv ");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
try{
	DriverDB db = new DriverDB();
	conn = db.driverDbcon();
	System.out.println(conn + "<-- conn");
	if(sk == null & sv == null){
		System.out.println("01 sk sv �Ѵ� null ����");
		pstmt = conn.prepareStatement("select * from tb_user");
	}else if(sk != null & sv.equals("")){
		System.out.println("02 sk null �ƴϰ� sv ���� ����");
		pstmt = conn.prepareStatement("select * from tb_user");
	}else if(sk != null & sv != null){
		System.out.println("03 sk sv �Ѵ� null �ƴ� ����");
		pstmt = conn.prepareStatement("select * from tb_user where "+ sk + "=?");	
		pstmt.setString(1, sv);
	}
	out.println(pstmt + "<-- pstmt m_search_list.jsp");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_search_list.jsp");
	//System.out.println(rs.next() + "<-- rs.next() m_search_list.jsp");

	while(rs.next()){
%>
	<tr>
		<td><%= rs.getString("u_id")%></td>
		<td><%= rs.getString("u_pw")%></td>
		<td><%= rs.getString("u_level")%></td>
		<td><%= rs.getString("u_name")%></td>
		<td><%= rs.getString("u_email")%></td>
		<td><%= rs.getString("u_phone")%></td>
		<td><%= rs.getString("u_addr")%></td>
			<td>
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%= rs.getString("u_id")%>">������ư</a>			
			
			</td>
			<td>
<a href="<%= request.getContextPath() %>/mdelete/m_delete_pro.jsp?send_id=<%= rs.getString("u_id")%>">������ư</a>			
		
		</td>
		
		
	</tr>

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

