<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<%
request.setCharacterEncoding("euc-kr");
String u_id = request.getParameter("id");
String u_pw = request.getParameter("pw");
System.out.println(u_id + "<- u_id");
System.out.println(u_pw + "<- u_pw");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


String dbid= null;
String dbpw= null;
String dbname= null;
String dblevel= null;	//�ְ������ �Ǵ� ������ �Ǵ� �Ǹ��� �Ǵ� ������ (���Ѻ��� �� �׽�Ʈ)
String alert = null;


try{

	DriverDB db = new DriverDB();
	conn = db.driverDbcon();
	System.out.println(conn + "<-- conn");
	
	pstmt = conn.prepareStatement("select u_id,u_pw,u_level,u_name from tb_user where u_id=?");
	pstmt.setString(1, u_id);
	rs = pstmt.executeQuery();

	
	if(rs.next()){
		dbid = rs.getString("u_id");
		dbpw = rs.getString("u_pw");
		dblevel = rs.getString("u_level");
		dbname = rs.getString("u_name");
		
		if(u_pw.equals(dbpw)){
			session.setAttribute("S_ID",dbid);
			session.setAttribute("S_NAME",dbname);
			session.setAttribute("S_LEVEL", dblevel);
			alert="�α��μ���";
		}else{
			alert="��� ����ġ";
		}
		}else{
			alert="���̵� ����ġ";
		}
			
//response.sendRedirect(request.getContextPath()+"/index.jsp");
%>
<%	} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {

	
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
} %>
<script type="text/javascript">
	alert('<%= alert %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>


