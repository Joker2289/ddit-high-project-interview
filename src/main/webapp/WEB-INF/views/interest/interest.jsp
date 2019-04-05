<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<title>채용공고｜InterView</title>
	<style type="text/css">
		
	</style>
</head>

<body>
<div class="container"><div class="row"><div>
	<!-- 레이아웃 잡는건 나중에.. -->
	
	<br><br>
	
<form action="${pageContext.request.contextPath }/insertInte" id="frm">	
	<input type="hidden" id="inte_type" name="inte_type">
	<input type="hidden" id="inte_local" name="inte_local">
	<input type="hidden" id="inte_emptype" name="inte_emptype">
	<input type="hidden" id="inte_size" name="inte_size">

	<table border="1">
		<tr>
			<td>(mem_id : ${memberVO.mem_id })<br><br></td>
		</tr>
		<tr>
			<td><strong>커리어 관심분야</strong> / <a href="">개인정보 설정</a></td>
		</tr>
		<tr>
			<td><br></td>
		</tr>
		<tr>
			<td>
				<strong>리크루터에게 이직할 의사가 있다고 밝히기</strong>
				 / 켜짐(꺼짐) <input type="checkbox">
				<!-- 이직의사를 켰을때 리크루터에게하고싶은말 textarea가 생김. -->
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>		
		<tr>
			<td>
				리크루터에게 하고 싶은 말 <br>
				<textarea rows="" cols="" placeholder="리크루터들에게 알리고 싶은 점이 있으세요?"></textarea>
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>		
		<tr>
			<td>
				<strong>회원님의 커리어 관심분야는 회원님께 추천하는 채용공고를 결정합니다.</strong> <br>
				현재 회원님의 상태는? <br>
				<select>
					<option>상태</option>
					<option>적극적으로 지원하는 중</option>
					<option>가끔 지원함</option>
					<option>지원하고 있지 않지만 제안을 받는다면 고려할 것</option>
					<option>원하고 있지 않고 기회가 생겨도 거절할 것</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>		
		<tr>
			<td>
				원하시는 업무분야가 무엇인가요? <br>
				(최대 3개까지 등록 가능합니다.)<br>
				1순위: xxx &nbsp; &nbsp; &nbsp;2순위: xxx &nbsp; &nbsp; &nbsp;3순위: xxx &nbsp; &nbsp; &nbsp;<br>
				
				<!-- 글씨를 클릭해도 체크박스 선택되도록 하기. <lable for="[체크박스 아이디]"> 이용 -->
				<input id="소프트웨어개발" name="cb_job" value="소프트웨어개발" type="checkbox"><label for="소프트웨어개발">&nbsp;소프트웨어개발 &nbsp;</label><input id="백엔드" name="cb_job" value="백엔드" type="checkbox"><label for="백엔드">&nbsp;백엔드 &nbsp;</label><input id="모바일앱개발" name="cb_job" value="모바일앱개발" type="checkbox"><label for="모바일앱개발">&nbsp;모바일앱개발 &nbsp;</label><input id="웹마스터" name="cb_job" value="웹마스터" type="checkbox"><label for="웹마스터">&nbsp;웹마스터</label><br>
				<input id="공공기관" name="cb_job" value="공공기관" type="checkbox"><label for="공공기관">&nbsp;공공기관 &nbsp;</label><input id="전자상거래" name="cb_job" value="전자상거래" type="checkbox"><label for="전자상거래">&nbsp;전자상거래 &nbsp;</label><input id="웹컨텐츠" name="cb_job" value="웹컨텐츠" type="checkbox"><label for="웹컨텐츠">&nbsp;웹컨텐츠 &nbsp;</label><input id="웹테스터" name="cb_job" value="웹테스터" type="checkbox"><label for="웹테스터">&nbsp;웹테스터</label><br>
				<input id="모바일기획" name="cb_job" value="모바일기획" type="checkbox"><label for="모바일기획">&nbsp;모바일기획 &nbsp;</label><input id="서버관리" name="cb_job" value="서버관리" type="checkbox"><label for="서버관리">&nbsp;서버관리 &nbsp;</label><input id="시스템운영" name="cb_job" value="시스템운영" type="checkbox"><label for="시스템운영">&nbsp;시스템운영 &nbsp;</label><input id="네트워크구축" name="cb_job" value="네트워크구축" type="checkbox"><label for="네트워크구축">&nbsp;네트워크구축</label><br>
				<input id="클라이언트개발" name="cb_job" value="클라이언트개발" type="checkbox"><label for="클라이언트개발">&nbsp;클라이언트개발 &nbsp;</label><input id="유지보수" name="cb_job" value="유지보수" type="checkbox"><label for="유지보수">&nbsp;유지보수 &nbsp;</label><input id="알고리즘" name="cb_job" value="알고리즘" type="checkbox"><label for="알고리즘">&nbsp;알고리즘 &nbsp;</label><input id="데이터베이스" name="cb_job" value="데이터베이스" type="checkbox"><label for="데이터베이스">&nbsp;데이터베이스</label><br>
				<input id="웹프로그래밍" name="cb_job" value="웹프로그래밍" type="checkbox"><label for="웹프로그래밍">&nbsp;웹프로그래밍 &nbsp;</label><input id="통신" name="cb_job" value="통신" type="checkbox"><label for="통신">&nbsp;통신 &nbsp;</label><input id="빅데이터" name="cb_job" value="빅데이터" type="checkbox"><label for="빅데이터">&nbsp;빅데이터 &nbsp;</label><input id="머신러닝" name="cb_job" value="머신러닝" type="checkbox"><label for="머신러닝">&nbsp;머신러닝</label><br>
				<input id="소프트웨어QA" name="cb_job" value="소프트웨어QA" type="checkbox"><label for="소프트웨어QA">&nbsp;소프트웨어QA &nbsp;</label><input id="리눅스" name="cb_job" value="리눅스" type="checkbox"><label for="리눅스">&nbsp;리눅스 &nbsp;</label><input id="안드로이드" name="cb_job" value="안드로이드" type="checkbox"><label for="안드로이드">&nbsp;안드로이드 &nbsp;</label><input id="솔루션" name="cb_job" value="솔루션" type="checkbox"><label for="솔루션">&nbsp;솔루션</label><br>
				<input id="네트워크보안" name="cb_job" value="네트워크보안" type="checkbox"><label for="네트워크보안">&nbsp;네트워크보안 &nbsp;</label><input id="HTTP·TCP" name="cb_job" value="HTTP·TCP" type="checkbox"><label for="HTTP·TCP">&nbsp;HTTP·TCP &nbsp;</label><input id="Python" name="cb_job" value="Python" type="checkbox"><label for="Python">&nbsp;Python &nbsp;</label><input id="POS" name="cb_job" value="POS" type="checkbox"><label for="POS">&nbsp;POS</label><br>
				<input id="C++" name="cb_job" value="C++" type="checkbox"><label for="C++">&nbsp;C++ &nbsp;</label><input id="DataMining" name="cb_job" value="DataMining" type="checkbox"><label for="DataMining">&nbsp;DataMining &nbsp;</label><input id="Java" name="cb_job" value="Java" type="checkbox"><label for="Java">&nbsp;Java &nbsp;</label><input id="Nodejs" name="cb_job" value="Nodejs" type="checkbox"><label for="Nodejs">&nbsp;Nodejs</label><br>
				<input id=".NET" name="cb_job" value=".NET" type="checkbox"><label for=".NET">&nbsp;.NET &nbsp;</label><input id="springboot" name="cb_job" value="springboot" type="checkbox"><label for="springboot">&nbsp;springboot &nbsp;</label><input id="Framework" name="cb_job" value="Framework" type="checkbox"><label for="Framework">&nbsp;Framework &nbsp;</label><input id="DBMS" name="cb_job" value="DBMS" type="checkbox"><label for="DBMS">&nbsp;DBMS</label><br>
				<input id="asp" name="cb_job" value="asp" type="checkbox"><label for="asp">&nbsp;asp &nbsp;</label><input id="Oracle" name="cb_job" value="Oracle" type="checkbox"><label for="Oracle">&nbsp;Oracle &nbsp;</label><input id="MS-SQL" name="cb_job" value="MS-SQL" type="checkbox"><label for="MS-SQL">&nbsp;MS-SQL &nbsp;</label><input id="SM" name="cb_job" value="SM" type="checkbox"><label for="SM">&nbsp;SM</label><br>
				<input id="SI" name="cb_job" value="SI" type="checkbox"><label for="SI">&nbsp;SI &nbsp;</label><input id="WAS" name="cb_job" value="WAS" type="checkbox"><label for="WAS">&nbsp;WAS &nbsp;</label><input id="jsp" name="cb_job" value="jsp" type="checkbox"><label for="jsp">&nbsp;jsp &nbsp;</label><input id="DBA" name="cb_job" value="DBA" type="checkbox"><label for="DBA">&nbsp;DBA</label><br>
				<input type="text" placeholder="+ 업무분야 등록" onmouseover="" style="cursor: pointer; width: 120px;">			
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>		
		<tr>
			<td>
				어느 지역으로 취직/이직하고 싶으세요? <br>
				<input id="전국" name="cb_local" value="전국" type="checkbox"><label for="전국">&nbsp;상관없음 &nbsp;</label><input id="서울" name="cb_local" value="서울" type="checkbox"><label for="서울">&nbsp;서울 &nbsp;</label><input id="경기" name="cb_local" value="경기" type="checkbox"><label for="경기">&nbsp;경기 &nbsp;</label><input id="인천" name="cb_local" value="인천" type="checkbox"><label for="인천">&nbsp;인천</label><br>
				<input id="대전" name="cb_local" value="대전" type="checkbox"><label for="대전">&nbsp;대전 &nbsp;</label><input id="세종" name="cb_local" value="세종" type="checkbox"><label for="세종">&nbsp;세종 &nbsp;</label><input id="충남" name="cb_local" value="충남" type="checkbox"><label for="충남">&nbsp;충남 &nbsp;</label><input id="충북" name="cb_local" value=" 충북" type="checkbox"><label for="충북">&nbsp;충북</label><br>
				<input id="광주" name="cb_local" value="광주" type="checkbox"><label for="광주">&nbsp;광주 &nbsp;</label><input id="전남" name="cb_local" value="전남" type="checkbox"><label for="전남">&nbsp;전남 &nbsp;</label><input id="전북" name="cb_local" value="전북" type="checkbox"><label for="전북">&nbsp;전북 &nbsp;</label><input id="대구" name="cb_local" value="대구" type="checkbox"><label for="대구">&nbsp;대구</label><br>
				<input id="경북" name="cb_local" value="경북" type="checkbox"><label for="경북">&nbsp;경북 &nbsp;</label><input id="부산" name="cb_local" value="부산" type="checkbox"><label for="부산">&nbsp;부산 &nbsp;</label><input id="울산" name="cb_local" value="울산" type="checkbox"><label for="울산">&nbsp;울산 &nbsp;</label><input id="경남" name="cb_local" value="경남" type="checkbox"><label for="경남">&nbsp;경남</label><br>
				<input id="강원" name="cb_local" value="강원" type="checkbox"><label for="강원">&nbsp;강원 &nbsp;</label><input id="제주" name="cb_local" value="제주" type="checkbox"><label for="제주">&nbsp;제주 </label><br>
				<input type="text" placeholder="+ 희망지역 등록" onmouseover="" style="cursor: pointer; width: 120px;">			
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>		
		<tr>
			<td>
				원하시는 고용형태가 있으신가요? <br>
				<input id="모든 고용형태" name="cb_emp" value="모든 고용형태" type="checkbox"><label for="모든 고용형태">&nbsp;상관없음</label><br>
				<input id="정규직" name="cb_emp" value="정규직" type="checkbox"><label for="정규직">&nbsp;정규직</label><br>
				<input id="계약직" name="cb_emp" value="계약직" type="checkbox"><label for="계약직">&nbsp;계약직</label><br>
				<input id="인턴" name="cb_emp" value="인턴" type="checkbox"><label for="인턴">&nbsp;인턴</label><br>
				<input id="파견직" name="cb_emp" value="파견직" type="checkbox"><label for="파견직">&nbsp;파견직</label><br>
				<input id="도급" name="cb_emp" value="도급" type="checkbox"><label for="도급">&nbsp;도급</label><br>
				<input id="프리랜서" name="cb_emp" value="프리랜서" type="checkbox"><label for="프리랜서">&nbsp;프리랜서</label><br>
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>		
		<tr>
			<td>
				원하시는 회사 규모는? <br><br>
				<select id="sel_1st">
					<option value="1명">1명</option>
					<option value="10명">10명</option>
					<option value="50명">50명</option>
					<option value="200명">200명</option>
					<option value="500명">500명</option>
					<option value="1,000명">1,000명</option>
					<option value="5,000명">5,000명</option>
					<option value="10,000명">10,000명</option>
				</select>
				&nbsp;~&nbsp;
				<select id="sel_2nd">
					<option value="10명">10명</option>
					<option value="50명">50명</option>
					<option value="200명">200명</option>
					<option value="500명">500명</option>
					<option value="1,000명">1,000명</option>
					<option value="5,000명">5,000명</option>
					<option value="10,000명">10,000명</option>
					<option value="10,000명 이상" selected>10,000+명</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>		
	</table><br>
	
	<input id="btn_save" type="button" value="저장">
</form>	
	
	<br><br>
	<a href="${pageContext.request.contextPath }/recruit">채용공고 페이지로 이동 -></a>
	<br><br><br><br><br><br>	
		
		
		
</div></div></div>		
		
<script type="text/javascript">
	$(document).ready(function(){
		console.log("docu");
		
		// inte_size 기본값.
		$("#inte_size").val($("#sel_1st option:selected").val() + " / " + $("#sel_2nd option:selected").val());
		
		// 업무분야 체크박스.
		$('input:checkbox[name="cb_job"]').on("change", function(){
			// 여기서 순위도 넣어야 하는데... 일단은 이렇게.
			var str_value = "";					
			var str_temp = "";					
			var int_check = 0;
			
			$('input:checkbox[name="cb_job"]').each(function(){
				if(this.checked){
					int_check++;
					
					if(str_temp == ''){
						str_temp += this.value;
					}else{
						str_temp += " / " + this.value;
					}					
				}
			});			
// 			alert(int_check);
			
			if(int_check > 3){
				alert("희망 업무분야는 3개까지 선택가능합니다.");
				this.checked = false;
				return;
			}else{
				str_value = str_temp;
			}
// 			alert(str_value);
			$("#inte_type").val(str_value);
		});
		
		// 업무지역 체크박스.
		$('input:checkbox[name="cb_local"]').on("change", function(){
			var str_localValue = "";					
			var str_localTemp = "";					
			var int_localCheck = 0;
			
			if(this.value == '전국'){
				// '상관없음'이 선택되어 있을때 다시 누르면 checked값은 false이므로 그대로 리턴하면 됨.
				if(this.checked == false){
					return;
				}
				
				if(confirm("희망 업무지역을 전국으로 설정하시겠습니까?")){
					str_localValue = this.value;
					
					$('input:checkbox[name="cb_local"]').each(function(){
						if(this.value != '전국'){
							if(this.checked){
								this.checked = false;
							}
						}
					});
				}
			}else{
				$('input:checkbox[name="cb_local"]').each(function(){
					// '전국'이 선택되어있으면 해제하기.			
					if(this.value == '전국'){
						this.checked = false;
					}
										
					if(this.checked){
						int_localCheck++;
						
						if(str_localTemp == ''){
							str_localTemp += this.value;
						}else{
							str_localTemp += " / " + this.value;
						}					
					}
				});	
				
				if(int_localCheck > 3){
					alert("희망 업무지역은 3개까지 선택가능합니다.");
					this.checked = false;
					return;
				}else{
					str_localValue = str_localTemp;
				}
			}
			
// 			alert(str_localValue);
			$("#inte_local").val(str_localValue);
		});
		
		// 고용형태 체크박스.
		$('input:checkbox[name="cb_emp"]').on("change", function(){
			var str_empValue = "";					
			var str_empTemp = "";					
			var int_empCheck = 0;
			
			if(this.value == '모든 고용형태'){
				// '상관없음'이 선택되어 있을때 다시 누르면 checked값은 false이므로 그대로 리턴하면 됨.
				if(this.checked == false){
					return;
				}				
				
				if(confirm("희망 고용형태를 상관없음으로 설정하시겠습니까?")){
					str_empValue = this.value;
					
					$('input:checkbox[name="cb_emp"]').each(function(){
						if(this.value != '모든 고용형태'){
							if(this.checked){
								this.checked = false;
							}
						}
					});
				}
			}else{
				$('input:checkbox[name="cb_emp"]').each(function(){
					// '상관없음'이 선택되어있으면 해제하기.			
					if(this.value == '모든 고용형태'){
						this.checked = false;
					}
										
					if(this.checked){
						int_empCheck++;
						
						if(str_empTemp == ''){
							str_empTemp += this.value;
						}else{
							str_empTemp += " / " + this.value;
						}					
					}
				});	
				
				if(int_empCheck > 2){
					alert("희망 고용형태는 2개까지 선택가능합니다.");
					this.checked = false;
					return;
				}else{
					str_empValue = str_empTemp;
				}
			}
			
// 			alert(str_empValue);
			$("#inte_emptype").val(str_empValue);
		});
		
		// 회사규모 ajax? 우선 jQuery로 sel_2nd의 옵션 변경하기.
		$("#sel_1st").on("change", function(){
// 			alert($("#sel_2nd option:selected").val());
			
			// select box ID로 접근하여 선택된 값 읽기 -> $("#[셀렉트박스ID] option:selected").val();
			//1명/10명/50명/200명/500명/1,000명/5,000명/10,000명
			if($("#sel_1st option:selected").val() == '1명'){
				$("#sel_2nd").html('<option value="10명">10명</option><option value="50명">50명</option><option value="200명">200명</option><option value="500명">500명</option><option value="1,000명">1,000명</option><option value="5,000명">5,000명</option><option value="10,000명">10,000명</option><option value="10,000명 이상" selected>10,000+명</option>');
			}else if($("#sel_1st option:selected").val() == '10명'){
				$("#sel_2nd").html('<option value="50명">50명</option><option value="200명">200명</option><option value="500명">500명</option><option value="1,000명">1,000명</option><option value="5,000명">5,000명</option><option value="10,000명">10,000명</option><option value="10,000명 이상" selected>10,000+명</option>');
			}else if($("#sel_1st option:selected").val() == '50명'){
				$("#sel_2nd").html('<option value="200명">200명</option><option value="500명">500명</option><option value="1,000명">1,000명</option><option value="5,000명">5,000명</option><option value="10,000명">10,000명</option><option value="10,000명 이상" selected>10,000+명</option>');
			}else if($("#sel_1st option:selected").val() == '200명'){
				$("#sel_2nd").html('<option value="500명">500명</option><option value="1,000명">1,000명</option><option value="5,000명">5,000명</option><option value="10,000명">10,000명</option><option value="10,000명 이상" selected>10,000+명</option>');
			}else if($("#sel_1st option:selected").val() == '500명'){
				$("#sel_2nd").html('<option value="1,000명">1,000명</option><option value="5,000명">5,000명</option><option value="10,000명">10,000명</option><option value="10,000명 이상" selected>10,000+명</option>');
			}else if($("#sel_1st option:selected").val() == '1,000명'){
				$("#sel_2nd").html('<option value="5,000명">5,000명</option><option value="10,000명">10,000명</option><option value="10,000명 이상" selected>10,000+명</option>');
			}else if($("#sel_1st option:selected").val() == '5,000명'){
				$("#sel_2nd").html('<option value="10,000명">10,000명</option><option value="10,000명 이상" selected>10,000+명</option>');
			}else if($("#sel_1st option:selected").val() == '10,000명'){
				$("#sel_2nd").html('<option value="10,000명 이상" selected>10,000+명</option>');
			}
			
			$("#inte_size").val($("#sel_1st option:selected").val() + " / " + $("#sel_2nd option:selected").val());
		});
		
		$("#sel_2nd").on("change", function(){
// 			alert($("#sel_1st option:selected").val() + " / " + $("#sel_2nd option:selected").val());
			$("#inte_size").val($("#sel_1st option:selected").val() + " / " + $("#sel_2nd option:selected").val());
		});
		
		// 저장 버튼 클릭
		$("#btn_save").on("click", function(){
// 			alert("업무분야 : " + $("#inte_type").val());
// 			alert("업무지역 : " + $("#inte_local").val());
// 			alert("고용형태 : " + $("#inte_emptype").val());
// 			alert("회사 규모 : " + $("#inte_size").val());
			
			$("#frm").submit();
		});
		
	});
	

</script>	
	
</body>
</html>






