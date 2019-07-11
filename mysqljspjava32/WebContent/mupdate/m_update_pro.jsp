<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>

<%request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="mb" class="kr.or.ksmart.dto.User"/>
<jsp:setProperty name="mb" property="*"/>
<%
Mdao md = new Mdao();
md.uUpdate(mb);
response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
%>





