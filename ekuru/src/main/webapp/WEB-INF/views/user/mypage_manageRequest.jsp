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
    <link rel="stylesheet" href="../resources/css/mypage-manage-request.css">
    <link rel="stylesheet" href="../resources/font/NotoSansCJKjp-Black.otf">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript">
		function openWriteRequest(){
			location.href="/request/request_writeForm";
		}
		function deleteHistory(){
			location.href="/request/request_manageDelete";
		}
    </script>
    <style>
        * {
            font-family: 'NotSansCJKjp-Black', sans-serif;

        }

        body {
            background-color: #FFDFB9;
        }
    </style>
</head>

<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
    <!--요청내역 start-->
        <!--버튼-->
        <div class="buttons" style="text-align: center; margin-top: 10%;">
            <div class="row">
                <div class="col">
                    <button type="button" class="btn btn-info" onclick="location.href='/'">Home</button>&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-warning" onclick="openWriteRequest();">Request</button>
                </div>
            </div>
        </div>
        <div class="container" style="width: 80%; margin-top: 3%; text-align: center;">
            <!--요청 내역 헤드-->
            <div class="card text-center">
                <div class="card-header">
                    <h2>My Request History</h2>
                </div>
                <div class="card-body">
                    <!-- 요청 내역 출력 부분 -->
                    <div>
                        <form action="#">
                            <table class="table table-hover" style="width: 80%; margin-left: auto; margin-right: auto;">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Category</th>
                                        <th scope="col">Title</th>
                                        <th scope="col">Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="list" items="${list }">
	                                    <tr>
	                                        <th scope="row">${list.reqNum }</th>
	                                        <td>
	                                        	<c:if test="${list.categoryCode==1 }">
	                                        		Fashion/ACC
	                                        	</c:if>
	                                        	<c:if test="${list.categoryCode==2 }">
	                                        		Beauty
	                                        	</c:if>
	                                        	<c:if test="${list.categoryCode==3 }">
	                                        		Food
	                                        	</c:if>
	                                        	<c:if test="${list.categoryCode==4 }">
	                                        		Book/CD
	                                        	</c:if>
	                                        	<c:if test="${list.categoryCode==5 }">
	                                        		Ect
	                                        	</c:if>
	                                        </td>
	                                        <td>
	                                        	<a href="/request/request_readForm?reqNum=${list.reqNum }">${list.reqTitle }</a>
											</td>
	                                        <td>
	                                        	${list.reqIndate }
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
            <!--작성한 요청글 end-->
            <button type="button" class="btn btn-secondary" style="margin-top: 3%;" onclick="deleteHistory();">Delete All</button>
        </div>
        <%@ include file="/WEB-INF/views/main-footer.jsp" %>

</body>