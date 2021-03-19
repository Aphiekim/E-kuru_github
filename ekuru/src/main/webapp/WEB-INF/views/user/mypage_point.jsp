<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-kuru</title>
    <link rel="shortcut icon" href="../resources/img/HatchfulExport-All/ekuru_logo.ico">
    <link rel="stylesheet" href="../resources/css/request-main.css">
    <link rel="stylesheet" href="../resources/font/NotoSansCJKjp-Black.otf">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   	<script type="text/javascript">
		function openPointPricing(){
			location.href = "/user/mypage_pointPricing";
		}
   	</script>
    <style>
        * {
            font-family: 'NotSansCJKjp-Black', sans-serif;
        }

        body {
            background-color: #FFDFB9;
        }

        .st {
            width: 50% !important;
            margin-top: 10%;
        }

        footer{
            width: 100% !important;
        }
    </style>
</head>

<body>
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <!--마이 포인트 start-->
    <div class="container" style="margin-top: 10%;">
        <!--현재 잔여 포인트-->
        <div class="card text-center">
            <div class="card-header">
                <h2>My point</h2>
                <h1 id="h1-p">${sessionScope.userPoint }P</h1>
            </div>
            <div class="card-body">
                <!--충전 및 환불 버튼 부분-->
                <div>
                    <div class="row g-2 ">
                        <div class="col-6" style="margin-left: auto; margin-right: auto; margin-bottom: 2%">
                            <button type="button" class="btn btn-outline-danger" onclick="openPointPricing();">Charge</button>
                        </div>
                    </div>

                </div>
                <!-- 충전 내역 출력 부분 -->
                <div>
                    <form action="#">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Charged Point</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">ID</th>
                                </tr>
                            </thead>
                            <c:forEach items="${pointlist}" var="list">
	                            	<tr>
	                                    <td>
	                                    	${list.POINTPRODNAME}
	                                    </td>
	                                    <td>
	                                    	${list.POINTCHARGEDINDATE}
	                                    </td>
	                                    <td>
	                                    	${list.USERID}
	                                    </td>
	                                </tr>
                            </c:forEach>
                        </table>
                    </form>
                    <form action="#">
                        <table class="table table-hover" style="margin-top: 5%; margin-bottom: 5%;">
                            <thead>
                                <tr>
                                    <th scope="col">Used Point (-)</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">ID</th>
                                </tr>
                            </thead>
                            <c:forEach items="${usedPoint}" var="usedPoint">
	                            	<tr style="color: red;">
	                                    <td>
	                                    	- ${usedPoint.pointUsed }
	                                    </td>
	                                    <td>
	                                    	${usedPoint.pointUsedIndate }
	                                    </td>
	                                    <td>
	                                    	${usedPoint.userId }
	                                    </td>
	                                </tr>
                            </c:forEach>
                        </table>
                    </form>
                </div>
                <div class="card-footer text-muted">
                    Make your point be full, you will be happy
                </div>
            </div>
        </div>
        <!--마이 포인트 end-->
        <!-- include tag Footer Start -->
    </div>

<%@ include file="/WEB-INF/views/main-footer.jsp" %>
</body>
</html>