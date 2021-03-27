<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>E-kuru</title>

    <link rel="shortcut icon" href="/resources/img/HatchfulExport-All/ekuru_logo.ico">
    <link rel="stylesheet" href="/resources/css/(buyer)channel-content.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/header.css">
    <link rel="stylesheet" href="/resources/css/main-footer.css">
    <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <script>
    $('.carousel').carousel({ interval: 2000 //기본 5초
    });

    $(() => {
            $(".addComment").click(function () {
                const prodComment = $("#commentBox").val();
                if (prodComment == null || prodComment.lengh == 0 || prodComment =='') {
                    alert("댓글을 입력 해 주세요");
                } else {
                    const userId = $("#userId").val();
                    let prodNum = $("#prodNum").val();
                    prodNum = parseInt(prodNum);

                    const data = {
                    	prodComment: prodComment,
                        userId: userId,
                        prodNum: prodNum
                    };

                    $.ajax({
                        url: '/channel/addComment',
                        type: "POST",
                        async : false,
                        contentType: "application/json",
                        dataType: "json",
                        data: JSON.stringify(data),
                        success: function (result) {
                            if (result['prodCommentNum'] > 0) {
                               /** const content = `
                                    <div class="col-md-12">
                                        <span class="comment-detail">${prodComment}</span>
                                        <span class="comment-detail">${userId}</span>
                                    </div>
                                `;**/

                                const content = '<div class="col-md-12"><span class="comment-detail">'+userId+
                                    '</span><span class="comment-detail">'+prodComment+'</span><a class="deleteComment"><img id="cImg" style="width: 30px; margin-left: 10px;" src="/resources/img/channel/delete.png"></a></div>';
                                $("#commentAdd").append(content);
                                $("#commentBox").val("");
                                $("#commentBox").attr({'readonly':'readonly'});
                                location.reload();
                            } else {
                                alert('등록 되지 않았습니다.');
                            }
                        },
                        error: function () {
                            alert("통신장애가 발생하였습니다.");
                        }
                    });
                }
            });

            $(".deleteComment").click(function(){
                
                /* const cUserId = $("#cUserId").text();
                const cComment = $("#cComment").text(); */

                let prodCommentNum = $("#prodCommentNum").val();
                prodCommentNum = parseInt(prodCommentNum);

                const data = {
                    prodCommentNum
                    };

                    $.ajax({
                        url: '/channel/deleteComment',
                        type: "POST",
                        async : false,
                        contentType: "application/json",
                        dataType: "json",
                        data: JSON.stringify(data),
                        success: function (result) {
                            if (result==true) {
                                $("#cUserId").remove();
                                $("#cComment").remove();
                                $("#cImg").remove();
                                location.reload();
                            } else {
                                alert('등록 되지 않았습니다.');
                            }
                        },
                        error: function () {
                            alert("통신장애가 발생하였습니다.");
                        }
                    });
            });

        });

        function fn_addCart(){
            var addCart = document.getElementById("addCart");
            const cartProdEa = document.getElementById("cartProdEa").value;

            if(cartProdEa==""){
                alert("数量を入力してください");
                return false;
            }
            addCart.action = "../user/addCart";
            addCart.method = "POST";
            addCart.submit();
        }



    </script>

	<style type="text/css">
	#contentimg{
		width: 525px;
		height: 300px;
	}
	</style>
</head>
<body>


<!--전체 틀-->
<div class="fullSize">
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

    <!-- 중간 전체 틀 -->
    <div class="mainSize">
        <div class="text-center" style="padding-top: 7%;"></div>
        <div>
        	<h2 class="page-section-heading text-center text-secondary title-style"><strong>${channel.chName }</strong>'s item
        	<c:choose>
        		<c:when test="${userType == '0'}">
        			<button type="button" id="translate1" class="btn btn-outline-secondary" style="margin-right: -30%; margin-left: 350px;"value="한국어">한국어</button>
    			</c:when>
    			<c:otherwise>
    				<button type="button" id="translate2" class="btn btn-outline-secondary" style="margin-right: -30%; margin-left: 350px;"value="日本語">日本語</button>
    			</c:otherwise>
    		</c:choose>
    		</h2>
		</div>
        <!--상위 부분-->
        <div class="top-content">

                <!--슬라이드 범위 -->
                <div class="product-slide">
                    <div id="demo" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <!-- 슬라이드 쇼 -->
                            <div class="carousel-item active">
                                <!--가로-->
                                <img id="contentimg" class="d-block w-100"
                                    src="../resources/upload/file/${prodEachResult.getProdOriginalPic1() }?auto=compress&cs=tinysrgb&h=650&w=940"
                                    alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img id="contentimg" class="d-block w-100"
                                    src="../resources/upload/file/${prodEachResult.getProdOriginalPic2() }?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"
                                    alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img id="contentimg" class="d-block w-100"
                                    src="../resources/upload/file/${prodEachResult.getProdOriginalPic3() }?auto=compress&cs=tinysrgb&h=650&w=940"
                                    alt="Third slide">
                            </div>
                            <!-- / 슬라이드 쇼 끝 -->

                            <!-- 왼쪽 오른쪽 화살표 버튼 -->
                            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <!-- <span>Previous</span> -->
                            </a>
                            <a class="carousel-control-next" href="#demo" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <!-- <span>Next</span> -->
                            </a>
                            <!-- / 화살표 버튼 끝 -->

                            <!-- 인디케이터 -->
                            <ul class="carousel-indicators">
                                <li data-target="#demo" data-slide-to="0" class="active"></li>
                                <!--0번부터시작-->
                                <li data-target="#demo" data-slide-to="1"></li>
                                <li data-target="#demo" data-slide-to="2"></li>
                            </ul>
                            <!-- 인디케이터 끝 -->
                        </div>
                    </div>
                <!--슬라이드 끝-->
                </div>

                <!-- 상품 내용 -->
                <div class="product-intro">

                    <div class="product-title trans2">
                        <span class="result1" id="prodTitle" name="prodTitle">${prodEachResult.prodTitle }</span>
                    </div>

                        <form id="addCart" class="trans2">
                            <div class="content-name">
                                <span>PRICE</span>
                            </div>
                            <div class="content-value">
                                <input type="text" id="prodPrice" name="prodPrice" value="${prodEachResult.prodPrice }" readonly>
                            </div>

                            <c:choose>
                                <c:when test="${userType == '1'}">
                                    <div class="content-name">
                                        <span>QUANTITY</span>
                                    </div>
                                    <div class="content-value">
                                        <input type="number" id="cartProdEa" name="cartProdEa">
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="content-name">
                                    </div>
                                    <div class="content-value">
                                    </div>
                                </c:otherwise>
                            </c:choose>

                            <input type="hidden" id="prodNum" name="prodNum" value="${prodEachResult.prodNum }">
                            <div style="width: 50%; margin-top: 10px; margin-left: 30px;">
                                <span>DETAIL</span>
                            </div>
                            <div class="result2" style="margin-top: 10px;width: 80%; margin-left: 50px;">
                                ${prodEachResult.prodContent }
                                </div>
                            <c:if test="${channel.chId ne sessionScope.userId && userType == '1'}">
                                <div style="margin-top: 30px;">
                                    <ul style="list-style: none; margin-left: 40px;">
                                        <li class="button"><button type="button" id="button1" style="width: 100%;" class="btn btn-info" onclick="fn_addCart()">Add to Cart</button></li>
                                        <li class="button">
                                        </li>
                                    </ul>
                                </div>
                            </c:if>
                        </form>
                        <c:if test="${channel.chId ne sessionScope.userId && userType == '1'}">
                            <form action="/user/createChat" method="post">
                                <input type="hidden" name="chId" id="chId" value="${channel.chId }">
                                <input type="hidden" name="userId" id="userId" value="${sessionScope.userId }">
                                <input type="hidden" name="reqOriginalPic1" id="reqOriginalPic1" value="${prodEachResult.getProdOriginalPic1() }">
                                <button type="submit" style="width: 81%; margin-left: 40px;" class="btn btn-info">Chat with Seller</button>
                            </form>
                        </c:if>
                </div>
                <!--상품내용 끝 -->

            </div>
            <!--상위 부분 끝-->

        <!--하위 부분 시작-->
        <div class="bottom-content">
            <div class="comments">
                <div class="row" id="commentAdd">
                    <c:forEach items="${commentResult }" var="commentList">
                            <div class="col-md-12 trans1">
                                <input id="prodCommentNum" type="hidden" value="${commentList.prodCommentNum }">
                                <span class="comment-detail" id="cUserId" value="${commentList.userId }">${commentList.userId }</span>
                                <span class="comment-detail result" id="cComment" value="${commentList.prodComment }">${commentList.prodComment }</span>
                                <c:if test="${sessionScope.userId == commentList.userId }">
	                                <a class="deleteComment"><img id="cImg" style="width: 30px; margin-left: 10px;" src="/resources/img/channel/delete.png"></a>
                                </c:if>
                            </div>
                    </c:forEach>
                </div>

                <div class="row" style="text-align: center;">
                    <c:if test="${userType == '1'}">
                        <div class="col-md-12">
                            <input id="prodNum" type="hidden" value="${prodEachResult.prodNum }">
                            <input id="userId" type="hidden" value="${sessionScope.userId}">
                            <c:choose>
                                <c:when test="${result}">
                                    <input type="text" class="textbox" placeholder="Leave your comment" readonly = "readonly">
                                </c:when>
                                <c:otherwise>
                                    <input class="textbox" id="commentBox" type="text" placeholder="Leave your comment">
                                </c:otherwise>
                            </c:choose>
                            <a class="addComment"><img style="width: 30px; margin-left: 10px;" src="/resources/img/channel-tick.png"></a>
                        </div>
                    </c:if>
                </div>
                <div class="button-list" style="text-align: center;">
                    <input class="button btn-danger" style = "text-align:center; margin-top: 40px; margin-bottom: -20px; padding: 10px;
                    width: 20%;" type="button" value="Back To Channel" onclick="location.href='ch_personal_main?chId=${channel.chId}'">
                </div>
            </div>

        </div>
        <!--하위 부분 끝-->

    </div>
    <!-- 중간 전체 틀 끝-->

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
                            <button class="btn btn-secondary" type="submit" id="button-addon2">submit</button>
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

</div>
<!--전체 틀 끝-->
<script type="text/javascript">
$("#translate1").click(function () {
    var source = 'ja';
    var target = 'ko';

  var comment = $(".trans1").find(".result").html();

	$.ajax({
		url : '../translate1',
		type : 'post',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data : {
			source : source,
			target : target,
			text : comment
		},
		success : function(data){
			//JSON 형태의 문자열을 JSON 객체로 변환
			var jsonObject = JSON.parse(data);
			$('.result').html(jsonObject.message.result.translatedText);
		},
		error : function(e){
			console.log(e);
		}
	});
});


$("#translate2").click(function () {
    var source = 'ko';
    var target = 'ja';

  var comment2 = $(".trans2").find(".result1").html();
  	  comment2 += '#';
  	comment2 += $(".trans2").find(".result2").html();

  $.ajax({
		url : '../translate2',
		type : 'post',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data : {
			source : source,
			target : target,
			text : comment2
		},
		success : function(data){
			//JSON 형태의 문자열을 JSON 객체로 변환
			var jsonObject = JSON.parse(data);

			var obj = jsonObject.message.result.translatedText.split('#');
			/* console.log(obj); */
			$('.result1').eq(0).text(obj[0]);
			$('.result2').eq(0).text(obj[1]);

		},
		error : function(e){
			console.log(e);
		}
	});
});


</script>

</body>
</html>