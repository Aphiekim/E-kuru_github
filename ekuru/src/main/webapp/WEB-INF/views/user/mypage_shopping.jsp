<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-kuru</title>
    <link rel="shortcut icon" href="../resources/img/HatchfulExport-All/ekuru_logo.ico">
    <link rel="stylesheet" href="../resources/css/mypage-shopping.css">
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


</head>
<body>
<!--전체 틀-->
<div class="fullSize">
    <%@ include file="/WEB-INF/views/header.jsp" %>
<!-- 중간 전체 틀 -->
    <div class="mainSize">
        <div class="text-center" style="padding-top: 7%;"></div>

        <!--버튼-->
        <div class="buttons">
			<div class="row">
				<div class="col">
					<button type="button" class="btn btn-secondary" onclick="location.href='/user/viewedItems'">Browsing history</button>&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-warning" onclick="location.href='/user/mypage_dealHistory'">Buying history</button>
				</div>
			</div>
		</div>

        <div>
            <h2 class="page-section-heading text-center text-secondary">
                <strong>My Cart</h2>
        </div>

	<%-- 
        <div class=shopping-list>
            <hr class="line">
            <h3>CHANNEL</h3>
            <hr class="line">
            <div style="padding-bottom: 10px;">
                <img class="shopping-minus" src="../resources/img/shopping-minus.png">
                <img class="shopping-img" src="../resources/img/shopping-food.jpg">
                <span style="padding-right: 50px; padding-left: 50px;margin-left: 30px;">TITLE</span>
                <span style="padding-right: 50px; margin-left: 30px;">23,000P</span>
                <input type="number" style="max-width: 40px; margin-left: 30px;"> 개
                <input class="shopping-checkbox" type="checkbox">
            </div>
        
            <div style="padding-bottom: 10px;">
                <img class="shopping-minus" src="../resources/img/shopping-minus.png">
                <img class="shopping-img" src="../resources/img/shopping-food.jpg">
                <span style="padding-right: 50px; padding-left: 50px;margin-left: 30px;">TITLE</span>
                <span style="padding-right: 50px; margin-left: 30px;">23,000P</span>
                <input type="number" style="max-width: 40px; margin-left: 30px;"> 개
                <input class="shopping-checkbox" type="checkbox">
            </div>
        
            <div style="text-align: center; margin-right: 70px;">
                <button type="button" class="btn btn-info">요청</button>
            </div>
        </div>
	--%>
		
		<%-- foreach문 안에 foreach문 예상  --%>
		<c:forEach items="${cart }" var="list" varStatus="status">
		
		<div class=shopping-list>
			
            <hr class="line">
            <h3>${list.CHNAME }</h3>
            <hr class="line">
            <div style="padding-bottom: 10px;">
                <a href="/user/removeCart?cartProdNum=${list.CARTPRODNUM }"><img class="shopping-minus" src="../resources/img/shopping-minus.png"></a>
                <img class="shopping-img" src="../resources/upload/file/${list.PRODORIGINALPIC1 }">
                <span style="padding-right: 50px; padding-left: 50px;margin-left: 30px;">${list.PRODTITLE }</span>
                <span style="padding-right: 50px; margin-left: 30px;">${list.PRODPRICE }P</span>
                <input type="number" style="max-width: 100px; margin-left: 30px;" value="${list.CARTPRODEA }"> EA
                <!-- <input class="shopping-checkbox" type="checkbox">  -->
            </div>
        
			<form action="/user/CartProdOne" method="POST">	
            <div style="text-align: center; margin-right: 70px;">
            	<input type="hidden" name="productName" value="${list.PRODTITLE }">
            	<input type="hidden" name="chId" value="${list.CHID }">
            	<input type="hidden" name="productEa" value="${list.CARTPRODEA }">
            	<input type="hidden" name="productPrice" value="${list.PRODPRICE }">
            	<input type="hidden" name="userId" value="${sessionScope.userId }">
            	<input type="hidden" name="customerAddr" value="${addr }">
            	<input type="hidden" name="originalPic1" value="${list.PRODORIGINALPIC1 }">
            	<input type="submit" class="btn btn-info" value="Purchase">
            </div>
            </form>	
        </div>
		
		</c:forEach>
        
       

    </div>
    <!-- 중간 전체 틀 끝-->
        <!-- include tag Footer Start -->
<%@ include file="/WEB-INF/views/main-footer.jsp" %>


</div>
<!--전체 틀 끝-->
</body>
</html>