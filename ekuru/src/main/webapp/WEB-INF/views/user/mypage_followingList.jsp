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
   <!-- 적용방법 2 : cdn -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- 적용방법 3 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript">
		function openWriteRequest(){
			location.href="/request/request_writeForm";
		}
		function deleteFollowingList(){
			location.href="/channel/deleteFollowingList";
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
                    <button type="button" id="translate2" class="btn btn-outline-secondary" style="margin-left: 20px;">日本語</button>
                </div>
            </div>
        </div>
        <div class="container" style="width: 80%; margin-top: 3%; text-align: center;">
            <!--요청 내역 헤드-->
            <div class="card text-center">
                <div class="card-header">
                    <h2>My Following List</h2>
                </div>
                <div class="card-body">
                    <!-- 요청 내역 출력 부분 -->
                    <div>
                        <form action="#">
                            <table class="table table-hover" style="width: 80%; margin-left: auto; margin-right: auto;">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Channel Name</th>
                                        <th scope="col">Channel Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${channelResult }" var="result">
                                		<c:set var="i" value="${i+1 }"/>
	                                    <tr class="trans2">
	                                    	<td>
	                                        	<span>${i }</span>
											</td>
	                                        <td>
	                                        	<a class ="result1" href="/channel/ch_personal_main?chId=${result.chId }">${result.chName }</a>
	                                        </td>
	                                        <td>
	                                        	<span class="result2">${result.chIntro }</span>
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
            <button type="button" class="btn btn-secondary" style="margin-top: 3%;" onclick="deleteFollowingList();">Delete All</button>
        </div>
        <%@ include file="/WEB-INF/views/main-footer.jsp" %>

    <script type="text/javascript">
            $("#translate2").click(function () {
                var source = 'ko';
                var target = 'ja';

                var follow = '';

                console.log($(".trans2").find(".result1").html());
                console.log($(".trans2").find(".result2").html());
                console.log($(".trans2").length-1);
                $(".trans2").each(function(index,item){
                    follow += $(this).find(".result1").html();
                    follow += '#';

                    follow += $(this).find(".result2").html();
                    if(index < ($(".trans2").length-1)){
                        follow += '#';
                    }
                });

                console.log(follow);

              $.ajax({
                    url : '../translate2',
                    type : 'post',
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    data : {
                        source : source,
                        target : target,
                        text : follow
                    },
                    success : function(data){
                        //JSON 형태의 문자열을 JSON 객체로 변환
                        var jsonObject = JSON.parse(data);

                        var obj = jsonObject.message.result.translatedText.split('#');
                        console.log(obj);

                        $('.result1').eq(0).text(obj[0]);
                        $('.result2').eq(0).text(obj[1]);

                        $('.result1').eq(1).text(obj[2]);
                        $('.result2').eq(1).text(obj[3]);

                        $('.result1').eq(2).text(obj[4]);
                        $('.result2').eq(2).text(obj[5]);

                        let j = 0
                        for(let i=0; i<obj.length; i++){
                        	$('.result1').eq(j).text(obj[i]);
                            $('.result2').eq(j).text(obj[i+1]);
                            i=i+1;
                            j++;

                        }

                    },
                    error : function(e){
                        console.log(e);
                    }
                });
            });

    </script>
</body>