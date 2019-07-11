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
		"UPDATE tb_user SET u_pw=?,u_level=?,u_name=?,u_email=?,u_phone=?,u_addr=?WHERE u_id=?");
pstmt.setString(1, mb.getU_pw());
pstmt.setString(2, mb.getU_level());
pstmt.setString(3, mb.getU_name());
pstmt.setString(4, mb.getU_email());
pstmt.setString(5, mb.getU_phone());
pstmt.setString(6, mb.getU_addr());
pstmt.setString(7, mb.getU_id());


int result = pstmt.executeUpdate();
System.out.println(result + "<-- result");

pstmt.close();
conn.close();
response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
//response.sendRedirect(request.getContextPath()+"/mlist/m_list.jsp");

%>





