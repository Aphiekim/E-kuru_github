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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/JoinForm.css" type="text/css">
<script type="text/javascript">
function formCheck(){
	var firstname = document.getElementById("first").value;
	var lastname = document.getElementById("last").value;
	var name = firstname+lastname;
	document.getElementById("userNm").value = name;
	return true;
}
</script>
</head>
<body>
    <div class="container" id="wrap">
        <div class="row sign-form">
            <div class="col-md-6 col-md-offset-3">
                <img class="logo" src="../resources/img/HatchfulExport-All/EKURU_P.png" alt="">
                <form action="/user/join" method="post" name="signUpForm" class="form" role="form" onsubmit="return formCheck()">
                    <legend>E-KURU</legend>
                    <h4>Sign Up</h4>
                    <div class="row">
                        <div class="col-xs-6 col-md-6">
                            <input id="first" type="text" name="firstname" class="form-control input-lg" placeholder="Last Name"/>
                        </div>
                        <div class="col-xs-6 col-md-6">
                            <input id="last" type="text" name="lastname" class="form-control input-lg" placeholder="First Name"/>
                        </div>
                    </div>
                    <br>
                    <input type="text" name="userId" class="form-control input-lg" placeholder="Please write your Email adress..."/>
                    <br>
                    <input type="password" name="userPw" class="form-control input-lg" placeholder="Password"/>
         
                    <%--<input type="password" name="userPw2" class="form-control input-lg" placeholder="Re-enter Password"> --%>
                    <br>
                    
                    <h5>
                    	<b>Korean</b><input type="radio" name="userType" value="0">
                   		<b>Japanese</b><input type="radio" name="userType" value="1">
                    </h5>
                    
                    
                    
                    <br>
                    <button class="btn btn-lg btn-primary btn-block signup-btn" type="submit">JOIN</button>
                    <input id="userNm" name="userNm" type="hidden" value="">
                </form>
                <div>

                </div>
            </div>
        </div>
    </div>
</body>
</html>