<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<%@ include file="/minsert/m_insert_form.jsp" %>

<br>
ȸ�� ����Ʈ <br>
<table width="100%" border="1">
<tr>
	<td>���̵�</td><td>���</td><td>����</td><td>�̸�</td><td>�̸���</td><td>����</td><td>����</td>
</tr>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Class.forName("com.mysql.jdbc.Driver");
	try{
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println(conn + "<-- conn");

		pstmt = conn.prepareStatement("select * from tb_user");
		rs = pstmt.executeQuery();
		//System.out.println(rs.next() + "<-- rs.next() m_list.jsp");
 
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
			<td>u
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

