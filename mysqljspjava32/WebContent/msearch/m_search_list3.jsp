<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%@ include file="/msearch/m_search_form.jsp" %>


<br>
ȸ�� �˻� <br>
<table width="100%" border="1">
<tr>
	<td>���̵�</td><td>���</td><td>����</td><td>�̸�</td><td>�̸���</td><td>����</td><td>����</td>
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
	String jdbcDriver = "jdbc:mysql://localhost:3306/db04gym?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dbid04gym";
	String dbPass = "dbpw04gym";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	if(sk == null & sv == null){
		System.out.println("01 sk sv �Ѵ� null ����");
		pstmt = conn.prepareStatement("select * from tb_user");
	}else if(sk != null & sv.equals("")){
		System.out.println("02 sk null �ƴϰ� sv ���� ����");
		pstmt = conn.prepareStatement("select * from tb_user");
	}else if(sk != null & sv != null){
		System.out.println("03 sk sv �Ѵ� null �ƴ� ����");
		if(sk.equals("u_id")){
			pstmt = conn.prepareStatement("select * from tb_user where u_id=?");	
		}else if(sk.equals("u_level")){
			pstmt = conn.prepareStatement("select * from tb_user where u_level=?");
		}else if(sk.equals("u_name")){
			pstmt = conn.prepareStatement("select * from tb_user where u_name=?");
		}else if(sk.equals("u_email")){
			pstmt = conn.prepareStatement("select * from tb_user where u_email=?");
		}else if(sk.equals("u_phone")){
			pstmt = conn.prepareStatement("select * from tb_user where u_phone=?");
		}else if(sk.equals("u_addr")){
			pstmt = conn.prepareStatement("select * from tb_user where u_addr=?");
		}
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

