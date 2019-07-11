<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "kr.or.ksmart.dto.User" %>
<%@ page import = "kr.or.ksmart.dao.Mdao" %>


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
회원 검색 <br>
<table width="100%" border="1">
<tr>
	<td>아이디</td><td>비번</td><td>권한</td><td>이름</td><td>이메일</td><td>연락처</td><td>주소</td><td>수정</td><td>삭제</td>
</tr>

<%
request.setCharacterEncoding("euc-kr");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<- sk ");
System.out.println(sv + "<- sv ");

Mdao dao = new Mdao();
ArrayList<User> get_alm = dao.uSearch(sk, sv);
System.out.println(get_alm + "<- get_alm");
System.out.println(get_alm.size() + "<- get_alm.size()");
for(int i=0; i<get_alm.size(); i++) {
	User u = get_alm.get(i);

%>
		<tr>
			<td><%= u.getU_id()%></td>
			<td><%= u.getU_pw()%></td>
			<td><%= u.getU_level()%></td>
			<td><%= u.getU_name()%></td>
			<td><%= u.getU_email()%></td>
			<td><%= u.getU_phone()%></td>
			<td><%= u.getU_addr()%></td>
			<td>
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%= u.getU_id()%>">수정버튼</a>			
			
			</td>
			<td>
<a href="<%= request.getContextPath() %>/mdelete/m_delete_pro.jsp?send_id=<%= u.getU_id()%>">삭제버튼</a>			
			
			</td>
			
			
		</tr>

<%		
}
%>	

</table>
<%@ include file="/module/hadan.jsp" %>
</body>
</html>

