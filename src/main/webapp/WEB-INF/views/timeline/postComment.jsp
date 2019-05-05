<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="comment_area">
	<div class="comment_head_div">
		<div class="image_div">
			<c:choose>
		        <c:when test="${ SESSION_MEMBERVO.mem_division eq 1 }">
		          <img src="/view/imageView?mem_id=${ SESSION_MEMBERVO.mem_id }&division=pf" alt="..." class="img-circle head_profile_img">
		        </c:when>
		        <c:when test="${ SESSION_MEMBERVO.mem_division eq 2 }">
		        	<c:if test="${ fn:contains(SESSION_DETAILVO.logo_path, 'http') }">
		        		 <img src="${ SESSION_DETAILVO.logo_path }" alt="..." class="img-circle head_profile_img">
		        	</c:if>
		        	<c:if test="${ !fn:contains(SESSION_DETAILVO.logo_path, 'http') }">
		        		 <img src="/view/imageView?mem_id=${ SESSION_MEMBERVO.mem_id }&division=pf" alt="..." class="img-circle head_profile_img">
		        	</c:if>
		        </c:when>
		    </c:choose>
	    </div>
	    <div class="textarea_div">
			<textarea id="comment_TXT${ref_code }" class="comment_TXT" name="comment_TXT"></textarea>
			<button class="btn btn-primary insert_img_btn" onclick="add_img();"><i class="far fa-image"></i></button>
			<button class="btn btn-primary ok_btn" onclick="insert_comment('${ref_code}', '${page_num}');"><i class="fas fa-check"></i></button>
		</div>
	</div>
	
	<!-- 댓글 리스트 출력 부분 -->
	<div class="comment_list_div${ page_code }">
	
		<c:forEach items="${ commentList }" var="comment">

			<!-- 댓글 하나 폼 -->
			<div class="comment_div">
				<!-- 댓글 정보 : 프로필, 이름, 등록일, 수정/삭제 버튼 -->
				<div class="comment_info_div">
		
					<!-- 이미지 폼 -->
					<div class="image_div">
						<c:choose>
							<c:when test="${comment.mem_division eq 1 }">
								<img src="/view/imageView?mem_id=${comment.mem_id }&division=pf" alt="..." class="img-circle comment_profile_img">
							</c:when>
							<c:when test="${ comment.mem_division eq 2 }">
								<c:if test="${ fn:contains(comment.profile_path, 'http') }">
									<img src="${ comment.profile_path }" alt="..." class="img-circle comment_profile_img">
								</c:if>
								<c:if test="${ !fn:contains(comment.profile_path, 'http') }">
									<img src="/view/imageView?mem_id=${ comment.mem_id }&division=pf" alt="..." class="img-circle comment_profile_img">
								</c:if>
							</c:when>
						</c:choose>
					</div>
		
					<!-- 정보출력 폼 -->
					<div class="info_div">
		
						<div class="user_name">${comment.writer_name }</div>
		
						<div class="write_date">
						
							<c:choose>
			                  <c:when test="${comment.resultMinute <= 1 }">
			                    <span>방금 전</span>
			                  </c:when>
			                  <c:when test="${comment.resultMinute < 60 }">
			                    <span>${comment.resultMinute }분 전</span>
			                  </c:when>
			                  <c:when test="${comment.resultMinute < 1440 }">
			                    <span>${fn:split((comment.resultMinute/60), '.')[0] }시간 전</span>
			                  </c:when>
			                  <c:when test="${comment.resultMinute < 43200 }">
			                    <span>${fn:split((comment.resultMinute/1440),'.')[0] }일 전</span>
			                  </c:when>
			                  <c:when test="${comment.resultMinute < 518400 }">
			                    <span>${fn:split((comment.resultMinute/43200),'.')[0] }달 전</span>
			                  </c:when>
			                </c:choose>
			                
						</div>
		
						<!-- 삭제버튼 -->
						<c:if test="${SESSION_MEMBERVO.mem_id eq comment.mem_id }">
							<div class="delete_btn">
								<a class="commnet_delete_btn"href="javascript:delete_comment('${ comment.comment_code }', '${ref_code }', '${page_num }');">
									<i class="fas fa-times"></i>
								</a>
							</div>
						</c:if>
					</div>
		
				</div>
		
				<!-- 댓글 내용 -->
				<div class="comment_contents">
					<div id="comment-conetents${comment.comment_code}">${comment.comment_contents }</div>
				</div>
		
			</div>
		</c:forEach>
		
	</div>
	
	<!-- 댓글 더보기 출력 -->
	<c:if test="${commentCnt > (page_num * 5) }">
		<div class="comment_footer">	
			<a class="add_comment_btn" href="javascript:add_comment('${ref_code }', '${page_num }');"> 댓글 더보기.. </a>
		</div>
	</c:if>
	
</div>

<script>

/* summer-note 설정 */
$(".comment_TXT").summernote({
	placeholder: '댓글달기',
	width: '80%',
	height: '30px',
	border: '1px solid #3d3d3d',
	disableResizeEditor: true
});

$(".note-toolbar").hide();
$(".note-resizebar").hide();
$(".note-status-output").remove();
$(".note-editor").css({
	border : '3px solid #F3F6F8'
});
$(".note-frame").css({
	border : '7px solid #4779B2'
});

/* 이미지 삽입 버튼 클릭 */
function add_img(){
	/* 이미지 삽입창 출력 */
	$(".note-insert").children()[1].click();
}


/* 댓글 추가 */
function insert_comment(ref_code, page_num){
	
	var comment_contents = $("#comment_TXT" + ref_code).val();
	 
	$.ajax({
		type: "POST", 
		url : '/writecomment',
		data : {"ref_code" : ref_code, "comment_contents" : comment_contents, "page_num" : page_num},
		success : function(data) {
    	   	
			$('#comment_content' + ref_code).html(data);
		}
	});
}

/* 댓글 삭제 */
function delete_comment(comment_code, ref_code, page_num){
	
	$.ajax({
		url : '/deletecomment',
		data : {"comment_code" : comment_code, "ref_code" : ref_code, "page_num" : page_num },
		success : function(data) {
	
			$('#comment_content' + ref_code).html(data);
		}
	});
	
}

/* 댓글 더보기 */
function add_comment(ref_code, page_num){
	
	console.log(ref_code);
	console.log(page_num);
	
	$.ajax({
		url : '/addcomment',
		data : {"page_num" : page_num, "ref_code" : ref_code },
		success : function(data) {
    	  
			$('#comment_content' + ref_code).html(data);
		}
	});
}

/* 댓글 개수 출력 수정 */
$('#comment_cnt${ref_code}').text(${commentCnt});

</script>

