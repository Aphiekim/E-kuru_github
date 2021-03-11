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
	          <div class="chat_list">
	            <div class="chat_people">
	              <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
	              <div class="chat_ib">
	                <h5>${list.CHNAME } Room<span class="chat_date"> 25 </span></h5>
	                <p>
	                
	                </p>
	              </div>
	            </div>
	          </div>
          </c:forEach>
          
          
          
          
        </div>
      </div>
      <div class="mesgs">
        <div class="msg_history">
          <div class="incoming_msg">
            <div class="incoming_msg_img">
              <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
            </div>
            <div class="received_msg">
              <div class="received_withd_msg">
                <p>
                  Test which is a new approach to have all
                  solutions
                </p>
                <span class="time_date"> 11:01 AM | June 9</span>
              </div>
            </div>
          </div>
            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>Test which is a new approach to have all
                  solutions</p>
                <span class="time_date"> 11:01 AM | June 9</span>
              </div>
            </div>
            <div class="incoming_msg">
              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
              </div>
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>Test, which is a new approach to have</p>
                  <span class="time_date"> 11:01 AM | Yesterday</span>
                </div>
              </div>
            </div>
            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>Apollo University, Delhi, India Test</p>
                <span class="time_date"> 11:01 AM | Today</span>
              </div>
            </div>
            <div class="incoming_msg">
              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
              </div>
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>We work directly with our designers and suppliers,
                    and sell direct to you, which means quality, exclusive
                    products, at a price anyone can afford.</p>
                  <span class="time_date"> 11:01 AM | Today</span>
                </div>
              </div>
            </div>
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" class="write_msg" placeholder="Type a message" />
              <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
        </div>



        
</div>
</div>

</div>

<%@ include file="/WEB-INF/views/main-footer.jsp" %>


          
</body>

</html>