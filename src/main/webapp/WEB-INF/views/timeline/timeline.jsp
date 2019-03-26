<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
  <title>FaceClone</title>

  <link rel="stylesheet" type="text/css" href="/facebook/faceclone-html-template-master/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/facebook/faceclone-html-template-master/css/style.css">
</head>
<body>
	
  <!-- main -->
  <main class="container">
    <div class="row">
      <div class="col-md-3">
        <!-- profile brief -->
        <div class="panel panel-default">
          <div class="panel-body">
            <h4>nicholaskajoh</h4>
            <p>I love to code!</p>
          </div>
        </div>
        <!-- ./profile brief -->

        <!-- friend requests -->
        <div class="panel panel-default">
          <div class="panel-body">
            <h4>friend requests</h4>
            <ul>
              <li>
                <a href="#">johndoe</a> 
                <a class="text-success" href="#">[accept]</a> 
                <a class="text-danger" href="#">[decline]</a>
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
<!--             <input class="form-control" type="text" name="content" placeholder="Make a post..."> -->
            <span class="input-group-btn">
              <button class="btn btn-success" type="submit" name="post">업데이트 남기기</button>
              <button class="btn btn-success" type="submit" name="post">업데이트 남기기</button>
              <button class="btn btn-success" type="submit" name="post">업데이트 남기기</button>
              <button class="btn btn-success" type="submit" name="post">업데이트 남기기</button>
            </span>
          </div>
        </form><hr>
      
        
        <c:forEach items="${testPost }" var="post">
		  <div>
			<div class="panel-body">
			  ${post.user_id }<br><br>
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
            <h4>friends</h4>
            <ul>
              <li>
                <a href="#">광고</a> 
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

  <!-- footer -->
  <footer class="container text-center">
    <ul class="nav nav-pills pull-right">
    </ul>
  </footer>
  <!-- ./footer -->
  <script type="text/javascript" src="/facebook/faceclone-html-template-master/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/facebook/faceclone-html-template-master/js/script.js"></script>
</body>
</html>