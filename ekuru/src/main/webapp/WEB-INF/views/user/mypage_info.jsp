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
    <link rel="stylesheet" href="../resources/css/mypage-info.css">
    <link rel="stylesheet" href="../resources/font/NotoSansCJKjp-Black.otf">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .box-sty{
            width: 150%;
            height: 200%;
            padding: 20% 0 20% 0 !important;
        }

        .box-sty2{
            padding: 16.5% 0 16.5% 0 !important;
        }
    </style>
    <script type="text/javascript">
function mypageInfoModify(){
	location.href = "/user/mypage_InfoForm";
}
    </script>
</head>

<body style="background-color: #FFDFB9;">
<%@ include file="/WEB-INF/views/header.jsp" %>
    <div>
        <div>
            <!-- 회원 사진 / 인트로 -->
            <div>
                <div class="container d-flex align-items-center flex-column">
                    <!--버튼-->
                    <div class="buttons">
                        <div class="row">
                            <div class="col">
                                <button type="button" class="btn btn-secondary">Information</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-warning">Channel</button>
                            </div>
                        </div>
                    </div>

                    <!-- Masthead Avatar Image-->
                    <img class="mx-auto rounded-circle imgsize" src="../resources/img/member1.jpg" style="width: 20%; margin-top: 5%;" />
                    <!-- Masthead Heading-->
                    <h1 class="text-uppercase mb-0" style="margin-top: 5%;color: black;">Mypage</h1>
                    <!-- Icon Divider-->
                    <div class="divider-custom divider-light">
                        <div class="divider-custom-line"></div>
                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                        <div class="divider-custom-line"></div>
                    </div>
                    <!-- Masthead Subheading-->
                    <p class="masthead-subheading font-weight-light mb-0">${sessionScope.user.getUserId()} Welcome!</p>

                    <!-- 마이페이지 메뉴 Start -->
                    <div class="fact my-menu-size">
                        <div class="container">
                            <div class="row align-items-center text-uppercase">
                                <div class="col-lg-3 col-md-6 fact-style" style="margin-left: 15%;">
                                    <div class="fact-item box-sty2" style="width: 300%;">
                                        <table class="table table-hover" style="width: 70%; text-align: center; margin-bottom: 10%; margin-left: 15%;" >
                                            <thead >
                                                <tr>
                                                  <th scope="col">ID</th>
                                                  <td>${sessionScope.user.getUserId()}</td>
                                                </tr>
                                                <tr>
                                                  <th scope="col">Name</th>
                                                  <td>${sessionScope.user.getUserNm()}</td>
                                                </tr>
                                                <tr>
                                                  <th scope="col">Certified</th>
                                                  <td>
                                                      <img src="../resources/img/channel-tick.png" style="width: 5%; height: auto; margin-bottom: 0px;">
                                                      <img src="../resources/img/shopping-minus.png" style="width: 5%; height: auto; margin-bottom: 0px;">
                                                  </td>
                                                </tr>
                                            </thead>
                                        </table>
                                        <table class="table table-hover" style="width: 70%; text-align: center; margin-bottom: 10%; margin-left: 15%;">
                                            <thead>
                                            <tr>
                                                <th scope="col">zip code</th>
                                                <td>${sessionScope.user.getUserZip()}</td>
                                              </tr>
                                              <tr>
                                                <th scope="col">state</th>
                                                <td>${sessionScope.state}</td>
                                              </tr>
                                              <tr>
                                                <th scope="col">address 1</th>
                                                <td>${sessionScope.addr1}</td>
                                              </tr>
                                              <tr>
                                                <th scope="col">address 2</th>
                                                <td>${sessionScope.addr2}</td>
                                              </tr>
                                              <tr>
                                                <th scope="col">phone</th>
                                                <td>${sessionScope.user.getUserPhone()}</td>
                                              </tr>
                                            </thead>
                                        </table>
                                        <input class="btn btn-secondary"type="button" value="Modify" onclick="mypageInfoModify();">
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <!-- 마이페이지 메뉴 end -->
                </div>
                
            </div>


        </div>
    </div>


<%@ include file="/WEB-INF/views/main-footer.jsp" %>
</body>

</html>