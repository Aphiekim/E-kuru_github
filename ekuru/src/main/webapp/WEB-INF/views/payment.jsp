<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ekuru</title>
</head>
<body>

<h2>E-kuru Point Pay</h2>

<div class="container text-center">
	<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
		
		<input type="hidden" name="cmd" value="_xclick">
		<input type="hidden" name="business" value="scit40ekuru@gmail.com">
		Item : <input type="text" name="item_name" value="Point 5000"><br />
		Code : <input type="text" name="item_number" value="ITEM0001"><br />
		Currency : <input type="text" name="currency_code" value="JPY"><br />
		Price : <input type="text" name="amount" value="5"><br />
		Encoding : <input type="text" name="charset" value="UTF-8"><br /><br />
		<input type="image" name="submit" border="0" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif" alt="PayPal - The safer, easier way to pay online">
	
	</form>
</div>



</body>

</html>

