<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">

a { text-decoration:none }

</style>

<form action="<%=request.getContextPath()%>/gsearch/g_search_list_date.jsp" method="post">
	<B>상품명 검색: </B>
	<input type="text" name="sang">
	<br>
	</br>
	<B>가격별 검색: </B>
	<input type="number" name="price1" min="10" max="100000"> ~ <input type="number" name="price2" min="10" max="100000">
	<br>
	</br>
	<B>기간별 검색: </B>
	<input type="date" name="date1"> ~ <input type="date" name="date2">
	<br>
	</br>
	<B>조건별 검색: </B>
	<input type="radio" name="upd" value="" checked="checked">선택안함 <input type="radio" name="upd" value="ASC">낮은 가격순 <input type="radio" name="upd" value="DESC">높은 가격순<br></br>
	<input type="submit" value="검색버튼">
</form>

