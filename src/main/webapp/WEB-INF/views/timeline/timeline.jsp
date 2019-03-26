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
          	<button class="btn_postWrite"><i class="far fa-edit"></i>&nbsp;타임라인에 소식을 전하세요!</button>
          	<a href="#"><i class="far fa-edit"></i>&nbsp;타임라인에 소식을 전하세요!</a>
          	
          	
          	<button class="btn-primary"><i class="fas fa-camera"></i></button>
          	<button class="btn-primary"><i class="fas fa-video"></i></button>
          	<button class="btn-primary"><i class="far fa-file-alt"></i></button>
          	
<!--           	<a href="#"><i class="fas fa-camera"></i></a>&nbsp;&nbsp; -->
<!--           	<a href="#"><i class="fas fa-video"></i></a>&nbsp;&nbsp; -->
<!--           	<a href="#"><i class="far fa-file-alt"></i></a>&nbsp;&nbsp; -->
          </div>
        </form><hr>
      	
        
        <c:forEach items="${testPost }" var="post">
		  <div>
			<div class="panel-body">
			  ${post.mem_id }<br><br>
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
  </main>
  <!-- ./main -->

  <script type="text/javascript" src="/facebook/faceclone-html-template-master/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/facebook/faceclone-html-template-master/js/script.js"></script>
