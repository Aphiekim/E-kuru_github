<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-kuru</title>
    <link rel="shortcut icon" href="../resources/img/HatchfulExport-All/ekuru_logo.ico">
    <link rel="stylesheet" href="../resources/css/superplan.css">
    <link rel="stylesheet" href="../resources/css/header_Origin.css">
    <link rel="stylesheet" href="../resources/css/main-footer.css">
    <link rel="stylesheet" href="../resources/font/NotoSansCJKjp-Black.otf">
    <link rel="stylesheet" href="../resources/css/superplan-contract.css">
    <link rel="stylesheet" href="../resources/css/mypage-pointpricing.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>
    function applyRecipe(adTotal){
        	var adTotal = adTotal;
			var adChCharge = document.getElementById('adCh').value;
			var adProdCharge = document.getElementById('adProd').value;
			var adReqCharge = document.getElementById('adReq').value;
			var summ = (adChCharge + adProdCharge + adReqCharge);
			
			<%--if(summ!=adTotal){
				alert("신청 금액의 합이 맞지 않습니다.");
				return false;
			}--%>

			document.getElementById('adChCharge').value = adChCharge;
			document.getElementById('adProdCharge').value = adProdCharge;
			document.getElementById('adReqCharge').value = adReqCharge; 
				
			<%--document.getElementById('adChApply').innerHTML = adChCharge;
			document.getElementById('adProdApply').innerHTML = adProdCharge;
			document.getElementById('adReqApply').innerHTML = adReqCharge; 

			document.getElementById('adChApply').value = document.getElementById('adChCharge').value;
			document.getElementById('adProdApply').value = document.getElementById('adProdCharge').value;
			document.getElementById('adReqApply').value = document.getElementById('adReqCharge').value;--%>
		}
    </script>
    <style>
        .border-st {
            border: solid 1px brown;
        }

        .td-st{
            margin-left: 10%;
            margin-top: 2.5%;
            margin-bottom: 3%;
      		width: 80%
        }
        
        .td-btn{
        	margin-top: 0% !important;
            margin-bottom: 0% !important;
            
        }
        * {
            font-family: 'NotSansCJKjp-Black', sans-serif !important;
        }

        body {
            background-color: #FFDFB9;
        }
    </style>

</head>

<body>
    <!-- header -->
    <header class="header---">
        <div class="wrapper">
            <a href="/">
                <img src="../resources/img/HatchfulExport-All/ekuru_logo.png" style="width: 4%; position: absolute;">
            </a>
            <nav>
                <ul class="menu">
                    <li class="menu-list headli">
                        <a class="menu-a" href="/user/mypageMain">My Page</a>
                        <ul class="menu-sub">
                            <li class="headli">Recently viewed items</li>
                            <li class="headli">My Request</li>
                            <li class="headli"><a class="sub-a"  href="/user/mypagerequest">My Cart</a></li>
                        </ul>
                    </li>
                    <li class="headli"><a class="menu-a" href="/ad/superplan">SPlan?</a></li>
                    <%-- <li class="headli"><a class="menu-a" href="">Board</a></li> --%>
                    <li class="headli"><a class="menu-a" href="">58600P</a></li>
                    <li class="headli"><a class="menu-a" href="/user/logout">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <!-- header -->
   
	<form action="/ad/superplan_doContract" method="post">
	    <div class="container" style="margin-top: 10%;">
	        <div class="row text-center">
	            <div class="card  border-st" style="width: 70%; margin-right: 3%;">
	                <div class="card-header text-uppercase">
	                    Super Pass
	                </div>
	                
	                <table class="table">
	                    <thead>
	                      <tr>
	                        <th class="table-st  text-center" scope="col">type</th>
	                        <th class="table-st  text-center" scope="col">point</th>
	                      </tr>
	                    </thead>
	                    <tbody>
	                      <tr>
	                        <th class="table-st" scope="row">
	                           <h3 class="text-center">Channel</h3 class="text-center">
	                        </th>
	                        <td >
	        	               <input type="text" class="form-control td-st" id="adCh" placeholder="point value">
	                        </td>
	                      </tr>
	                      <tr>
	                        <th class="table-st" scope="row">
	                            <h3 class="text-center">Shop Posting</h3 class="text-center">
	                        </th>
	                        <td>
	                            <select name="req"  class="form-control td-st">
	                                <option value="0">select your Post</option>
	                                <option value="1">1</option>
	                                <option value="2">2</option>
	                                <option value="3">3</option>
	                            </select>
	                            <input type="text" class="form-control td-st" id="adProd" placeholder="point value">
	                        </td>
	                      </tr>
	                      <tr>
	                        <th class="table-st" scope="row">
	                            <h3 class="text-center">Request Posting</h3 class="text-center">
	                        </th>
	                        <td>
	                            <select name="prod" class="form-control td-st">
	                                <option value="0">select your Post</option>
	                                <option value="1">1</option>
	                                <option value="2">2</option>
	                                <option value="3">3</option>
	                            </select>
	                            <input type="text" class="form-control td-st" id="adReq" placeholder="point value">
	                        </td>
	                      </tr>
	                      <tr>
	                      	<th class="table-st" scope="row">
	                      	
	                      	</th>
		                    <td>
                    			<button class="btn btn-danger" type="button" style="margin-left:0%" onclick="applyRecipe('${adTotal}');">Apply</button>
					        </td>
				          </tr>
	                    </tbody>
	                  </table>
	                
	              </div>
   	        <div class="card border-danger mb-3" style="width: 23%; height: 60%;">
                <div class="card-header bg-transparent border-danger text-uppercase fw-bold">Receipt</div>
	               	 <div class="card-body text-secondary">
	               		 <h5 class="card-title">Please check your items</h5>
		                    <li>
		                        Total ${adTotal }$
		                        <input type="text" id="adTotal" name="adTotal" value="${adTotal }" readonly="readonly">
		                    </li>
		                    <hr class="line">
		                    <li>
		                        Channel $
		                        <input type="text" id="adChCharge" name="adChCharge" readonly="readonly">
		                       <!--  <p id="adChApply"></p> -->
		                    </li>
		                    <li>
		                        Shop Post $
		                        <input type="text" id="adProdCharge" name="adProdCharge" readonly="readonly">
		                        <!-- <p id="adProdApply"></p> -->
		                    </li>
		                    <li>
		                        Request Post $
		                        <input type="text" id="adReqCharge" name="adReqCharge" readonly="readonly">
		                        <!-- <p id="adReqApply"></p> -->
		                    </li>
				     </div>
				     <div class="d-grid gap-2 col-6 mx-auto btn-st div-margin">
		                    <button class="btn btn-danger" type="submit">Submit</button>
				     </div>
            </div>
        </div>
    </div>
</form>


     <!-- include tag Footer Start -->
     <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="row">
                        <!-- 주소지 -->
                        <div class="col-md-6">
                            <div class="footer-contact">
                                <h2>Our Head Office</h2>
                                <p><i class="fa fa-map-marker-alt"></i>서울 강남구 영동대로 513</p>
                                <p><i class="fa fa-phone-alt"></i>02-6000-0114</p>
                                <p><i class="fa fa-envelope"></i>E-kuru co.</p>
                                <div class="footer-social">
                                    <a href=""><i class="fab fa-twitter"></i></a>
                                    <a href=""><i class="fab fa-facebook-f"></i></a>
                                    <a href=""><i class="fab fa-youtube"></i></a>
                                    <a href=""><i class="fab fa-instagram"></i></a>
                                    <a href=""><i class="fab fa-linkedin-in"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- 회사 방침 링크 -->
                        <div class="col-md-6">
                            <div class="footer-link">
                                <h2>Quick Links</h2>
                                <a href="">How to use</a>
                                <a href="">Privacy policy</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 서포트 이메일 받는란 -->
                <div class="col-lg-5">
                    <div class="footer-newsletter">
                        <h2>Support us</h2>
                        <p>
                            If you are interested in this business, send your email to us.<br>
                            Thank you for supporting.
                        </p>
                    </div>
                    <div>
                        <form class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Email@email.com"
                                aria-label="Email@email.com aria-describedby=" button-addon2">
                            <button class="btn btn-secondary" type="submit" id="button-addon2">SUBMIT</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- 저작권 부분 -->
        <div class="container copyright">
            <div class="row">
                <div class="col-md-6">
                    <p>&copy; <a href="#">E-kuru</a>, All Right Reserved.</p>
                </div>
                <div class="col-md-6">
                    <p>Designed By <a href="https://htmlcodex.com">HTML Codex</a></p>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


</body>
</html>