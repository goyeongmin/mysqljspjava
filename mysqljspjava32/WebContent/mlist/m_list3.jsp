<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%= request.getRequestURI() %> <br>
ȸ�� ����Ʈ <br>
<table width="100%" border="1">
<tr>
	<td>���̵�</td><td>���</td><td>����</td><td>�̸�</td><td>�̸���</td>
</tr>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
//JDBC ���α׷� ����
//01�ܰ� :����̹� �ε� ����
	Class.forName("com.mysql.jdbc.Driver");
//01�ܰ� :����̹� �ε� ��
	try{
//02�ܰ� :DB����(Connection)����
		String jdbcDriver = "jdbc:mysql://localhost:3306/db04gym?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "dbid04gym";
		String dbPass = "dbpw04gym";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
//02�ܰ� :DB����(Connection)��
		System.out.println(conn + "<-- conn m_list.jsp");
		if(conn != null){
			out.println("01 DB���� ����");
		}else{
			out.println("02 DB���� ����");
		}
//03�ܰ� :Query������ ���� statement �Ǵ� prepareStatement��ü���� ����
		pstmt = conn.prepareStatement("select * from tb_user");
//04�ܰ� :Query���� ����
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs m_list.jsp");
		//System.out.println(rs.next() + "<-- rs.next() m_list.jsp");
		//System.out.println(rs.next() + "<-- rs.next() m_list.jsp");
//04�ܰ� :Query���� ��
//05�ܰ� :Query������ ���
		//System.out.println(rs.next() + "<-- rs.next() m_list.jsp");
//---   select���� ���ؼ� ��� ȸ�� ��� �����ͼ� ���پ� (���ڵ�(record) or �ο�(row))�����ش� ���� 
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
			
		</tr>

<%		
/*
			out.println(rs.getString("m_id") + "<-- m_id �ʵ�=�÷� �� in tb_member���̺� <br>");
			out.println(rs.getString("m_pw") + "<-- m_pw �ʵ�=�÷� �� in tb_member���̺� <br>");
			out.println(rs.getString("m_level") + "<-- m_level �ʵ�=�÷� �� in tb_member���̺� <br>");
			out.println(rs.getString("m_name") + "<-- m_name �ʵ�=�÷� �� in tb_member���̺� <br>");
			out.println(rs.getString("m_email") + "<-- m_email �ʵ�=�÷� �� in tb_member���̺� <br><br>"); 
*/
		}
//---   select���� ���ؼ� ��� ȸ�� ��� �����ͼ� ���پ� (���ڵ�(record) or �ο�(row))�����ش� ��

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
