<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>E-kuru</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../resources/css/LoginForm.css">
        <link rel="shortcut icon" href="../resources/img/HatchfulExport-All/ekuru_logo.ico">
</head>
<body>
<div class="container" id="wrap">
            <div class="row sign-form">
                <img src="" alt="">
                <div class="col-md-6 col-md-offset-3">
                    <img class="logo" src="../resources/img/HatchfulExport-All/EKURU_P.png" alt="">
                    <form action="/user/login" method="post" name="signUpForm" class="form" role="form">
                        <legend>E-KURU</legend>
                        <h4>Sign In</h4>
                        <br>
                        <input type="text" name="userId" class="form-control input-lg" placeholder="Email"/>
                        <br>
                        <input type="password" name="userPw" class="form-control input-lg" placeholder="Password"/>
                        <br>
                        <button class="btn btn-lg btn-primary btn-block signup-btn" type="submit">Login</button>
                    </form>
                </div>
            </div>
        </div>
	</body>
</body>
</html>