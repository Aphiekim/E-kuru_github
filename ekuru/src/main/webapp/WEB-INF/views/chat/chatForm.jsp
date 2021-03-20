<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
  <link rel="shortcut icon" href="../resources/img/HatchfulExport-All/ekuru_logo.ico">
  <link rel="stylesheet" href="../resources/css/chat.css">

  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-min2.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">
  <script src="../resources/css/bootstrap-4.6.0-dist/js/bootstrap.min.js"></script>
  <script src="../resources/css/bootstrap-4.6.0-dist/js/jquery.min2.js"></script>
  <title>E-kuru</title>
  
  <script type="text/javascript">
	function insertChat(){
		var text = document.getElementById("checkchat").value;
		if (text == "") {
            alert("내용을 입력해주세요");
            return false;
		}else{
			document.submitForm.submit();
			return true;
		}
		return false;
	}

  </script>
  
</head>

<body>
  <%@ include file="/WEB-INF/views/header.jsp" %>

<div class="container box1">
  <h3 class=" text-center main-title"></h3>
  <div class="messaging">
    <div class="inbox_msg">
      <div class="inbox_people">
        <div class="headind_srch">
          <div class="recent_heading">
              <h4>Recent</h4>
          </div>
          <div class="srch_bar">
            <div class="stylish-input-group">
              <input type="text" class="search-bar" placeholder="Search">
              <span class="input-group-addon">
                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
              </span>
            </div>
          </div>
        </div>
        <div class="inbox_chat">
            
            
            
            
          <c:forEach items="${chatroomlist }" var="list">
          <a href="/user/chatForm?chatNum=${list.CHATNUM }">
	          <div class="chat_list">
	            <div class="chat_people">
	              <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
	              <div class="chat_ib">
	                <h5>${list.CHNAME }'s Room<span class="chat_date"> ${list.date }</span></h5>
	                <p>
	                	${list.text }
	                </p>
	              </div>
	            </div>
	          </div>
	      </a>
          </c:forEach>
          
          
          
          
        </div>
      </div>
      <div class="mesgs">
        <div class="msg_history">
        <form action="/user/writeStatement" method="post">
        	<input type="hidden" name="chId" value="${sessionScope.userId }">
        	<input type="hidden" name="userId" value="${buyerId }">
        	<input type="hidden" name="chatNum" value="${chatNum }">
        	<c:if test="${userType eq 0 }">
	        	<input type="submit" class="btn btn-outline-danger" style="margin-bottom: 10px;"  value="Write a Statement">
        	</c:if>
        </form>
       
        <c:forEach items="${chatlist }" var="chat">
        
        	<c:if test="${chat.userid eq sessionScope.userId}">
	        	<div class="outgoing_msg">
	              <div class="sent_msg">
	                <p>
	                	${chat.content }
	                </p>
	                <span class="time_date"> ${chat.date }</span>
	              </div>
	            </div>
        	</c:if>
        	<c:if test="${chat.userid ne sessionScope.userId}">
        		<div class="incoming_msg">
	            <div class="incoming_msg_img">
	              <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
	            </div>
	            <div class="received_msg">
	              <div class="received_withd_msg">
	                <p>
	                  ${chat.content }
	                </p>
	                <span class="time_date"> ${chat.date }</span>
	              </div>
	            </div>
	          </div>
        	</c:if>
        </c:forEach>

          </div>
          <form name="submitForm" action="/user/chatForm" method="post">
	          <div class="type_msg">
	            <div class="input_msg_write">
	              <input id="checkchat" name="content" type="text" class="write_msg" placeholder="Type a message" />
	              <input type="hidden" name="chatNum" value="${chatNum }">
	              <input type="hidden" name="userId" value="${sessionScope.userId }">
	              <button class="msg_send_btn" type="button" onclick="insertChat();"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
	            </div>
	          </div>
          </form>
        </div>
        
        



        
</div>
	
</div>
	
</div>

<%@ include file="/WEB-INF/views/main-footer.jsp" %>


          
</body>

</html>