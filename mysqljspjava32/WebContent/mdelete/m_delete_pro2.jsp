<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>

<%
String send_id=request.getParameter("send_id");
System.out.println(send_id + "<- send_id");
Connection conn = null;
PreparedStatement pstmt = null;
DriverDB db = new DriverDB();
conn = db.driverDbcon();
System.out.println(conn + "<-- conn");
pstmt = conn.prepareStatement(
		"DELETE FROM tb_user WHERE u_id=?");
pstmt.setString(1, send_id);
pstmt.executeUpdate();
pstmt.close(); 
conn.close();
response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
//response.sendRedirect(request.getContextPath()+"/mlist/m_list.jsp");
%>