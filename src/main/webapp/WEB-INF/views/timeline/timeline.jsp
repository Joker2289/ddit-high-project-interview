<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

  <!-- main -->
  <main class="container">
    <div class="row">
      <div class="col-md-3">
        <!-- profile brief -->
        <div class="panel panel-default">
          <div class="panel-body">
            <h4>프로필 링크</h4>
            <p>끄아ㅏㅏㅏㅏ아앜</p>
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
        <form method="post" action="">
          <div class="input-group">
          	<button class="btn-write_modal" data-toggle="modal" data-target="write-modal"><a><i class="far fa-edit"></i> 타임라인에 소식을 전하세요!</a></button>
          	<button class="btn-upload"><a><i class="far fa-images"></i></a></button>
          	<button class="btn-upload"><a><i class="far fa-play-circle"></i></a></button>
          	<button class="btn-upload"><a><i class="far fa-file-alt"></i></a></button>
          </div>
        </form><hr>
        
        <c:forEach items="${testPost }" var="post">
		  <div>
			<div class="panel-body">
			  <a>${post.mem_id }</a><br><br>
			  ${post.post_contents }<br>
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
    
    <div class="modal fade" id="write-modal" tabindex="-1" role="dialog" aria-labelledby="writeModalLabel" aria-hidden="true">
      <div class="modal-dialog">
      	<div class="modal-content">
      	  
      	  <div class="modal-header">
      	  	<label>대가리입니다.</label>
      	  </div>
      	  
      	  <div class="modal-body">
      	  	<label>몸뚱아리입니다.</label>
      	  </div>
      	  
      	  <div class="modal-foot">
      	  	<label>발바닥입니다.</label>
      	  </div>
      	  
      	</div>
      </div>
    </div>
    
  </main>
  <!-- ./main -->

  <script type="text/javascript" src="/facebook/faceclone-html-template-master/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/facebook/faceclone-html-template-master/js/script.js"></script>
