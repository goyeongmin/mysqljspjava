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
System.out.println(rt + "<-- ���ϰ� Ȯ�� rt");

User u = new User();

if(rt == ("�α��� ����")) {   
    u = dao.uGetForSession(u_id);
    session.setAttribute("S_NAME", u.getU_name());
    session.setAttribute("S_LEVEL", u.getU_level());
    session.setAttribute("S_ID", u.getU_id());
        alert="�α��μ���";
     

} else if(rt == "��� ����ġ") {
    System.out.println("��� ����ġ");
        alert="�������ġ";
    

} else if(rt == "���̵� ����ġ") {
    System.out.println("���̵� ����ġ");
        alert="���̵� ����ġ";
     

}

%>
<script type="text/javascript">
	alert('<%= alert %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>


