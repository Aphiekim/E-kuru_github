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
    <link rel="stylesheet" href="../resources/css/mypage-manage-request.css">
    <link rel="stylesheet" href="../resources/font/NotoSansCJKjp-Black.otf">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <div>
        <!-- header -->
        <header class="header---">
            <div class="wrapper">
                <a href="">
                    <img src="../resources/img/HatchfulExport-All/ekuru_logo.png" style="width: 4%; position: absolute;">
                </a>
                <nav>
                    <ul class="menu">
                        <li class="menu-list headli">
                            <a href="">Home</a>
                            <ul class="menu-sub">
                                <li class="headli">Logout</li>
                                <li class="headli">Mypage</li>
                                <li class="headli">info</li>
                            </ul>
                        </li>
                        <li class="headli"><a href="">About</a></li>
                        <li class="headli"><a href="">Board</a></li>
                        <li class="headli"><a href="">Reference</a></li>
                        <li class="headli"><a href="">Contact</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <!-- header -->
        <!--버튼-->
        <div class="buttons" style="text-align: center; margin-top: 10%;">
            <div class="row">
                <div class="col">
                    <button type="button" class="btn btn-info">Home</button>&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-warning">Request</button>
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
                    <!-- 충전 내역 출력 부분 -->
                    <div>
                        <form action="#">
                            <table class="table table-hover" style="width: 80%; margin-left: auto; margin-right: auto;">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Code</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Offer ID</th>
                                        <th scope="col">Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>A12DEW</td>
                                        <td>2021-02-19</td>
                                        <td>aphiakim</td>
                                        <td>
                                            <button class="btn btn-secondary">Wating</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>W25AEB</td>
                                        <td>2021-02-17</td>
                                        <td>aphiakim</td>
                                        <td>
                                            <button class="btn btn-danger">Clear</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="card-footer text-muted">
                        Make your request more, Get your stuff more
                    </div>
                </div>
            </div>
            <!--마이 포인트 end-->
            <button type="button" class="btn btn-secondary" style="margin-top: 3%;">Delete All
        </div>
        <%@ include file="/WEB-INF/views/main-footer.jsp" %>

</body>