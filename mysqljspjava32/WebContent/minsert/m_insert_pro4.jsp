<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<%request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="mb" class="kr.or.ksmart.dto.User"/>
<jsp:setProperty name="mb" property="*"/>

<%




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