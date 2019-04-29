<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 





<div class="col-md-6">

	<!-- 헤드 -->
	<div class="panel panel-default">

		<div id="page_area_select_head"
			class="panel-body page_area_select_head">
			<div class="page_area_title">
				<a><i class="far fa-folder-open"
					style="font-size: 40px; margin-right: 10px"></i> <i
					class="fas fa-chevron-right"></i> ${ pVo.portfolio_name } <i
					class="fas fa-chevron-right"></i> ${ sVo.section_name }</a>
			</div>


			<c:if test='${ pVo.user_id == SESSION_MEMBERVO.mem_id }'>
				<button id="writePageBtn" class="btn writePageBtn" onclick="writePage('${ sVo.section_code }')">Page 작성</button>
			</c:if>
		</div>
	</div>
	<!-- 헤드 -->
	
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
								<c:when test="${ pVo.user_id eq SESSION_MEMBERVO.mem_id }">
									<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
									
										<button type="button" class="btn_controll-list" onclick='update_onenote_write("${ page.page_code }")'>
											<i class="fas fa-edit icon"></i>글 수정
										</button>
										
										<button type="button" class="btn_controll-list" onclick='delete_page("${ page.page_code }", "#")'>
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
					<div class="post_socialCount">
						<ul style="padding-left: 10px;">
							<li style="list-style: none; float: left;">
								<button class="btn_count btn_goodcount"
									title="goodCount ${post.post_code }" style="font-size: 12px;">
									추천 <span id="txt_good_count${post.post_code }">${post.goodcount }</span>
								</button>
							</li>
							<li style="list-style: none; float: left;">
								<button class="btn_count btn_commentcount"
									id="btn_commentcount${post.post_code }"
									title="commentCount ${post.post_code }"
									style="font-size: 12px;">
									댓글 <span id="txt_comment_count${post.post_code }">${post.commentcount }</span>
								</button>
							</li>
						</ul>
					</div>
					<!-- 댓글수, 좋아요 수 출력 -->
					
					
					<!-- 댓글, 좋아요버튼 구간 -->
					<div class="col-post-social">
						<!-- 좋아요 버튼 -->
						<button id="good_btn${ page.page_code }" class="btn-social good_btn" onclick="good_page('${ page.page_code }', '#');">
							<i id="good_icon${ page.page_code }" class="far fa-thumbs-up"></i>
						</button>
						<!-- 댓글 출력 버튼 -->
						<button class="btn-social">
							<i class="far fa-comments"></i>
						</button>
					</div>
					<!-- 댓글, 좋아요버튼 구간 -->
					

					<!-- comment -->
					<div class="col-comment-area ${ post.post_code }" id="post_comment${ post.post_code }">
					
					</div>
					<!-- /comment --> 

				</div>
			</div>



		</c:forEach>
</div>


<script>

	//bg index 컬러
	$('#page_area_select_head').css('background-color', '${ pVo.index_color }');
	
	//테두리 index 컬러
	/* $('#page_area_select_head').css('border', '5px solid ${ pVo.index_color }');
	$('#writePageBtn').css('background-color', '${ pVo.index_color }'); */
	
	
	/* 좋아요 효과 세팅 */
	<c:forEach items="${ goodList }" var="good">
		$('#good_btn' + ${ good.ref_code }).css('color', '#5386C5');
		$('#good_btn' + ${ good.ref_code }).css('font-weight', 'bold');
		$('#good_icon' + ${ good.ref_code }).attr('class', 'fas fa-thumbs-up');
		$('#good_btn' + ${ good.ref_code }).attr('onclick', 'cancelGood_page("${ good.good_code }", "${ good.ref_code }", "#");');
	</c:forEach>
	
	
	//페이지 작성 페이지로 이동
	function writePage(section_code) {
		document.location.href = "/page/onenote?section_code=" + section_code;
	}
	
</script>
















