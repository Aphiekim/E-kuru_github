<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-kuru</title>
    <link rel="shortcut icon" href="../resources/img/HatchfulExport-All/ekuru_logo.ico">
    <link rel="stylesheet" href="../resources/css/PurchaseForm.css">
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    
    <script type="text/javascript">
	function removeSpecOne(){

		location.href = "/user/removeSpecOne?specNum=" + ${spec.getSpecNum()};

	}

    </script>
    
</head>
<body>
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div id="container">
        <div class="base">
            <div class="row">
            <form action="/user/purchaseOne" method="post">
                <div class="head">
                    <div class="product-img" onclick="">
                        <img class="img-box" src="../resources/upload/file/${spec.getOriginalPic1() }" alt="">
                    </div>
                    <div class="product-details">
                        <div class="product-title">
                            <span>Purchase</span>
                        </div>
                        <div class="product-spec">
                            <div class="content1">
                                <span class="span">Product Name</span>
                            </div>
                            <div class="content2">
                                <input type="text" name="productName" value="${spec.getProductName() }" readonly="readonly">
                            </div>
    
                            <div class="content1">
                                <span class="span">Quantity</span>
                            </div>
                            <div class="content2">
                                <input type="text" name="productEa" value="${spec.getProductEa() }" readonly="readonly">
                            </div>
    
                            <div class="content1">
                                <span class="span">Seller</span>
                            </div>
                            <div class="content2">
                            	<input type="text" name="chName" value="${spec.getChName() }" readonly="readonly">
                            </div>

                            <div class="content1">
                                <span class="span">Buyer</span>
                            </div>
                            <div class="content2">
                                <input type="text" name="UserId" value="${spec.getUserId() }" readonly="readonly">
                            </div>

                            <div class="content1">
                                <span class="span">Price</span>
                            </div>
                            <div class="content2">
                                <input type="text" name="productPrice" value="${spec.getProductPrice() }" readonly="readonly">
                            </div>

                            <div class="content1" style="width: 100%; text-align: center;">
                                <span class="span">Address</span>
                            </div>
                            <div class="content1" style="width: 100%; text-align: center; margin-top: 10px;">
                            	<span class="span">${spec.getCustomerAddr() }</span>
                            </div>
                            
                        </div>
                        
                    </div>
                    
                </div>

                <div class="foot">
                    <div class="submit-btn-div">
                        <input class="sub-btn" type="submit" value="Purchase">
                        <button class="sub-btn" onclick="removeSpecOne();">Cancel</button>
                    </div>
                </div>
                <input type="hidden" name="specNum" value="${spec.getSpecNum()}" >
			</form>
            </div>
        </div>
    </div>

<%@ include file="/WEB-INF/views/main-footer.jsp" %>
</body>
</html>