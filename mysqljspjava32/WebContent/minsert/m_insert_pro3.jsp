<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<%@ page import= "kr.or.ksmart.dto.User" %>
<%
request.setCharacterEncoding("euc-kr");

String u_id = request.getParameter("u_id");
String u_pw = request.getParameter("u_pw");
String u_level = request.getParameter("u_level");
String u_name = request.getParameter("u_name");
String u_email = request.getParameter("u_email");
String u_phone = request.getParameter("u_phone");
String u_addr = request.getParameter("u_addr");
User mb = new User();
mb.setU_id(u_id);
mb.setU_pw(u_pw);
mb.setU_level(u_level);
mb.setU_name(u_name);
mb.setU_email(u_email);
mb.setU_phone(u_phone);
mb.setU_addr(u_addr);

System.out.println(u_id + "<- u_id");
System.out.println(u_pw + "<- u_pw");
System.out.println(u_level + "<- u_level");
System.out.println(u_name + "<- u_name");
System.out.println(u_email + "<- u_email");
System.out.println(u_phone + "<- u_phone");
System.out.println(u_addr + "<- u_addr");

Connection conn = null;
PreparedStatement pstmt = null;


DriverDB db = new DriverDB();
conn = db.driverDbcon();
System.out.println(conn + "<-- conn");

pstmt = conn.prepareStatement(
		"insert into tb_user values(?,?,?,?,?,?,?)");
System.out.println(pstmt + "<-- pstmt 1");

pstmt.setString(1, mb.getU_id());
pstmt.setString(2, mb.getU_pw());
pstmt.setString(3, mb.getU_level());
System.out.println(pstmt + "<-- pstmt 2");
pstmt.setString(4, mb.getU_name());
pstmt.setString(5, mb.getU_email());
pstmt.setString(6, mb.getU_phone());
pstmt.setString(7, mb.getU_addr());
System.out.println(pstmt + "<-- pstmt 3");
//04 insert Query 문장 준비 완료

int result = pstmt.executeUpdate();
	System.out.println(result + "<-- result");
	pstmt.close();
	conn.close();
	
	// response.sendRedirect(request.getContextPath() + "/mlist/m_list.jsp");
	response.sendRedirect(request.getContextPath() + "/msearch/m_search_list.jsp");
%>