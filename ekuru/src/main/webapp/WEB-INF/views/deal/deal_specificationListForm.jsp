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
    <link rel="stylesheet" href="../resources/css/mypage-browsinghistory.css">
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
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
					<c:if test="${userType eq 1 }">
						<button type="button" class="btn btn-info" onclick="location.href='/user/mypageShopping'">My shopping</button>&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-secondary" onclick="location.href='/user/viewedItems'">Browsing history</button>&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-warning" onclick="location.href='/user/mypage_dealHistory'">Buying history</button>
					</c:if>
					
				</div>
			</div>
		</div>

            <div class="container" style="width: 110%; margin-top: 5%;">
                <!--요청 내역 헤드-->
                <div class="card text-center">
                    <div class="card-header">
                        <h2 class="page-section-heading text-center text-secondary title-style">
                            <strong>My Specification List</strong>
                        </h2>
                    </div>
                    <div class="card-body">
                        <!-- 충전 내역 출력 부분 -->
                        <div>
                            
                                <table class="table table-hover" style="width: 80%; margin-left: auto; margin-right: auto;">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Spec Code</th>
                                            <th scope="col">ProductName</th>
                                            <th scope="col">Product Ea</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Customer Address</th>
                                            <th scope="col">Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    	<c:forEach items="${list }" var="list" varStatus="status">
                                    	
	                                    	<tr>
	                                    	
	                                            <th scope="row">${status.count}</th>
	                                            
	                                            <td>${list.SPECNUM}</td>
	                                            <td><a href="/user/selectProdOne?specNum=${list.SPECNUM }">${list.PRODUCTNAME }</a></td>
	                                            <td>${list.PRODUCTEA }</td>
	                                            <td>${list.PRODUCTPRICE}</td>
	                                            <td>${list.CUSTOMERADDR }</td>
				 								
	                                            <c:if test="${list.STATUS eq '0'}">
	                                            	<c:if test="${sessionScope.userType eq '0' }">
		                                            	<td>
		                                            	<form action="/user/updateStatus" method="post">
		                                            		<input type="hidden" name="specNum" value="${list.SPECNUM }">
		                                            		<input class="btn btn-secondary" type="submit" value="Wating">
		                                            		</form>
			                                            </td>
	                                            	</c:if>
	                                            </c:if>
	                                            <c:if test="${list.STATUS eq '0'}">
		                                           <c:if test="${sessionScope.userType ne '0' }">
		                                            	<td>
			                                                <button class="btn btn-secondary">Wating</button>
			                                            </td>
	                                            	</c:if>
	                                            </c:if>
	                                           
	                                            <c:if test="${list.STATUS eq '1'}">
		                                            <td>
		                                                <button class="btn btn-danger">Clear</button>
		                                            </td>
	                                            </c:if>
	                                            

	                                        </tr>
                                    	</c:forEach>
                                    
                                       
                                    </tbody>
                                </table>
                            
                        </div>
                    <div class="card-footer text-muted">
                        Make your request more, Get your stuff more
                    </div>
                </div>
            </div>

            <!-- <div style="text-align: center; padding-top: 30px;">
                <button type="button" class="btn btn-info">내역삭제</button>
            </div> -->
        </div>
        <!-- 중간 전체 틀 끝-->
    <!-- 중간 전체 틀 끝-->
        <!-- include tag Footer Start -->

</div>
<%@ include file="/WEB-INF/views/main-footer.jsp" %>


<!--전체 틀 끝-->
</body>
</html>