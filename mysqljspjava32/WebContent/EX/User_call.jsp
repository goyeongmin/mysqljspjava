<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import= "kr.or.ksmart.dto.User" %>

<%
User mb = new User();
mb.setU_id("id01");
mb.setU_pw("pw01");
mb.setU_level("������");
mb.setU_name("ȫ01");
mb.setU_email("a@");
mb.setU_phone("1111");
mb.setU_addr("a");

out.println(mb.getU_id() + " < - mb.getU_id <br/>");
out.println(mb.getU_pw() + " < - mb.getU_pw <br/>");
out.println(mb.getU_level() + " < - mb.getU_level <br/>");
out.println(mb.getU_name() + " < - mb.getU_name <br/>");
out.println(mb.getU_email() + " < - mb.getU_email <br/>");
out.println(mb.getU_phone() + " < - mb.getU_phone <br/>");
out.println(mb.getU_addr() + " < - mb.getU_addr <br/><br/>");
%>
���̵� : <%=mb.getU_id() %> <br/>
��й�ȣ : <%=mb.getU_pw() %> <br/>
���� : <%=mb.getU_level() %> <br/>
�̸� : <%=mb.getU_name() %> <br/>
�̸��� : <%=mb.getU_email() %> <br/>
����ó : <%=mb.getU_phone() %> <br/>
�ּ� : <%=mb.getU_addr() %> <br/>




