<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">

a { text-decoration:none }

</style>

<form action="<%=request.getContextPath()%>/gsearch/g_search_list_date.jsp" method="post">
	<B>��ǰ�� �˻�: </B>
	<input type="text" name="sang">
	<br>
	</br>
	<B>���ݺ� �˻�: </B>
	<input type="number" name="price1" min="10" max="100000"> ~ <input type="number" name="price2" min="10" max="100000">
	<br>
	</br>
	<B>�Ⱓ�� �˻�: </B>
	<input type="date" name="date1"> ~ <input type="date" name="date2">
	<br>
	</br>
	<B>���Ǻ� �˻�: </B>
	<input type="radio" name="upd" value="" checked="checked">���þ��� <input type="radio" name="upd" value="ASC">���� ���ݼ� <input type="radio" name="upd" value="DESC">���� ���ݼ�<br></br>
	<input type="submit" value="�˻���ư">
</form>

