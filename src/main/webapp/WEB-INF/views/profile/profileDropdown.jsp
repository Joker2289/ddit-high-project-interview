<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<ul class="dropdown-menu" style="display: block; top: 425px;left: 40px; width: 310px; min-height: 240px;" >
   <li><a data-toggle="collapse" href="#introduction" aria-expanded="false" aria-controls="introduction">소개</a></li>
   <div class="collapse" id="introduction">
      <div class="well">
         <span><i class="fas fa-align-justify"></i></span>
         <div style="margin-right: 12px; ">
            <div class="dropdownAccordion">간략프로필</div>
            <p class="dropdownAccordion">간단프로필에서 회원님이 관심을 두는 분야를 알리세요.<p>
         </div>
         <button class="btn btn-default modalBtn" data-toggle="modal" data-target="#myModal" title="introduction"><span style="color: #777a7d;"><i class="fas fa-plus"></i></span></button>
      </div>
   </div>
   <li class="divider"></li>
   <li><a data-toggle="collapse" href="#background" aria-expanded="false" aria-controls="background">배경</a></li>
   <div class="collapse" id="background">
      <div class="well">
         <span><i class="fas fa-briefcase" ></i></span>
         <div style="margin-right: 12px; ">
            <div class="dropdownAccordion">경력 사항</div>
            <p class="dropdownAccordion">프로필에 등록될 직군<p>
         </div>
         <button class="btn btn-default modalBtn" data-toggle="modal" data-target="#myModal" title="career"><span style="color: #777a7d;"><i class="fas fa-plus"></i></span></button>
      </div>
      <div class="well">
         <span><i class="fas fa-graduation-cap"></i></span>
         <div style="margin-right: 12px; ">
            <div class="dropdownAccordion">학력 사항</div>
            <p class="dropdownAccordion">프로필에 등록될 학교<p>
         </div>
         <button class="btn btn-default modalBtn" data-toggle="modal" data-target="#myModal" title="education"><span style="color: #777a7d;"><i class="fas fa-plus"></i></span></button>
      </div>
   </div>
   <li class="divider"></li>
   <li><a data-toggle="collapse" href="#skills" aria-expanded="false" aria-controls="skills">보유기술</a></li>
   <div class="collapse" id="skills">
      <div class="well">
         <span><i class="fas fa-medal"></i></span>
         <div style="margin-right: 12px; ">
            <div class="dropdownAccordion">보유 기술</div>
            <p class="dropdownAccordion">프로필에 등록된 보유 기술<p>
         </div>
         <button class="btn btn-default modalBtn" data-toggle="modal" data-target="#myModal" title="skills"><span style="color: #777a7d;"><i class="fas fa-plus"></i></span></button>
      </div>
   </div>
   <li class="divider"></li>
   <li><a data-toggle="collapse" href="#history" aria-expanded="false" aria-controls="history">이력</a></li>
   <div class="collapse" id="history">
      <div class="well">
         <span><i class="far fa-newspaper"></i></span>
         <div style="margin-right: 12px; ">
            <div class="dropdownAccordion">논문·저서</div>
            <p class="dropdownAccordion">저술 활동을 등록하면 조회수가 7배 높아집니다.<p>
         </div>
         <button class="btn btn-default modalBtn" data-toggle="modal" data-target="#myModal" title="Thesis"><span style="color: #777a7d;"><i class="fas fa-plus"></i></span></button>
      </div>
         <div class="well">
         <span><i class="fas fa-lightbulb"></i></span>
         <div style="margin-right: 12px; ">
            <div class="dropdownAccordion">특허</div>
            <p class="dropdownAccordion">특허를 등록하시고 전문성을 나타내세요.<p>
         </div>
         <button class="btn btn-default modalBtn" data-toggle="modal" data-target="#myModal" title="patent"><span style="color: #777a7d;"><i class="fas fa-plus"></i></span></button>
      </div>
      <div class="well">
         <span><i class="fas fa-tasks"></i></span>
         <div style="margin-right: 12px; ">
            <div class="dropdownAccordion">프로젝트</div>
            <p class="dropdownAccordion">프로젝트를 입력하고 전문성을 강조하세요.<p>
         </div>
         <button class="btn btn-default modalBtn" data-toggle="modal" data-target="#myModal" title="project"><span style="color: #777a7d;"><i class="fas fa-plus"></i></span></button>
      </div>
      <div class="well">
         <span><i class="fas fa-trophy"></i></span>
         <div style="margin-right: 12px; ">
            <div class="dropdownAccordion">수상 경력</div>
            <p class="dropdownAccordion">수상 경력을 등록해서 장점을 부각시키세요.<p>
         </div>
         <button class="btn btn-default modalBtn" data-toggle="modal" data-target="#myModal" title="award"><span style="color: #777a7d;"><i class="fas fa-plus"></i></span></button>
      </div>
      <div class="well">
         <span><i class="fas fa-language"></i></span>
         <div style="margin-right: 12px; ">
            <div class="dropdownAccordion">외국어</div>
            <p class="dropdownAccordion">승진, 해외 취업 등에 필요할 수 있는 외국어 능력을 드려내세요.<p>
         </div>
         <button class="btn btn-default modalBtn" data-toggle="modal" data-target="#myModal" title="language"><span style="color: #777a7d;"><i class="fas fa-plus"></i></span></button>
      </div>
   </div>
   <li class="divider"></li>
   <li><a data-toggle="collapse" href="#recommendation" aria-expanded="false" aria-controls="recommendation">추가정보</a></li>
   <div class="collapse" id=recommendation>
      <div class="well">
         <span><i class="fas fa-edit"></i></span>
         <div style="margin-right: 12px; ">
            <div class="dropdownAccordion">추천서</div>
            <p class="dropdownAccordion">1촌에게 추천서를 써달라고 부탁하기<p>
         </div>
         <button class="btn btn-default modalBtn" data-toggle="modal" data-target="#myModal" title="recommendation"><span style="color: #777a7d;"><i class="fas fa-plus"></i></span></button>
      </div>
   </div>
</ul>

<script type="text/javascript">

$(".modalBtn").on("click",function(){
	
	var modalStr = $(this).attr("title");
	console.log(modalStr);
	
	$.ajax({
		type : "POST",
    		url : "/modalInsertView",
    		dataType : "HTML",
    		data : {"modalStr" :  modalStr},
		success : function(result) {
			
			$(".modal-content").html(result);
		}
	}); 
	
});
</script>