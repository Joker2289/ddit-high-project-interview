<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- modal 영역 팝업 -->
    <div class="modal fade" id="write-modal" tabindex="-1" role="dialog" aria-labelledby="writeModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
      	<div class="modal-content">
      	  
      	  <div class="modal-header">
      	  	
			<input type="hidden" name="board_code" value="${board_code }">
			<input type="hidden" name="board_name" value="${board_name }">
		
			<div class="form-group" style="padding-left: 0px;">
				<label for="boardtitle" class="col-sm-5 control-label" style="padding-left: 0px;">제목</label>
				<div class="col-sm-10" style="padding-left: 0px;">
					<input type="text" style="width: 766px" class="form-control" id="post_title" name="post_title" /><br>
				</div>
			</div>

			<div class="form-group">
				<label for="boardtitle" class="col-sm-5 control-label" style="padding-left: 0px;">내용</label>
				<textarea name="post_contents" id="smarteditor" rows="10" cols="100" style="width: 766px; height: 412px;"></textarea>
			</div>
		
			<div class="col-sm-2" style="padding-left: 0px;">
				<table>
					<c:forEach begin="1" end="5" varStatus="fileCnt" step="1">
						<tr>
							<td><input type="file" name="uploadFile"></td>
						</tr>
					</c:forEach>
				</table>
			</div><br><br><br><br><br><br>
		
			<div class="col-sm-2" style="padding-left:520px;">
			   <button type="submit" class="btn btn-default" id="btn_write">완료</button>
			</div>
      	  	
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
    
    
<script src="/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">

   var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.

   $(document).ready(
         function() {
            // Editor Setting
            nhn.husky.EZCreator.createInIFrame({
               oAppRef : oEditors, // 전역변수 명과 동일해야 함.
               elPlaceHolder : "smarteditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
               sSkinURI : "/SE2/SmartEditor2Skin.html", // Editor HTML
               fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
               htParams : {
                  // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                  bUseToolbar : true,
                  // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                  bUseVerticalResizer : true,
                  // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                  bUseModeChanger : true,
               }
            });

            // 전송버튼 클릭이벤트
            $("#btn_write").click(
                  function() {
                     if (confirm("저장하시겠습니까?")) {
                        // id가 smarteditor인 textarea에 에디터에서 대입
                        oEditors.getById["smarteditor"].exec(
                              "UPDATE_CONTENTS_FIELD", []);

                        // 이부분에 에디터 validation 검증
                        if (validation()) {
                           $("#frm").submit();
                        }
                     }
                  })
         });

   // 필수값 Check
   function validation() {
      var contents = $.trim(oEditors[0].getContents());
      if (contents === '<p>&nbsp;</p>' || contents === '') { // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
         alert("내용을 입력하세요.");
         oEditors.getById['smarteditor'].exec('FOCUS');
         return false;
      }

      return true;
   }
</script>