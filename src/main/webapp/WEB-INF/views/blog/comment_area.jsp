<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 


<div class="comment_area">
	<div class="comment_head_div">
		<div class="image_div">
			<c:choose>
		        <c:when test="${ SESSION_MEMBERVO.mem_division eq 1 }">
		          <img src="/view/imageView?mem_id=${ SESSION_MEMBERVO.mem_id }&division=pf" alt="..." class="img-circle head_profile_img">
		        </c:when>
		        <c:when test="${ SESSION_MEMBERVO.mem_division eq 2 }">
		        	<c:if test="${ fn:contains(SESSION_DETAILVO.logo_path, 'http') } }">
		        		 <img src="${ SESSION_DETAILVO.logo_path }" alt="..." class="img-circle head_profile_img">
		        	</c:if>
		        	<c:if test="${ !fn:contains(SESSION_DETAILVO.logo_path, 'http') } }">
		        		 <img src="/view/imageView?mem_id=${ SESSION_MEMBERVO.mem_id }&division=pf" alt="..." class="img-circle head_profile_img">
		        	</c:if>
		        </c:when>
		    </c:choose>
	    </div>
	    <div class="textarea_div">
				<textarea id="comment_TXT${ page_code }" class="comment_TXT" name="comment_TXT"></textarea>
				<button class="btn btn-primary insert_img_btn" onclick="add_img();"><i class="far fa-image"></i></button>
				<button class="btn btn-primary ok_btn" onclick="insert_comment(${ page_code });"><i class="fas fa-check"></i></button>
		</div>
	</div>
	
	<!-- 댓글 리스트 출력 부분 -->
	<div class="cmment_list_div">
	
		<c:forEach items="${ commentList }" var="comment">
		
			<!-- 댓글 하나 폼 -->
			<div class="comment_div">
				<!-- 댓글 정보 : 프로필, 이름, 등록일, 수정/삭제 버튼 -->
				<div class="comment_info_div">
					
					<!-- 이미지 폼 -->
					<div class="image_div">
						<c:choose>
					        <c:when test="${ comment.mem_division eq 1 }">
					          <img src="/view/imageView?mem_id=${ comment.mem_id }&division=pf" alt="..." class="img-circle comment_profile_img">
					        </c:when>
					        <c:when test="${ comment.mem_division eq 2 }">
					        	<c:if test="${ fn:contains(comment.profile_path, 'http') } }">
					        		 <img src="${ comment.profile_path }" alt="..." class="img-circle comment_profile_img">
					        	</c:if>
					        	<c:if test="${ !fn:contains(comment.profile_path, 'http') } }">
					        		 <img src="/view/imageView?mem_id=${ comment.mem_id }&division=pf" alt="..." class="img-circle comment_profile_img">
					        	</c:if>
					        </c:when>
					    </c:choose>
				    </div>
				    
				    <!-- 정보출력 폼 -->
				    <div class="info_div">
				    
				    	<div class="user_name">${ comment.writer_name }</div>
				    	
				    	<div class="write_date"><fmt:formatDate value="${ comment.comment_date }" pattern="yyyy-MM-dd" /></div>
				    	
				    
				    	<!-- 메뉴 -->
				    	<div class="dropdown user_menu">
		                    <a class="btn_commentControll" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  	              <i class="fas fa-ellipsis-h"></i>
			  	            </a>
			  	      	    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
		       	      		  <button class="btn_controll-list"><i class="fas fa-edit"></i>댓글 수정</button>
		              	      <button class="btn_controll-list"><i class="far fa-trash-alt"></i>삭제</button>
			  	            </ul>
		                </div>
		                
				    </div>
				    
				</div>
				
				<!-- 댓글 내용 --> 
				<div class="comment_contents">
					<div id="comment-conetents${comment.comment_code}">${comment.comment_contents }</div>
				</div>
			
			</div>
		</c:forEach>
	</div>
	
	
</div>


<script>

/* summer-note 설정 */
$(".comment_TXT").summernote({
	placeholder: '댓글달기',
	width: '80%',
	height: '30px',
	border: '1px solid #3d3d3d',
	disableResizeEditor: true,
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


//댓글 추가
function insert_comment(page_code){
	 
	 var comment_contents = $("#comment_TXT" + page_code).val();
	 
	 $.ajax({
       url : '/blog/insert_comment',
       data : {"page_code" : page_code, "comment_contents" : comment_contents},
       success : function(data) {
          
          	$('#comment_content'+page_code).html(data);
       }
    });
 }


</script>














