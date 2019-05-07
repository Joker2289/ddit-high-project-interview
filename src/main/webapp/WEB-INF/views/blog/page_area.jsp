<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 





<div id="no_page_area" class="col-md-6">
	<div class="panel panel-default">

		<div id="page_area_select_head" class="panel-body page_area_select_head">
			<div class="page_area_title">
				<i class="far fa-edit"></i> 최근 게시물
			</div>
		
			<div class="search_div">
				<input id="seach_form" type="text" class="form-control search_TXT" placeholder="Search">
				<div class="search_btn_div" onclick="page_search('${ user_id }');"><a class="search_btn"><i class="fas fa-search"></i></a></div>
			</div>
		</div>
		
	</div>
	
	<!-- page -->
	<c:forEach items="${ pageList }" var="page">
		
		<div id="col-post${ page.page_code }" class="scrolling" data-post="${ page.page_code }" style="box-shadow: 0 6px 12 rgba(0, 0, 0, .15);">
			<div class="col-post" id="page${ page.page_code }">
				<!-- 대가리 -->
				<div class="col-post-body">
				
					<!-- 글 제목, 작성일 감싸기 -->
					<div class="writer_info">
						
						<a class="page_title" href="/page/page_view?page_code=${ page.page_code }">${ page.page_title }</a>		
                	   
                	   		<div class="page_write_date"><fmt:formatDate value="${ page.write_date }" pattern="yyyy-MM-dd" /></div>
					</div>
					<!-- 글 제목, 작성일 감싸기 --> 
					
					<!-- 게시물 관리버튼(dropdown) -->
					<div class="dropdown" style="float: right;">
						<button class="btn_postControll" data-code="${ page.page_code }"
							type="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="float: right;">
							<i class="fas fa-ellipsis-h"></i>
						</button>
						<c:choose>
							<c:when test="${ user_id eq SESSION_MEMBERVO.mem_id }">
								<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
								
									<button type="button" class="btn_controll-list" onclick='update_onenote_write(${ page.page_code })'>
										<i class="fas fa-edit icon"></i>글 수정
									</button>
									
									<button type="button" class="btn_controll-list" onclick='delete_page("${ page.page_code }", "${ user_id }")'>
										<i class="fas fa-ban icon"></i>글 삭제
									</button>
								</ul>
							</c:when>
							<c:otherwise>
								<ul class="dropdown-menu" role="menu"
									aria-labelledby="dLabel">
									<button id="btn_reportPost${ page.page_code }" data-code="${ page.page_code }" type="button" class="btn_controll-list" style="padding-right: 84.22px;">
										<i class="far fa-flag icon"></i>글 신고
									</button>
								</ul>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 게시물 관리버튼(dropdown) -->
					
				</div>
				<!-- 대가리 -->
				
				
				<!-- 몸통 -->
				<div class="page_body">
					<a href="/page/page_view?page_code=${ page.page_code }"><img class="page_thumbnail" src="/page/onenoteImageView?src=${ page.page_thumbnail }"></a>
				</div>
				<!-- 몸통 -->
				
				
				<!-- 댓글수, 좋아요 수 출력 -->
				<div class="post_socialCount" style="margin-bottom: 5px;">
					<ul style="padding-left: 10px;">
						<li style="list-style: none; float: left;">
							<button class="btn_count btn_goodcount" style="font-size: 15px;">
								추천
								<c:if test="${ page.good_cnt != null }">
									${ page.good_cnt }
								</c:if>
								<c:if test="${ page.good_cnt == null }">
									0
								</c:if>
							</button>
						</li>
						<li style="list-style: none; float: left;">
							<button class="btn_count btn_commentcount" style="font-size: 15px;">
								댓글 
								<c:if test="${ page.comment_cnt != null }">
									<span id="comment_cnt${ page.page_code }">${ page.comment_cnt }</span>
								</c:if>
								<c:if test="${ page.comment_cnt == null }">
									<span id="comment_cnt${ page.page_code }">0</span>
								</c:if>
							</button>
						</li>
					</ul>
				</div>
				<!-- 댓글수, 좋아요 수 출력 -->
				
				
				<!-- 댓글, 좋아요버튼 구간 -->
				<div class="col-post-social">
					<!-- 좋아요 버튼 -->
					<button id="good_btn${ page.page_code }" class="btn-social good_btn" onclick="good_page('${ page.page_code }', '${ user_id }');">
						<i id="good_icon${ page.page_code }" class="far fa-thumbs-up"></i>
					</button>
					<!-- 댓글 출력 버튼 -->
					<button class="btn-social" data-toggle="collapse" data-target="#comment_area${ page.page_code }" aria-expanded="false" aria-controls="collapseExample" onclick="page_commentList('${ page.page_code }');">
							<i class="far fa-comments"></i>
					</button>
				</div>
				<!-- 댓글, 좋아요버튼 구간 -->
				

				<!-- 댓글 출력 구간 -->
				<div class="collapse" id="comment_area${ page.page_code }">
				  <div class="well" id="comment_content${ page.page_code }">
				    
				  </div>
				</div>
				<!-- 댓글 출력 구간 -->
					 

			</div>
		</div>



	</c:forEach>
	
	
</div>

<script>

	/* 좋아요 효과 세팅 */
	<c:forEach items="${ goodList }" var="good">
		$('#good_btn' + ${ good.ref_code }).css('color', '#5386C5');
		$('#good_btn' + ${ good.ref_code }).css('font-weight', 'bold');
		$('#good_icon' + ${ good.ref_code }).attr('class', 'fas fa-thumbs-up');
		$('#good_btn' + ${ good.ref_code }).attr('onclick', 'cancelGood_page("${ good.good_code }", "${ good.ref_code }", "${ user_id }");');
	</c:forEach>

	/* 프로필 area의 추천수 업데이트 */
	<c:if test="${ pageCnt != null }">
		var pageCnt = '${ pageCnt }';
		$('#page_cnt').text(pageCnt);
	</c:if>
	
	/* 프로필 area의 추천수 업데이트 */
	<c:if test="${ goodCnt != null }">
		var goodCnt = '${ goodCnt }';
		$('#good_cnt').text(goodCnt);
	</c:if>
	
	/* 페이지 검색 */
	function page_search(user_id){
		
		var search_word = $('#seach_form').val();
		
		$.ajax({
			url : "${cp}/page/page_search",
			data : { "search_word" : search_word, "user_id" : user_id},
			success : function(data) {
				
				$('#page_area').html(data);
				$('#seach_form').focus();			
			}
		});
		
	}
	
	/* 검색결과 alert */
	if( '${searchCnt}' != ''){
		<c:if test="${ searchCnt != 0 }">
			var searchCnt = '${ searchCnt }';
			alert("검색 결과 " + searchCnt + " 건");
		</c:if>
		
		<c:if test="${ searchCnt == 0 }">
			alert("검색 결과가 없습니다");
		</c:if>
	}	
	
	/* 검색창 입력후 ENTER */
	$('#seach_form').on('keypress', function(e){
		
		var key = e.keyCode;
		var user_id = '${ user_id }';
		
		if(key == 13){
			page_search(user_id);
		}
		
	});

	
	var i = 0;
	<c:forEach items="${ pageList }" var="page">
		i++;
	</c:forEach>
	
	$(document).ready(function(){
		if(i == 0){
			$('#no_page_area').append('<div class="panel panel-default no_page_area"><a class="no_page_area_comment">작성된 페이지가 없습니다</a></div>');
		}
	});
	

</script>















