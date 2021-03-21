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
    	function formCheck(){
    		var addr1 = document.getElementById("addr1").value;
        	var addr2 = document.getElementById("addr2").value;
        	var addr3 = document.getElementById("addr3").value;
        	var zip = document.getElementById("userZip").value;
        	var phone = document.getElementById("userPhone").value;
        	var result = addr1 + "/" + addr2 + "/" + addr3;
        	document.getElementById("hidden-addr").value = result;

			if(zip.length ==0 || zip ==null){
				alert('Please check your ZipCode');
				return false;
			}
			
			if(addr1.length ==0 || addr1 ==null){
				alert('Please check your State');
				return false;
			}
			

			if(addr2.length ==0 || addr2 == null){
				alert('Please check your Address');
				return false;
			}
			
			if(addr3.length ==0 || addr3 == null){
				alert('Please check your Address');
				return false;
			}
        	
			if(phone.length ==0 || phone ==null){
				alert('Please check your Phone Number');
				return false;
			}
			
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
                    <img class="mx-auto rounded-circle imgsize" src="../resources/upload/file/${user.getUserProfile()}" style="width: 20%; margin-top: 5%;" />
                    
                    
                    <!-- Masthead Heading-->
                    <h1 class="text-uppercase mb-0" style="margin-top: 5%;color: black;">Mypage</h1>
                    <!-- Icon Divider-->
                    <div class="divider-custom divider-light">
                        <div class="divider-custom-line"></div>
                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                        <div class="divider-custom-line"></div>
                    </div>
                    <!-- Masthead Subheading-->
                    <p class="masthead-subheading font-weight-light mb-0">${sessionScope.userId} Welcome!</p>

                    <!-- 마이페이지 메뉴 Start -->
                    <div class="fact my-menu-size">
                        <div class="container">
                            <div class="row align-items-center text-uppercase">
                                <div class="col-lg-3 col-md-6 fact-style" style="margin-left: 15%;">
                                    <div class="fact-item box-sty2" style="width: 300%;">
                                        <form action="/user/mypage_InfoForm" method="post" onsubmit="return formCheck()" enctype="multipart/form-data">
                                        	<table class="table table-hover" style="width: 70%; text-align: center; margin-bottom: 10%; margin-left: 15%;" >
                                            <thead >
                                                <tr>
                                                  <th scope="col">ID</th>
                                                  <td>${sessionScope.userId}</td>
                                                </tr>
                                                <tr>
                                                  <th scope="col">Name</th>
                                                  <td>${sessionScope.userNm}</td>
                                                </tr>
                                                <tr>
                                                  <th scope="col">Certified</th>
                                                  <td>
                                                      <c:if test="${user.getUserConfirm() eq '1'}">
													<img src="../resources/img/channel-tick.png" style="width: 5%; height: auto; margin-bottom: 0px;">
												</c:if>
                                               <c:if test="${user.getUserConfirm() eq '0'}">
													<a href="/user/email"><img src="../resources/img/shopping-minus.png" style="width: 5%; height: auto; margin-bottom: 0px;"></a>
												</c:if>
                                                  </td>
                                                </tr>
                                            </thead>
                                        </table>
                                        <table class="table table-hover" style="width: 70%; text-align: center; margin-bottom: 10%; margin-left: 15%;">
                                            <thead>
                                            <tr>
                                                <th scope="col">zip code</th>
                                                <td>
                                                    <input type="text" id="userZip" name="userZip" value="${user.getUserZip()}" placeholder="Only English plz">
                                                </td>
                                              </tr>
                                              <tr>
                                                <th scope="col">state</th>
                                                <td>
                                                    <input id="addr1" type="text" value="${state }" placeholder="Only English plz">
                                                </td>
                                              </tr>
                                              <tr>
                                                <th scope="col">address 1</th>
                                                <td>
                                                    <input id="addr2" type="text" value="${addr1 }" placeholder="Only English plz">
                                                </td>
                                              </tr>
                                              <tr>
                                                <th scope="col">address 2</th>
                                                <td>
                                                    <input id="addr3" type="text" value="${addr2 }" placeholder="Only English plz">
                                                </td>
                                              </tr>
                                              <tr>
                                                <th scope="col">phone</th>
                                                <td>
                                                    <input type="text" id="userPhone" name="userPhone" value="${user.getUserPhone()}" placeholder="Only English plz">
                                                </td>
                                              </tr>
                                              <tr>
                                              	<th scope="col">Profile</th>
                                              	<td>
                                              	<input type="file" name="upload" id="inputFile" value="${user.getUserProfile()}" multiple="multiple"/>
                                              	</td>
                                              </tr>
                                            </thead>
                                        </table>
                                        
                                        <input type="hidden" id="hidden-addr" name="userAddr" value="">
                                        <input class="btn btn-secondary"type="submit" value="Save">
                                        </form>
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

<!-- <form action="/file/upload.do" method="post" enctype="multipart/form-data"> 
<label><input type="file" name="upload" multiple="multiple"/></label>
 <label><input type="file" name="upload" multiple="multiple"/></label> 
 <input type="submit" value="업로드" /> 
 </form>

 -->
</body>

</html>