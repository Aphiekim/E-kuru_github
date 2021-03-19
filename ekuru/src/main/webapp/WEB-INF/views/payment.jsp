<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ekuru</title>
<link rel="shortcut icon" href="../resources/img/HatchfulExport-All/ekuru_logo.ico">
</head>
<script type="text/javascript">
function useId(id){
	opener.document.getElementById("id").value = id;
	this.close();
}
</script>
<body>

<h2>E-kuru Point Pay</h2>

<c:if test="${vo.getUserType() eq '1' }">
<div class="container text-center">
	<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
		<input type="hidden" name="cmd" value="_xclick">
		<input type="hidden" name="business" value="ekuruco@gmail.com">
		<input type="url" name="return" value="http://localhost:8888/payment/payinsert?pointProdNum=${pvo.getPointProdNum() }" size="50" hidden=""/><br />
		Item : <input type="text" name="item_name" value="${pvo.getPointProdName() }" readonly="readonly"><br/>
		Code : <input type="text" name="item_number" value="${pvo.getPointProdName() }" readonly="readonly"><br />
		Currency : <input type="text" name="currency_code" value="JPY" readonly="readonly"><br />
		Price : <input type="text" name="amount" value="${pvo.getPriceYen() }"><br />
		Encoding : <input type="text" name="charset" value="UTF-8" readonly="readonly"><br /><br />
		<input type="image" name="submit" border="0" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif" alt="PayPal - The safer, easier way to pay online">
	</form>
</div>
</c:if>
<c:if test="${vo.getUserType() ne '1' }">
<div class="container text-center">
	<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
		<input type="hidden" name="cmd" value="_xclick">
		<input type="hidden" name="business" value="ekuruco@gmail.com">
		<input type="url" name="return" value="http://localhost:8888/payment/payinsert?pointProdNum=${pvo.getPointProdNum() }" size="50" hidden=""/><br />
		Item : <input type="text" name="item_name" value="${pvo.getPointProdName() }" readonly="readonly"><br/>
		Code : <input type="text" name="item_number" value="${pvo.getPointProdName() }" readonly="readonly"><br />
		Currency : <input type="text" name="currency_code" value="USD" readonly="readonly"><br />
		Price : <input type="text" name="amount" value="${pvo.getPriceWon() }"><br />
		Encoding : <input type="text" name="charset" value="UTF-8" readonly="readonly"><br /><br />
		<input type="image" name="submit" border="0" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif" alt="PayPal - The safer, easier way to pay online">
	</form>
</div>
</c:if>



</body>

</html>

