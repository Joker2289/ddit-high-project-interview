<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

  <!-- main -->
    <div class="row">
      <div class="col-md-3">
        <!-- profile brief -->
        <div class="panel panel-default">
           
          <div class="panel-body">
<%--           	<c:choose> --%>
<%--           	  <c:when test="${detailVO }"> --%>
          	    <div class="col-user-bgimg"></div>
          	    <div class="col-user-profileimg">
            		<span><a>${sessionScope.detailVO.user_name }</a>님 어서오세요!</span><br>
          	    	<a href="#">사진올리기</a>
          	    </div>
            	<div class="col-member-info">
            		
            	</div>
<%--           	  </c:when> --%>
<%--           	</c:choose> --%>
          
            <div class="col"></div>
            <div class="col-member-info">
            </div>
          </div>
          
        </div>
        <!-- ./profile brief -->

        <!-- friend requests -->
        <div class="panel panel-default">
          <div class="panel-body">
            <h4>팔로우 현황 </h4>
            <ul>
              <li>
                <a href="#">싀이바ㅣㄹ</a> 
              </li>
            </ul>
          </div>
        </div>
        <!-- ./friend requests -->
      </div>
      
      <div class="col-md-6">
        <!-- post form -->
<!--         <form method="post" action=""> -->
          <div class="input-group">
          	<button class="btn-write_modal" data-toggle="modal" data-target="write-modal"><a><i class="far fa-edit"></i> 타임라인에 소식을 전하세요!</a></button>
          	<button class="btn-upload"><a><i class="far fa-images"></i></a></button>
          	<button class="btn-upload"><a><i class="far fa-play-circle"></i></a></button>
          	<button class="btn-upload"><a><i class="far fa-file-alt"></i></a></button>
          </div>
<!--         </form> -->
		  <hr>
        
        <c:forEach items="${timelinePost }" var="post">
		  <div>
			<div class="panel-body">
			  <div class="writer_info">
			  	<h4><a>${post.writer_name }</a></h4>
			  </div>
			  <div class="post_info">
			  	<span>${post.post_contents }</span>
			  </div>
			</div>
			<div class="panel-footer">
			  <span>${post.post_date }</span> 
			  <span class="pull-right"><a class="text-danger" href="#">[delete]</a></span>
			</div>
		  </div>
		</c:forEach>
      </div>
      
      <div class="col-md-3">
        <div class="panel panel-default">
          <div class="panel-body">
            <h4>광고자리</h4>
            <ul>
              <li>
                <a href="#">광고띠</a> 
              </li>
            </ul>
          </div>
        </div>  
        <div class="panel panel-default">
          <div class="panel-body">
            <ul>
              <li>
                <a href="#">timeline footer</a> 
              </li>
            </ul>
          </div>
        </div>
        <!-- ./friends -->
      </div>
    </div>
    

  <!-- ./main -->

