<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "kr.or.ksmart.dto.User" %>

<jsp:useBean id="mb" class="kr.or.ksmart.dto.User"/>
<jsp:setProperty name="mb" property="*"/>
<%request.setCharacterEncoding("euc-kr");%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%= request.getContextPath() %>/css/main.css" />
<!--       /Layout32/css/main.css -->
</head>

<body>
	<%@ include file="/module/top.jsp"%>
	<%@ include file="/module/left.jsp"%>

	<%
	DriverDB db = new DriverDB();
	Connection conn = db.driverDbcon();
	System.out.println(conn + "<-- conn");

	Mdao md = new Mdao();
	User u = md.uSelectforUpdate(request.getParameter("send_id"));

	String send_id = request.getParameter("send_id");
	System.out.println(send_id + "<- send_id");

	String dbid = u.getU_id();
	String dbpw = u.getU_pw();
	String dblevel = u.getU_level();
	String dbname = u.getU_name();
	String dbemail = u.getU_email();
	String dbphone = u.getU_phone();
	String dbaddr = u.getU_addr();
%>

	<form action="<%=request.getContextPath()%>/mupdate/m_update_pro.jsp"
		method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="u_id" size="20"
					value="<%=dbid%>" readonly></td>
			<tr>
			<tr>
				<td>암호</td>
				<td><input type="text" name="u_pw" size="20"
					value="<%=dbpw%>"></td>
			<tr>
			<tr>
				<td>권한</td>
				<td><input type="text" name="u_level" size="20"
					value="<%=dblevel%>"></td>
			<tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="u_name" size="20"
					value="<%=dbname%>"></td>
			<tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="u_email" size="20"
					value="<%=dbemail%>"></td>
			<tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="u_phone" size="20"
					value="<%=dbphone%>"></td>
			<tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="u_addr" size="20"
					value="<%=dbaddr%>"></td>
			<tr>
			<tr>
				<td colspan="4"><input type="submit" value="회원수정버튼"></td>
			</tr>
		</table>
	</form>

	<%@ include file="/module/hadan.jsp"%>
</body>
</html>






