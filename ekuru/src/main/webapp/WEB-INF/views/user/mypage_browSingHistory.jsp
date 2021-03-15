<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-kuru</title>
    <link rel="shortcut icon" href="../resources/img/HatchfulExport-All/ekuru_logo.ico">
    <link rel="stylesheet" href="../resources/css/mypage-browsinghistory.css">
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">    
    <link rel="stylesheet" href="../resources/css/header.css">
    <link rel="stylesheet" href="../resources/css/main-footer.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/font/NotoSansCJKjp-Black.otf">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">
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
					<button type="button" class="btn btn-info">my shopping</button>&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-secondary">browsing history</button>&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-warning">buying history</button>
				</div>
			</div>
		</div>

            <div class="container" style="width: 70%; margin-top: 5%;">
                <!--요청 내역 헤드-->
                <div class="card text-center">
                    <div class="card-header">
                        <h2 class="page-section-heading text-center text-secondary title-style">
                            <strong>최근 본 상품</h2>
                    </div>
                    <div class="card-body">
                        <!-- 충전 내역 출력 부분 -->
                        <div>
                            <form action="#">
                                <table class="table table-hover" style="width: 80%; margin-left: auto; margin-right: auto;">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Code</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Product Title</th>
                                            <th scope="col">Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                 
                                     <c:forEach items="${prodlist }" var="list" varStatus="status">
			                          <tr>
				                          <th scope="row">${status.count}</th>
				                          <td>${list.PRODNUM }</td>
				                          <td>${list.PRODINDATE }</td>
				                          <td>${list.PRODTITLE }</td>
				                          <td>
				                      			<button class="btn btn-secondary">Wating</button>
				                          </td>
			                          </tr>
                                      </c:forEach>
                                        
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    <div class="card-footer text-muted">
                        Make your request more, Get your stuff more
                    </div>
                </div>
            </div>

            <div style="text-align: center; padding-top: 30px;">
                <button type="button" class="btn btn-info">내역삭제</button>
            </div>

        </div>
        <!-- 중간 전체 틀 끝-->
    </div>
                <%@ include file="/WEB-INF/views/main-footer.jsp" %>
                    <!-- Footer End -->
                </div>
    <!--전체 틀 끝-->
</body>
</html>