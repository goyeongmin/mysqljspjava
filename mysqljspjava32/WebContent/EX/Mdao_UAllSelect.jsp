<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "kr.or.ksmart.dto.User" %>
<%@ page import = "kr.or.ksmart.dao.Mdao" %>

<%
Mdao dao = new Mdao();
ArrayList<User> get_alm = dao.uAllSelect();
System.out.println(get_alm + "<- get_alm");
System.out.println(get_alm.size() + "<- get_alm.size()");
for(int i=0; i<get_alm.size(); i++) {
	User u = get_alm.get(i);
	out.println(u.getU_id()+ "<- u.getU_id()    <br>");
}
%>