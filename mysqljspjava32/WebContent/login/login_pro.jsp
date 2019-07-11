<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dto.User" %>
<%@ page import = "kr.or.ksmart.dao.Mdao" %>

<%
request.setCharacterEncoding("euc-kr");
String u_id = request.getParameter("id");
String u_pw = request.getParameter("pw");
System.out.println(u_id + "<- u_id");
System.out.println(u_pw + "<- u_pw");

String alert = null;

Mdao dao = new Mdao();
String rt = dao.uLoginCheck(u_id,u_pw);
System.out.println(rt + "<-- 리턴값 확인 rt");

User u = new User();

if(rt == ("로그인 성공")) {   
    u = dao.uGetForSession(u_id);
    session.setAttribute("S_NAME", u.getU_name());
    session.setAttribute("S_LEVEL", u.getU_level());
    session.setAttribute("S_ID", u.getU_id());
        alert="로그인성공";
     

} else if(rt == "비번 불일치") {
    System.out.println("비번 불일치");
        alert="비번불일치";
    

} else if(rt == "아이디 불일치") {
    System.out.println("아이디 불일치");
        alert="아이디 불일치";
     

}

%>
<script type="text/javascript">
	alert('<%= alert %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>


