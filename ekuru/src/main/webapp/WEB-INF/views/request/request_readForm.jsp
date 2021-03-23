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
  <link rel="stylesheet" href="../resources/font/NotoSansCJKjp-Black.otf">
  <link rel="stylesheet" href="../resources/css/header_Origin.css">
  <link rel="stylesheet" href="../resources/css/request-readForm.css">
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
  <style>
    body {
      margin: 0;
      background-color: #FFDFB9;
    }

    * {
      font-family: 'NotoSansCJKjp-Black', sans-serif;
      box-sizing: border-box;
    }
    #imgsize{
       width: 570px;
       height: 380px;
    }
  </style>
  <script type="text/javascript">
   function openRequestMain(){
      location.href="/request/request_main";
   }
   function openRewriteForm(reqNum){
      location.href="/request/request_rewriteForm?reqNum="+reqNum;
   }
   function deleteComment(reqCommentNum){
      location.href="/request/request_deleteComment?reqCommentNum="+reqCommentNum;
   }
   function deleteReadForm(reqNum){
      location.href="/request/request_deleteRequest?reqNum="+reqNum;
   }
   function checkComment(){
      var reqComment = document.getElementById('reqComment').value;

      if(reqComment.length ==0 && reqComment ==null){
         alert('댓글을 달아주세요.');
      }
   }
  </script>

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
                    </li>
                    <li class="headli"><a class="menu-a" href="/ad/superplan">SPlan?</a></li>
                    <%-- <li class="headli"><a class="menu-a" href="">Board</a></li> --%>
                    <li class="headli"><a class="menu-a" href="/user/mypagePoint">${sessionScope.userPoint }P</a></li>
                    <li class="headli"><a class="menu-a" href="/user/logout">Logout</a></li>
                    <c:if test="${sessionScope.userType == 1}">
                       <li class="headli"><a class="menu-a" href="/user/viewedItems">Recently viewed items</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </header>
    <!-- header -->
    <!-- header -->
  <div class="container" style="margin-top: 10%;">
    <c:choose>
              <c:when test="${sessionScope.userType == 0}">
                 <button type="button" id="translate1" class="btn btn-outline-secondary" style="margin-left: 90%;"value="한국어">한국어</button>
             </c:when>
             <c:otherwise>
                <button type="button" id="translate2" class="btn btn-outline-secondary" style="margin-left: 90%;"value="日本語">日本語</button>
             </c:otherwise>
          </c:choose>
    <hr class="line line-sty">
    <div class="row">
      <!-- 요청글 사진 슬라이드 -->
      <div class="slideshow-container" style="width: 50%; margin-left: 5%;">

        <div class="mySlides fade">
          <div class="numbertext">1 / 3</div>
          <img id="imgsize" src="../resources/upload/file/${vo.getReqOriginalPic1() }" style="width:100%">
        </div>

        <div class="mySlides fade">
          <div class="numbertext">2 / 3</div>
          <img id="imgsize" src="../resources/upload/file/${vo.getReqOriginalPic2() }" style="width:100%">
        </div>

        <div class="mySlides fade">
          <div class="numbertext">3 / 3</div>
          <img id="imgsize" src="../resources/upload/file/${vo.getReqOriginalPic3() }" style="width:100%">

        </div>

        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>

      </div>
      <!-- 요청 설명글 -->
      <div class="card" style="width: 40%;">
        <div class="card-body trans1">
          <h5 class="card-title result1">[ ${vo.reqTitle } ]</h5>
          <h6 class="card-subtitle mb-2 text-muted ">ID : ${vo.userId }</h6>
          <h5 class="card-title con-margin" style="margin-top:5%">Information</h5>
          <p class="card-text result2">> ${vo.reqContent }</p>
        </div>
      </div>
    </div>
    <hr class="line line-sty">

   <!-- 댓글 입력창 -->
   <c:if test="${sessionScope.userType == 0}">
    <form action="/request/request_comment?reqNum=${vo.reqNum }" method="post" onsubmit="return checkComment();">
       <div class="row mb-3">
         <input type="text" id="reqComment" name="reqComment" class="form-control comment-sty" id="exampleFormControlInput1" placeholder="Leave your comment">
         <input type="hidden" name="userId" value="${sessionScope.userId }">
         <button type="submit" class="btn btn-secondary btn-sty">comment</button>
       </div>
    </form>
   </c:if>
    <!-- 구분선 -->
    <hr class="line">
    <!-- 댓글창 -->
    <c:if test="${sessionScope.userType == 0 || sessionScope.userId == vo.userId }">
       <c:forEach var="comment" items="${comment }">
          <div class="card comtWrite-sty">
            <div class="card-body trans2">
              <div class="row justify-content-between">
                <h5 class="card-title col-4">${comment.userId }</h5>
   
                <c:if test="${sessionScope.userId ==comment.userId }">
                  <button type="button" class="btn btn-outline-danger col-4-sm" style="margin-left: 40%" onclick="deleteComment('${comment.reqCommentNum }');">Delete</button>
                </c:if>
   
                <c:if test="${sessionScope.userId == vo.userId }">
                   <form action="/user/createChat" method="post">
                       <input type="hidden" name="chId" value="${comment.userId }">
                       <input type="hidden" name="userId" value="${sessionScope.userId }">
                       <input type="hidden" name="reqOriginalPic1" value="${vo.getReqOriginalPic1() }">
                        <input type="submit" class="btn btn-outline-danger col-4-sm" style="margin-right: 2%;" value="Request">
                    </form>
                </c:if>
   
   
              </div>
              <p class="result">${comment.reqComment }</p>
            </div>
          </div>
       </c:forEach>

    </c:if>
  </div>
  <!-- 리스트로 가기 버튼 -->
  <div class="container" style="text-align: center; margin-top: 5%;">
    <button type="button" class="btn btn-secondary content-center" onclick="openRequestMain();">Go to the List</button>
    <c:if test="${sessionScope.userId==vo.userId }">
      <button type="button" class="btn btn-danger btn-sty" onclick="openRewriteForm('${vo.reqNum}');">Rewrite</button>
      <button type="button" class="btn btn-danger btn-sty" onclick="deleteReadForm('${vo.reqNum}');">Delete</button>
    </c:if>
  </div>


<%@ include file="/WEB-INF/views/main-footer.jsp" %>
<script type="text/javascript">
//번역기능

$("#translate1").click(function () {
    var source = 'ja';
    var target = 'ko';

  var comment = $(".trans1").find(".result1").html();
  comment += '#';
  comment += $(".trans1").find(".result2").html();

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
      var obj = jsonObject.message.result.translatedText.split('#');

         $('.result1').eq(0).html(obj[0]);
         $('.result2').eq(0).html(obj[1]);
      },
      error : function(e){
         console.log(e);
      }
   });
});


$("#translate2").click(function () {
    var source = 'ko';
    var target = 'ja';

    var arr = '';
  $(".trans2").each(function(index,item){
    arr += $(this).find(".result").html();
           if(index < ($(".trans2").length-1)){
              arr += '#';
           }
  })

    console.log(arr);

  $.ajax({
      url : '../translate2',
      type : 'post',
      contentType: "application/x-www-form-urlencoded; charset=UTF-8",
      data : {
         source : source,
         target : target,
         text : arr
      },
      success : function(data){
         //JSON 형태의 문자열을 JSON 객체로 변환
         var jsonObject = JSON.parse(data);

         var obj = jsonObject.message.result.translatedText.split("#");

      for(i=0; i<arr.length-1; i++){
        $('.result').eq(i).text(obj[i]);
      }

      },
      error : function(e){
         console.log(e);
      }
   });
});
</script>
</body>
<script>
  var slideIndex = 1;
  showSlides(slideIndex);

  function plusSlides(n) {
    showSlides(slideIndex += n);
  }

  function currentSlide(n) {
    showSlides(slideIndex = n);
  }

  function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";
    dots[slideIndex-1].className += " active";
  }


  </script>

</html>