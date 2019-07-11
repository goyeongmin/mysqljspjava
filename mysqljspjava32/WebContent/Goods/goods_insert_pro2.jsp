<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
request.setCharacterEncoding("euc-kr");
String g_name = request.getParameter("g_name");
String g_cate = request.getParameter("g_cate");
String g_price = request.getParameter("g_price");
String g_color = request.getParameter("g_color");
String g_size = request.getParameter("g_size");
String g_desc = request.getParameter("g_desc");
System.out.println(g_name + "<- g_name ");
System.out.println(g_cate + "<- g_cate ");
System.out.println(g_price + "<- g_price ");
System.out.println(g_color + "<- g_color ");
System.out.println(g_size + "<- g_size ");
System.out.println(g_desc + "<- g_desc ");
%>