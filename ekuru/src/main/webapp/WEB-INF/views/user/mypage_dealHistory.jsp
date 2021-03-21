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
    <link rel="shortcut icon" href="img/HatchfulExport-All/ekuru_logo.ico">
    <link rel="stylesheet" href="/resources/css/mapage-dealHistory.css">
    <link rel="stylesheet" href="/resources/font/NotoSansCJKjp-Black.otf">
    <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body style="background-color: #FFDFB9;">
    <%@ include file="/WEB-INF/views/header.jsp" %>

    <!--거래내역 start-->
    <div class="container align-items-center text-center" style="margin-top: 5%;">
        <!--버튼-->
        <div class="buttons" style="margin-bottom: 5%; margin-top: 8.5%;">
			<div class="row">
				<div class="col">
					<button type="button" class="btn btn-info" onclick="location.href='/user/mypageShopping'">My shopping</button>&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-secondary" onclick="location.href='/user/viewedItems'">Browsing history</button>&nbsp;&nbsp;&nbsp;
				</div>
			</div>
		</div>

        <!--거래 내역 시작-->
        <div class="card text-center">
            <div class="card-header">
                <h1 id="h1-p">Deal History</h1>
            </div>
            <div class="card-body">

                <div class="base">
                    <div class="row">

                        <div class="list">
                            <table>
                                <tr>
                                    <th><span class="th-text">SPECNUM</span></th>
                                    <th><span class="th-text">DEALCODE</span></th>
                                    <th><span class="th-text">USERID</span></th>
                                    <th><span class="th-text">DEALINDATE</span></th>
                                    <th><span class="th-text">Specification</span></th>
                                </tr>
                                    <c:forEach items="${result }" var="dealHistory">
                                <tr>
                                	
                                        <td><span>${dealHistory.SPECNUM }</span></td>
                                        <td><span>${dealHistory.DEALCODE }</span></td>
                                        <td><span>${dealHistory.USERID }</span></td>
                                        <td><span>${dealHistory.DEALINDATE }</span></td>
                                        <td><span><a href="selectProdOne?specNum=${dealHistory.SPECNUM}">Specification</a></span></td>
                                     
                                </tr>
                                </c:forEach>

                            </table>
                        </div>
                    </div>
                </div>

                <div class="card-footer text-muted">
                    Make your point be full, you will be happy
                </div>
            </div>
        </div>
        <!--거래 내역 end-->
    </div>
    <%@ include file="/WEB-INF/views/main-footer.jsp" %>
</body>
</html>
