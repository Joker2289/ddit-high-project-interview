<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html> 
<html>
<head> 

</head>
<body>
<div class="container">
	<div class="row">
		<div>
<!-- 			<section style="text-align: center;"> -->
				<%@ include file="/WEB-INF/views/corporation/module/top.jsp"%>
				<br>
				<%@ include file="/WEB-INF/views/corporation/module/left.jsp"%>
				<br> <br>
				<%@ include file="/WEB-INF/views/corporation/module/write.jsp"%>

				------------- 회사 타임라인 ------------- <br>

				<%
					//제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가                                                   
					request.setCharacterEncoding("utf-8");

					String content = request.getParameter("smarteditor2");

					//콘솔 출력
					System.out.println("내용:" + content);
				%>

				내용 : <br>
				<%=content%>

				<br>

				<c:forEach items="${timelinePost }" var="post">
					<div class="panel panel-default">
						<div id="post_data" class="scrolling" data-post="${post }">
							<div class="panel-body">
								<div class="writer_info">
									<h4>
										<a href="#">${post.writer_name }</a>
									</h4>
									<span>${post.post_date }</span>
								</div>
								<div class="post_info">
									<span>${post.post_contents }</span>
								</div>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
				</c:forEach>
<!-- 			</section> -->
		</div>
	</div>
</div>

	

</body>

</html>