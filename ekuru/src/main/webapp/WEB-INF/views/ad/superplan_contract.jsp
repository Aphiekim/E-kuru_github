<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    function applyRecipe0(adTotal){
    	var adTotal = adTotal;
		var adChCharge = document.getElementById('adCh').value;
		var adProdCharge = document.getElementById('adProd').value;
		
		document.getElementById('adChCharge').value = adChCharge;
		document.getElementById('adProdCharge').value = adProdCharge;
		
	}
	function applyRecipe1(adTotal){
	var adTotal = adTotal;
	var adReqCharge = document.getElementById('adReq').value;
	document.getElementById('adReqCharge').value = adReqCharge; 
		
	}
	function checkAndSave0(adTotal){
		var adChCharge = Number(document.getElementById('adChCharge').value);
		var adProdCharge = Number(document.getElementById('adProdCharge').value);
		
		var summ = (adChCharge + adProdCharge);
		var total = adTotal;
		
		console.log(summ);
		console.log(total);
		
		if(summ!=total){
			alert("The sum of the amount is not correct.");
			return false;
		}else{
			alert("Application completed");
			return true;
		}
	}
	function checkAndSave1(adTotal){
		var adReqCharge = Number(document.getElementById('adReqCharge').value);
		var summ = adReqCharge;
		var total = adTotal;
		console.log(summ);
		console.log(total);
		if(summ!=total){
			alert("The sum of the amount is not correct.");
			return false;
		}else{
			alert("Application completed");
			return true;
		}
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
                            <li class="headli"><a href="/user/specificationListForm">My Spec</a></li>
                            <li class="headli"><a href="/user/chatForm">My Chat</a></li>
                            <li class="headli"><a class="sub-a"  href="/user/mypageShopping">My Cart</a></li>
                        </ul>
                    </li>
                    <li class="headli"><a class="menu-a" href="/ad/superplan">SPlan?</a></li>
                    <%-- <li class="headli"><a class="menu-a" href="">Board</a></li> --%>
                    <li class="headli"><a class="menu-a" href="/user/mypagePoint">${sessionScope.userPoint }P</a></li>
                    <li class="headli"><a class="menu-a" href="/user/logout">Logout</a></li>
                    <li class="headli"><a class="menu-a" href="/user/viewedItems">Recently viewed items</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <!-- header -->
   
	<c:if test="${vo.getUserType() eq 0 }">
	<form action="/ad/superplan_doContract" method="post" onsubmit="return checkAndSave0('${adTotal}');">
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
		                    <tbody>
		                      <tr>
		                        <th class="table-st" scope="row">
		                        	<h3 class="text-center">Channel</h3>
		                        </th>
		                      <td>
		                      	<input type="number" class="form-control td-st" id="adCh" placeholder="point value" value="0">
		                      </td>
		                      </tr>
		                      <tr>
		                        <th class="table-st" scope="row">
		                            <h3 class="text-center">Shop Posting</h3>
		                        </th>
		                        <td>
		                            <select name="prodNum" class="form-control td-st">
			                        	<c:forEach var="prodList" items="${prodList }">
		                                	<option value="${prodList.prodNum }">${prodList.prodTitle }</option>
			                        	</c:forEach>
		                            </select>
		                            <input type="number" class="form-control td-st" id="adProd" placeholder="point value" value="0">
		                        </td>
		                      </tr>
		                      <tr>
	                      	<th class="table-st" scope="row">
	                      	</th>
		                    <td>
		                    <input class="btn btn-danger" type="button" style="margin-left:0%" onclick="applyRecipe0('${adTotal}');" value="Apply">
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
			                        Total $
			                        <input type="text" id="adTotal" name="adTotal" value="${adTotal }" readonly="readonly">
			                    </li>
			                    <hr class="line">
			                    <li>
			                        Channel $
			                        <input type="number" id="adChCharge" name="adChCharge" readonly="readonly" value="0">
			                       <!--  <p id="adChApply"></p> -->
			                    </li>
			                    <li>
			                        Shop Post $
			                        <input type="number" id="adProdCharge" name="adProdCharge" readonly="readonly" value="0">
			                        <!-- <p id="adProdApply"></p> -->
			                    </li>
					     </div>
					     <div class="d-grid gap-2 col-6 mx-auto btn-st div-margin">
			                    <input class="btn btn-danger" type="submit" value="Submit">
					     </div>
	            </div>		
        </div>
    </div>
</form>
</c:if>
<c:if test="${vo.getUserType() ne 0 }">
<form action="/ad/superplan_doContract" method="post" onsubmit="return checkAndSave1('${adTotal}');">
	    <div class="container" style="margin-top: 10%;">
	        <div class="row text-center">
	            <div class="card  border-st" style="width: 70%; margin-right: 3%;">
	                <div class="card-header text-uppercase">
	                    Super Pass
	                </div>
	                  <table class="table">
		                    <thead>
		                      <tr>
		                    <tbody>
		                      <tr>
		                        <th class="table-st" scope="row">
		                            <h3 class="text-center">Request Posting</h3>
		                        </th>
		                         <td>
		                            <select name="reqNum" class="form-control td-st">
			                            <c:forEach var="reqList" items="${reqList }">
		                                	<option value="${reqList.reqNum }">${reqList.reqTitle }</option>
			                        	</c:forEach>
		                            </select>
		                            <input type="number" class="form-control td-st" id="adReq" placeholder="point value" value="0">
		                        </td>
		                      </tr>
		                       <tr>
	                      	<th class="table-st" scope="row">
	                      	</th>
		                    <td>
		                    <input class="btn btn-danger" type="button" style="margin-left:0%" onclick="applyRecipe1('${adTotal}');" value="Apply">
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
			                        Total $
			                        <input type="text" id="adTotal" name="adTotal" value="${adTotal }" readonly="readonly">
			                    </li>
			                    <hr class="line">
			                    <li>
			                        Request Post $
			                        <input type="number" id="adReqCharge" name="adReqCharge" readonly="readonly" value="0">
			                        <!-- <p id="adReqApply"></p> -->
			                    </li>
					     </div>
					     <div class="d-grid gap-2 col-6 mx-auto btn-st div-margin">
			                    <input class="btn btn-danger" type="submit" value="Submit">
					     </div>
	            </div>		
        </div>
    </div>
</form>
</c:if>
<%@ include file="/WEB-INF/views/main-footer.jsp" %>
</body>
</html>