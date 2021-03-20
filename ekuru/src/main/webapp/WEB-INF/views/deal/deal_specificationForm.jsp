<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-kuru</title>
    <link rel="shortcut icon" href="../resources/img/HatchfulExport-All/ekuru_logo.ico">
    <link rel="stylesheet" href="../resources/css/header.css">
    <link rel="stylesheet" href="../resources/css/main-footer.css">
    <link rel="stylesheet" href="../resources/css/SpecificationForm.css">
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

    <div id="container">
        <div class="base">
            <div class="row">
                <form action="/user/WriteSpec" method="post">
                <div class="head">
                
                    <div class="product-img" onclick="">
                        <img class="img-box" src="../resources/upload/file/${pic }" alt="">
                    </div>
                    
                    <div class="product-details">
                        <div class="product-title">
                            <span>Specification</span>
                        </div>
                        
                        <div class="product-spec">
                            <div class="content1">
                                <span class="span">Product Name</span>
                            </div>
                            <div class="content2">
                                <input type="text" name="productName">
                            </div>
    
                            <div class="content1">
                                <span class="span">Quantity</span>
                            </div>
                            <div class="content2">
                                <input type="number" name="productEa">
                            </div>
    
                            <div class="content1">
                                <span class="span">Seller</span>
                            </div>
                            <div class="content2">
                                <input type="text" name="chId" value="${sessionScope.userId }" readonly="readonly">
                                <%-- <span class="span">${sessionScope.userId }</span> --%>
                            </div>

                            <div class="content1">
                                <span class="span">Buyer</span>
                            </div>
                            <div class="content2">
                                <input type="text" name="userId" value="${buyerId }" readonly="readonly">
                                <%-- <span class="span">${buyerId }</span> --%>
                            </div>

                            <div class="content1">
                                <span class="span">Price</span>
                            </div>
                            <div class="content2">
                                <input type="number" name="productPrice">
                            </div>
                            

                            
                        </div>
                        <span class="span" style="margin-top: 15px; float: left;" >${user.getUserAddr() } ${user.getUserZip() }</span>
                        <input type="hidden" name="customerAddr" value="${user.getUserAddr() } ${user.getUserZip() }">
                        <input type="hidden" name="originalPic1" value="${pic }">
                        <input type="hidden" name="chatNum" value="${chatNum }">
                    </div>
                    
                </div>

                <div class="foot">
                    <div class="submit-btn-div">
                        
                        <input class="sub-btn" type="submit" value="Save">
                    </div>
                </div>
				</form>
            </div>
        </div>
    </div>

<%@ include file="/WEB-INF/views/main-footer.jsp" %>
</body>
</html>