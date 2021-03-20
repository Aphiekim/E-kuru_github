<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-kuru</title>
    <link rel="shortcut icon" href="../resources/img/HatchfulExport-All/ekuru_logo.ico">
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <style>
        .text-st{
            color: #A4193D;
            margin-top: 3%;
        }

        body{
            background-color: #FFDFB9;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!-- 주문 완료 창-->
<div class="container" style="margin-bottom: 25%;">
    <div class="text-center text-st">
        <img src="../resources/img/HatchfulExport-All/ekuru_logo.png" style="width: 30%; margin-top: 10%;">
        <h2>[ 주문 번호 ]</h2>
        <h1>주문이 완료되었습니다.</h1>
    </div>

    <!--버튼-->
    <div class="buttons" style="text-align: center; margin-top: 5%;">
        <div class="row">
            <div class="col">
                <button type="button" class="btn btn-info">Home</button>&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-warning">Buying history</button>
            </div>
        </div>
    </div>

</div>
<!-- 주문 완료창 end-->

<%@ include file="/WEB-INF/views/main-footer.jsp" %>
</body>
</html>