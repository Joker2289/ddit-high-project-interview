<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
         <a class="navbar-brand" href="/timeline" style="padding-top: 8px;"><img alt="" src="/images/logo/linkedin.png"></a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          	<li style=" width: 410px; height: 34px; padding-top: 8px;">
	          	<div class="searchbox">
				  <div class="searchgroup">
				  	  <form id="frm_searchword" action="/searchResult">
				          <input type="search" name="search_word" id="search" placeholder="검색"/>
				          <button id="btn_searchword" class="icon" type="submit"><i class="fa fa-search"></i></button>
				      </form>
				  </div>
				  	<div id="dropdownSearch">
					</div>
				</div>
          	</li>
            <li class="menu">
            	<a href="/timeline" class="menugroup" style="padding-top: 7px;">
            		<div><span style="font-size: 20px;"><i class="fas fa-home"></i></span></div>
            		<div>홈</div>
            	</a>
            </li>
            <li class="menu">
            	<a href="/personalConnection" class="menugroup" style="padding-top: 7px;">
            		<div><span style="font-size: 20px;"><i class="fas fa-users"></i></span></div>
            		<div>인맥</div>
            	</a>
            </li>
            <li class="menu">
            	<a href="/recruit" class="menugroup" style="padding-top: 7px;">
            		<div><span style="font-size: 20px;"><i class="fas fa-briefcase"></i></span></div>
            		<div>채용공고</div>
            	</a>
            </li>
            <li class="menu">
            	<a href="/mailHome" class="menugroup" style="padding-top: 7px;">
            		<div><span style="font-size: 20px;"><i class="far fa-comment-dots"></i></span></div>
            		<div>메일</div>
            	</a>
            </li>
            <li class="menu">
            	<a href="/alarm" class="menugroup" style="padding-top: 7px;">
            		<div><span style="font-size: 20px;"><i class="fas fa-bell"></i><span id="alarmcount" class="badge" style="background-color: #d87070; padding: 3px 4px;"></span></span></div>
<%--             			<%@ include file="/WEB-INF/views/alarm/alarmCount.jsp" %> --%>
            		<div>알람</div>
            	</a>
            </li>
            <li class="menu profile">
			  	<a href="#" id="profile" class="menugroup" style="padding-top: 7px;">
            		<div><span style="font-size: 20px;"><i class="fas fa-user-circle"></i></span></div>
            		<div>나</div>
           		</a>
			  	<div id="dropdownProfile">
				  	
				</div>
          	</li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
 </nav>
 
<!-- <script src="/dist/sockjs.js"></script> -->
<script src="/js/sockjs.js"></script>
<script>
	
// 	var search_word = "";
	
// 	if(key.keyCode == 13 && $("#search").val() != null){
// 		$("#search").keydown(function(key){});
// 	}
	
// 	$("#btn_searchword").on("click", function () {
// 		$("#frm_searchword").submit();
// 	});
	
	
// 	var path = window.location.pathname;
// 	console.log(path);
// 	var wsPath = "<c:url value='" + "alarm/alarmCount" + "'/>";

// 	function onOpen(evt) {
// 		console.log("connect");
// 		websocket.send();
// 	}
// 	function onMessage(evt) {
// 		console.log("message >> " + evt.data);
// 		console.log(typeof evt.data);
		
// 		if(evt.data != "0"){
// 			$("#alarmcount").text(evt.data);
// 		}
		
// 	}
// 	function onError(evt) {
// 		console.log("websocket error!")
// 	}
// 	function send_message() {
// 		websocket = new SockJS(wsPath);
		
// 		websocket.onopen = function(evt) {
// 			onOpen(evt);
// 		};
// 		websocket.onmessage = function(evt) {
// 			onMessage(evt);
// 		};
// 		websocket.onerror = function(evt) {
// 			onError(evt);
// 		};
// 	}
	
// 	$(document).ready(function() {
// 		send_message();
// 		setInterval("send_message()", 60000);
// 	});
	
</script>