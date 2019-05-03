<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="/css/alarm/alarm.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container">
  <div class="row">
    <%@ include file="/WEB-INF/views/alarm/alarm_left.jsp" %>
  
	<div class="col-md-6" style="margin-right: -25px; ">
	  <div class="row">
	  
		<div class="col-md-12" style="width: 575px;">
		
		  <!-- 최근 알림 --><!-- recentList -->
		  <div id="division_recent" class="whiteBox division_recent" style="padding-top: 10px; margin-bottom: 10px;">
		    <div class="alarm_recent-area">
		      <div class="alarm_recent" style="border-bottom: 1px solid #ddd; padding-left: 15px; padding-right: 15px;">
		        <h4 style="margin-bottom: 5px; margin-top: 5px;">최근</h4>
		      </div>
		      
		      <c:forEach items="${recentList }" var="recentAlarm">
		        <div class="recentAlarm_contents" id="recentAlarm_contents${recentAlarm.alarm_code }" data-code="${recentAlarm.alarm_code }" style="min-height: 80px; border-bottom: 1px solid #ddd;">
		          <div id="alarm${recentAlarm.alarm_code }">
		  	        <div class="profile_img" style="float: left;">
		  	          <c:choose>
		  	          
		  	          	<c:when test="${recentAlarm.mem_division == '1' }">
		  	          		<c:choose>
		  	          			<c:when test="${fn:contains(recentAlarm.profile_path, 'http') }">
		  	          				<img class="user_profile_img" style="border: 1px solid #ddd;" src="${recentAlarm.profile_path }">
		  	          			</c:when>
		  	          			<c:otherwise>
		  	          				<img class="user_profile_img" style="border: 1px solid #ddd;" src="${ cp }/view/imageView?mem_id=${recentAlarm.send_id }&division=pf">
		  	          			</c:otherwise>
		  	          		</c:choose>
		  	          	</c:when>
		  	          	
		  	          	<c:when test="${recentAlarm.mem_division == '2' }">
							<c:choose>
								<c:when test="${fn:contains(recentAlarm.profile_path, 'http') }">
									<img class="corp_profile_img" style="border: 1px solid #ddd;" src="${recentAlarm.profile_path }">
								</c:when>
								<c:otherwise>
									<img class="corp_profile_img" style="border: 1px solid #ddd;" src="${ cp }/view/imageView?mem_id=${recentAlarm.send_id }&division=pf">
								</c:otherwise>
							</c:choose>
		  	          	</c:when>
		  	          	
		  	          </c:choose>
		  	        </div>
		  	        <div class="alarm_view" id="alarm_view${recentAlarm.alarm_code }" data-code="${recentAlarm.alarm_code }" style="float: left;">
		  	          <c:choose>
		  	          
		  	            <c:when test="${recentAlarm.division == '28' && recentAlarm.alarm_separate == '01' }">
		  	              <h4 class="txt_alarm_contents">
		  	                <a href="/postdetail?post_code=${recentAlarm.ref_code }&mem_id=${recentAlarm.mem_id }&ref_code=${recentAlarm.ref_code }">
		  	                  <c:if test="${fn:length(recentAlarm.send_name) >= 8 }">
		  	                    <span style="font-weight: bold; color: #0073b1;">${fn:substring(recentAlarm.send_name,0, 8) }</span>... 님이 회원님의 게시글을 추천함
		  	                  </c:if> 
		  	                  <c:if test="${fn:length(recentAlarm.send_name) < 8 }">
		  	                  	<span style="font-weight: bold; color: #0073b1;">${recentAlarm.send_name }</span> 님이 회원님의 게시글을 추천함
		  	                  </c:if>
		  	                </a>
		  	              </h4>
		  	            </c:when>
		  	            
		  	            <c:when test="${recentAlarm.division == '28' && recentAlarm.alarm_separate == '02' }">
		  	              <h4 class="txt_alarm_contents">
		  	                <a href="/postdetail?post_code=${recentAlarm.ref_code }&mem_id=${recentAlarm.mem_id }&ref_code=${recentAlarm.ref_code }">
		  	                  <c:if test="${fn:length(recentAlarm.send_name) >= 8 }">
		  	                    <span style="font-weight: bold; color: #0073b1;">${fn:substring(recentAlarm.send_name,0, 8) }</span>... 님이 회원님의 게시글에 댓글을 남김
		  	                  </c:if> 
		  	                  <c:if test="${fn:length(recentAlarm.send_name) < 8 }">
		  	                  	<span style="font-weight: bold; color: #0073b1;">${recentAlarm.send_name }</span> 님이 회원님의 게시글에 댓글을 남김
		  	                  </c:if>
		  	                </a>
		  	              </h4>
		  	            </c:when>
		  	            
		  	            <c:when test="${recentAlarm.division == '29' && recentAlarm.alarm_separate == '03' }">
		  	              <h4 class="txt_alarm_contents">
		  	                <a href="/postdetail?post_code=${recentAlarm.ref_code }&mem_id=${recentAlarm.mem_id }&ref_code=${recentAlarm.ref_code }">
		  	                  <c:if test="${fn:length(recentAlarm.send_name) >= 8 }">
		  	                    <span style="font-weight: bold; color: #0073b1;">${fn:substring(recentAlarm.send_name,0, 8) }</span>... 님이 회원님의 댓글을 추천함
		  	                  </c:if> 
		  	                  <c:if test="${fn:length(recentAlarm.send_name) < 8 }">
		  	                  	<span style="font-weight: bold; color: #0073b1;">${recentAlarm.send_name }</span> 님이 회원님의 댓글을 추천함
		  	                  </c:if>
		  	                </a>
		  	              </h4>
		  	            </c:when>
		  	            
		  	            <c:when test="${recentAlarm.division == '25' && recentAlarm.alarm_separate == '04' }">
		  	              <h4 class="txt_alarm_contents">
		  	                <a href="/profileHome?user_id=${recentAlarm.send_id }">
		  	                  <span style="font-weight: bold; color: #0073b1;">${recentAlarm.send_name }</span> 님이 회원님에게 일촌을 신청함
		  	                </a>
		  	              </h4>
		  	            </c:when>
		  	            
		  	            <c:when test="${recentAlarm.division == '25' && recentAlarm.alarm_separate == '05' }">
		  	              <h4 class="txt_alarm_contents">
		  	                <a href="/profileHome?user_id=${recentAlarm.send_id }">
		  	                  <span style="font-weight: bold; color: #0073b1;">${recentAlarm.send_name }</span> 님이 회원님의 일촌신청을 수락함
		  	                </a>
		  	              </h4>
		  	            </c:when>
		  	            
		  	            <c:when test="${recentAlarm.division == '14' && recentAlarm.alarm_separate == '06' }">
		  	              <!-- 회원일 경우 회원 프로필로 링크 연결 -->
		  	              <c:if test="${recentAlarm.mem_division == 1 }">
		  	                <h4 class="txt_alarm_contents">
		  	                  <a href="/profileHome?user_id=${recentAlarm.send_id }">
		  	                    <span style="font-weight: bold; color: #0073b1;">${recentAlarm.send_name }</span> 님이 회원님을 팔로우함
		  	                  </a>
		  	                </h4>
		  	              </c:if>
		  	              <!-- 회사일 경우 회사 페이지로 링크 연결 -->
		  	              <c:if test="${recentAlarm.mem_division == 2 }">
		  	                <h4 class="txt_alarm_contents">
		  	                  <a href="/corporation?corp_id=${recentAlarm.send_id }">
		  	                    <c:if test="${fn:length(recentAlarm.send_name) >= 8 }">
		  	                      <span style="font-weight: bold; color: #0073b1;">${fn:substring(recentAlarm.send_name, 0, 8) }</span>... 님이 회원님을 팔로우함
		  	                  	</c:if> 
		  	                    <c:if test="${fn:length(recentAlarm.send_name) < 8 }">
		  	                  	  <span style="font-weight: bold; color: #0073b1;">${recentAlarm.send_name }</span> 님이 회원님을 팔로우함
		  	                    </c:if>
		  	                  </a>
		  	                </h4>
		  	              </c:if>
		  	            </c:when>
		  	            
		  	            <c:when test="${recentAlarm.division == '2' && recentAlarm.alarm_separate == '07' }">
		  	              <h4 class="txt_alarm_contents">
		  	                <span style="font-weight: bold; color: #0073b1;">${recentAlarm.send_name }</span> 님이 채용공고에 지원함
		  	              </h4>
		  	            </c:when>
		  	            
		  	            <c:when test="${recentAlarm.division == '34' && recentAlarm.alarm_separate == '08' }">
		  	              <a href="/recr_detail?recruit_code=${recentAlarm.ref_code }">
		  	                <h4 class="txt_alarm_contents">
							  <c:if test="${fn:length(recentAlarm.send_name) >= 8 }">
							    <span style="font-weight: bold; color: #0073b1;">${fn:substring(recentAlarm.send_name, 0, 8) }</span>...으로부터 새로운 채용공고가 검색됨
							  </c:if> 
							  <c:if test="${fn:length(recentAlarm.send_name) < 8}">
							    <span style="font-weight: bold; color: #0073b1;">${recentAlarm.send_name }</span>으로부터 새로운 채용공고가 검색됨
							  </c:if> 
							</h4>
		  	              </a>
		  	            </c:when>
		  	            
		  	          </c:choose>
		  	        </div>
		  	        
		  	        <!-- 알림 관리버튼 드롭다운 -->
		  	        <div class="dropdown col-time" style="float: right;">
		  	          <div>
		  	            <button class="btn_alarmControll" style="width: 30px;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		  	              <i class="fas fa-ellipsis-h" style="font-size: 18px;"></i>
		  	            </button>
		  	            <ul class="dropdown-menu manage_alarm" role="menu" aria-labelledby="dLabel" style="margin-top: -30px;">
		  		          <button id="btn_deleteAlarm${recentAlarm.alarm_code }" type="button" class="btn_controll-list btn_deleteAlarm" data-code="${recentAlarm.alarm_code }" data-division="recent">
		  		            <i class="far fa-trash-alt"></i>&nbsp;<span>삭제</span>
		  		          </button><br>
		  		          <button id="btn_offAlarm" type="button" class="btn_controll-list">
		  		            <i class="far fa-bell-slash"></i>&nbsp;<span>알림끄기</span>
		  		          </button><br>
		  		          <button id="btn_unfollow${recentAlarm.alarm_code }" type="button" class="btn_controll-list btn_unfollow" data-code="${recentAlarm.alarm_code }" data-division="recent" data-id="${recentAlarm.send_id }" data-name="${recentAlarm.send_name }">
		  		            <i class="fas fa-ban"></i></i>&nbsp;<span>언팔로우</span>
		  		          </button>
		  		        </ul>
		  	          </div>
		  	          <p>
                        <c:choose>
                          <c:when test="${recentAlarm.resultMinute <= 1 }">
                            <span style="color: #8D9191;">방금 전</span>
                          </c:when>
                          <c:when test="${recentAlarm.resultMinute < 60 }">
                            <span style="color: #8D9191;">${recentAlarm.resultMinute }분</span>
                          </c:when>
                          <c:when test="${recentAlarm.resultMinute < 1440 }">
                            <span style="color: #8D9191;">${fn:split((recentAlarm.resultMinute/60), '.')[0] }시간</span>
                          </c:when>
                          <c:when test="${recentAlarm.resultMinute < 43200 }">
                            <span style="color: #8D9191;">${fn:split((recentAlarm.resultMinute/1440),'.')[0] }일</span>
                          </c:when>
                          <c:when test="${recentAlarm.resultMinute < 518400 }">
                            <span style="color: #8D9191;">${fn:split((recentAlarm.resultMinute/43200),'.')[0] }달</span>
                          </c:when>
                        </c:choose>
		  	          </p>
		  	        </div>
		  	      </div>
		  	    </div>
		      </c:forEach>
		    </div>
		    
		    <!-- 더보기 버튼 -->
		    <div class="col-moreAlarm">
	    	  <button class="btn_moreAlarm" id="btn_moreRecent">
	    	    <span style="font-size: 17px;">더보기 </span>
	    	  </button>
		    </div>
		  </div>
		  
		  <!-- 이전 알림 --><!-- previousList -->
		  <div id="division_previous" class="whiteBox" style="padding-top: 10px; margin-bottom: 10px;">
		    <div class="alarm_previous-area">
		      <div class="alarm_previous" style="border-bottom: 1px solid #ddd; padding-left: 15px; padding-right: 15px;">
		        <h4 style="margin-bottom: 5px; margin-top: 5px;">이전</h4>
		      </div>
		      
			  <c:forEach items="${previousList }" var="previousAlarm">
		        <div class="previousAlarm_contents" id="alarm_contents${previousAlarm.alarm_code }" data-code="${previousAlarm.alarm_code }" style="min-height: 80px; border-bottom: 1px solid #ddd;">
			      <div id="alarm${recentAlarm.alarm_code }">
			        <div class="profile_img" style="float: left;">
			          <c:choose>
			            <c:when test="${previousAlarm.profile_path != null }">
			              <img class="user_profile_img" style="border: 1px solid #ddd;" src="${ cp }/view/imageView?mem_id=${previousAlarm.send_id }&division=pf">
			            </c:when>
			            <c:otherwise>
			              <img class="user_profile_img" style="border: 1px solid #ddd;" src="/images/profile/basicProfile.png">
			            </c:otherwise>
			          </c:choose>
			        </div>
			        <div class="alarm_view" id="alarm_view${previousAlarm.alarm_code }" data-code="${previousAlarm.alarm_code }" style="float: left;">
		  	          <c:choose>
		  	            <c:when test="${previousAlarm.division == '28' && previousAlarm.alarm_separate == '01' }">
		  	              <h4 style="height: 30px; padding-top: 5px;">
		  	                <a href="/postdetail?post_code=${previousAlarm.ref_code }&mem_id=${previousAlarm.mem_id }&ref_code=${previousAlarm.ref_code }">
		  	                  <c:if test="${fn:length(previousAlarm.send_name) >= 8 }">
		  	                    ${fn:substring(previousAlarm.send_name,0, 8) }... 님이 회원님의 게시글을 추천함
		  	                  </c:if> 
		  	                  <c:if test="${fn:length(previousAlarm.send_name) < 8 }">
		  	                  	${previousAlarm.send_name }님이 회원님의 게시글을 추천함
		  	                  </c:if>
		  	                </a>
		  	              </h4>
		  	            </c:when>
		  	            <c:when test="${previousAlarm.division == '28' && previousAlarm.alarm_separate == '02' }">
		  	              <h4 style="height: 30px; padding-top: 5px;">
		  	                <a href="/postdetail?post_code=${previousAlarm.ref_code }&mem_id=${previousAlarm.mem_id }&ref_code=${previousAlarm.ref_code }">
		  	                  <c:if test="${fn:length(previousAlarm.send_name) >= 8 }">
		  	                    ${fn:substring(previousAlarm.send_name,0, 8) }... 님이 회원님의 게시글에 댓글을 남김
		  	                  </c:if> 
		  	                  <c:if test="${fn:length(previousAlarm.send_name) < 8 }">
		  	                  	${previousAlarm.send_name } 님이 회원님의 게시글에 댓글을 남김
		  	                  </c:if>
		  	                </a>
		  	              </h4>
		  	            </c:when>
		  	            <c:when test="${previousAlarm.division == '29' && previousAlarm.alarm_separate == '03' }">
		  	              <h4 style="height: 30px; padding-top: 5px;">
		  	                <a href="/postdetail?post_code=${previousAlarm.ref_code }&mem_id=${previousAlarm.mem_id }&ref_code=${previousAlarm.ref_code }">
		  	                  <c:if test="${fn:length(previousAlarm.send_name) >= 8 }">
		  	                    ${fn:substring(previousAlarm.send_name,0, 8) }... 님이 회원님의 댓글을 추천함
		  	                  </c:if> 
		  	                  <c:if test="${fn:length(previousAlarm.send_name) < 8 }">
		  	                  	${previousAlarm.send_name } 님이 회원님의 댓글을 추천함
		  	                  </c:if>
		  	                </a>
		  	              </h4>
		  	            </c:when>
		  	            <c:when test="${previousAlarm.division == '25' && previousAlarm.alarm_separate == '04' }">
		  	              <h4 style="height: 30px; padding-top: 5px;">
		  	                <a href="/profileHome?user_id=${previousAlarm.send_id }">${previousAlarm.send_name } 님이 회원님에게 일촌을 신청함</a>
		  	              </h4>
		  	            </c:when>
		  	            <c:when test="${previousAlarm.division == '25' && previousAlarm.alarm_separate == '05' }">
		  	              <h4 style="height: 30px; padding-top: 5px;">
		  	                <a href="/profileHome?user_id=${previousAlarm.send_id }">${previousAlarm.send_name } 님이 회원님의 일촌신청을 수락함</a>
		  	              </h4>
		  	            </c:when>
		  	            <c:when test="${previousAlarm.division == '14' && previousAlarm.alarm_separate == '06' }">
		  	              <!-- 회원일 경우 회원 프로필로 링크 연결 -->
		  	              <c:if test="${previousAlarm.mem_division == 1 }">
		  	                <h4 style="height: 30px; padding-top: 5px;">
		  	                  <a href="/profileHome?user_id=${previousAlarm.send_id }">${previousAlarm.send_name } 님이 회원님을 팔로우함</a>
		  	                </h4>
		  	              </c:if>
		  	              <!-- 회사일 경우 회사 페이지로 링크 연결 -->
		  	              <c:if test="${previousAlarm.mem_division == 2 }">
		  	                <h4 style="height: 30px; padding-top: 5px;">
		  	                  <a href="/corporation?corp_id=${previousAlarm.send_id }">
		  	                    <c:if test="${fn:length(previousAlarm.send_name) >= 8 }">
		  	                      ${fn:substring(previousAlarm.send_name, 0, 8) }... 님이 회원님을 팔로우함
		  	                  	</c:if> 
		  	                    <c:if test="${fn:length(previousAlarm.send_name) < 8 }">
		  	                  	  ${previousAlarm.send_name } 님이 회원님을 팔로우함
		  	                    </c:if>
		  	                  </a>
		  	                </h4>
		  	              </c:if>
		  	            </c:when>
		  	            <c:when test="${previousAlarm.division == '2' && previousAlarm.alarm_separate == '07' }">
		  	              <h4 style="height: 30px; padding-top: 5px;">${previousAlarm.send_name } 님이 채용공고에 지원함</h4>
		  	            </c:when>
		  	            <c:when test="${previousAlarm.division == '34' && previousAlarm.alarm_separate == '08' }">
		  	              <a href="/recr_detail?recruit_code=${previousAlarm.ref_code }">
		  	                <h4 style="height: 30px; padding-top: 5px;">
							  <c:if test="${fn:length(previousAlarm.send_name) >= 8 }">
							    ${fn:substring(previousAlarm.send_name, 0, 8) }...님으로부터 새로운 채용공고가 검색됨
							  </c:if> 
							  <c:if test="${fn:length(previousAlarm.send_name) < 8}">
							    ${previousAlarm.send_name }님으로부터 새로운 채용공고가 검색됨
							  </c:if> 
							</h4>
		  	              </a>
		  	            </c:when>
		  	          </c:choose>
		  	        </div>
			      
			        <!-- 알림 관리버튼 드롭다운 -->
			        <div class="dropdown" style="float: right; min-width: 45px; max-width: 45px;">
			          <div>
			            <button class="btn_alarmControll" style="width: 30px;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			              <i class="fas fa-ellipsis-h" style="font-size: 18px;"></i>
			            </button>
			            <ul class="dropdown-menu manage_alarm" role="menu" aria-labelledby="dLabel" style="margin-top: -30px;">
			    	        <button id="btn_deleteAlarm" type="button" class="btn_controll-list" data-code="${previousAlarm.alarm_code }" data-division="previous">
			    	          <i class="far fa-trash-alt"></i>&nbsp;<span>삭제</span>
			    	        </button><br>
			    	        <button id="btn_offAlarm" type="button" class="btn_controll-list">
			    	          <i class="far fa-bell-slash"></i>&nbsp;<span>알림끄기</span>
			    	        </button><br>
			    	        <button id="btn_unfollow" type="button" class="btn_controll-list" data-code="${previousAlarm.alarm_code }" data-division="previous" data-id="${previousAlarm.send_id }" data-name="${previousAlarm.send_name }">
			    	          <i class="fas fa-ban"></i></i>&nbsp;<span>언팔로우</span>
			    	        </button>
			    	      </ul>
			          </div>
			    	  <p>
                        <c:choose>
                          <c:when test="${previousAlarm.resultMinute <= 1 }">
                            <span style="color: #8D9191;">방금 전</span>
                          </c:when>
                          <c:when test="${previousAlarm.resultMinute < 60 }">
                              <span style="color: #8D9191;">${previousAlarm.resultMinute }분</span>
                          </c:when>
                          <c:when test="${previousAlarm.resultMinute < 1440 }">
                            <span style="color: #8D9191;">${fn:split((previousAlarm.resultMinute/60), '.')[0] }시간</span>
                          </c:when>
                          <c:when test="${previousAlarm.resultMinute < 43200 }">
                            <span style="color: #8D9191;">${fn:split((previousAlarm.resultMinute/1440),'.')[0] }일</span>
                          </c:when>
                          <c:when test="${previousAlarm.resultMinute < 518400 }">
                            <span style="color: #8D9191;">${fn:split((previousAlarm.resultMinute/43200),'.')[0] }달</span>
                          </c:when>
                        </c:choose>
			          </p>
			        </div>
			      </div>  
			    </div>
		      </c:forEach>
		    </div>
		    
			<div class="col-moreAlarm">
	    	  <button class="btn_moreAlarm" id="btn_morePrevious">
	    	    <span style="font-size: 17px;">더보기 </span>
	    	  </button>
		    </div>
		    
		  </div>
		</div>
		
	  </div>
	</div>
  	
    <%@ include file="/WEB-INF/views/alarm/alarm_right.jsp" %>
  </div>
</div>

<script src="/js/alarm.js"></script>
<script>

	var recentCount = parseInt('${recentCount}');
	var previousCount = parseInt('${previousCount}');
	
	console.log("total recent count >>> " + recentCount);
	console.log("recentAlarm count >>> " + $(".recentAlarm_contents").length);
	
	
	if($(".recentAlarm_contents").length < recentCount){
		$("#btn_moreRecent").show();
	} else {
		$("#btn_moreRecent").hide();
	}
	
	if($(".recentAlarm_contents").length < previousCount){
		$("#btn_morePrevious").show();
	} else {
		$("#btn_morePrevious").hide();
	}

	$(document).ready(function(){
		//////////////////////////// newList
		// newList 슬라이드
		newList_slide = setInterval("fn_newSlide()", 4000);
		
		// newList 마우스오버 - 슬라이드 멈춤.
		$("#div_newList").on("mouseover", function(){
			newSlide_flag = false;
		});
		$("#div_newList").on("mouseout", function(){
			newSlide_flag = true;
		});		
		
		// newList 슬라이드 버튼 클릭.
		$(".fa-circle").on("click", function(){
//			alert($(this).index());
			$(".fa-circle:eq("+ (newList_num-1) +")").attr("class", "far fa-circle");
			$(this).attr("class", "fas fa-circle");	
			
			// 이동할 칸 수. (move_page)
			var move_page = ($(this).index()) - (newList_num-1);
			
			// newList_num 변경.
			newList_num = ($(this).index())+1;
			
			// 슬라이드 이동.
			$("#content_newList").stop(true, true);
			var moveX = parseInt($("#content_newList").css("margin-left"));
			
			if( moveX > -3000 ){
				$("#content_newList").animate({"margin-left":"-=" + newSlide_width*move_page + "px"}, 500);
			}
		});
		
		// 채용공고 클릭.
		$(".recr").on("click", function(){
// 			alert($(this).data("code"));
			window.location.href = '${pageContext.request.contextPath }/recr_detail?recruit_code='+ $(this).data("code") +'&req_page=alarm';
		});
		
		//////////////////////////// newList	 		
	});
	
	////////////////////////////newList
	
	// div_newList 마우스오버 시 false - 슬라이드 멈춤.
	var newSlide_flag = true;	
	
	// 자동 슬라이드
	var newSlide_width = 290;
	var newList_num = 1;
	
	function fn_newSlide(){
		if(newSlide_flag == false){
			return;
		}
		
		if(newList_num > 6){
// 			clearInterval(slide_switch);
			$("#content_newList").css("margin-left", "0px");
			newList_num = 0;
		}
		
		newList_num++;
		
		$("#content_newList").stop(true, true);
		var moveX = parseInt($("#content_newList").css("margin-left"));
		
		if( moveX > -2000 ){
			// 버튼 class 바꾸기.
			if(newList_num == 1){
				$(".fa-circle:eq(6)").attr("class", "far fa-circle");
				$(".fa-circle:eq("+ (newList_num-1) +")").attr("class", "fas fa-circle");
			}else{
				$(".fa-circle:eq("+ (newList_num-2) +")").attr("class", "far fa-circle");
				$(".fa-circle:eq("+ (newList_num-1) +")").attr("class", "fas fa-circle");
			}
			
			$("#content_newList").animate({"margin-left":"-=" + newSlide_width + "px"}, 500);
		}
	}	
	
	//////////////////////////// newList	
</script>