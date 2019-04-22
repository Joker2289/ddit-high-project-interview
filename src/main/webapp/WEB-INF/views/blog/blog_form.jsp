<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<h2 class="setting_title">
	<i class="fas fa-cog"></i> 블로그 설정
</h2>

<div class="setting_menu">
	<div class="setting_name">
		<i class="fas fa-check"></i> 블로그 명
	</div>

	<div class="setting_content">
		<input id="blog_name_TXT" type="text" class="form-control setting_TXT">
		<button class="btn btn-primary setting_Btn"
			onclick="updateBlog('blog_name');">OK</button>
	</div>
</div>


<div class="setting_menu">
	<div class="setting_name">
		<i class="fas fa-check"></i> 블로그 명 사용 여부
	</div>

	<div class="setting_content">
		<form id="name_act_form">
			<input id="name_y" type="radio" name="name_act" value="y"
				onclick="updateBlog('name_act');" /> 사용 <input id="name_n"
				type="radio" name="name_act" value="n"
				onclick="updateBlog('name_act');" /> 미사용
		</form>
	</div>
</div>

<div class="setting_menu">
	<div class="setting_name">
		<i class="fas fa-check"></i> 커버 이미지
	</div>

	<div class="setting_content">
		<button class="btn btn-primary setting_Btn" onclick="findImage();">
			<i class="fas fa-search"></i> 사진 찾기
		</button>
		<form id="imageForm">
			<input id="imageStorage" name="imageStorage" class="btn btn-primary"
				type="file" onchange="imageUpload();">
		</form>
	</div>
</div>

<div class="setting_menu">
	<div class="setting_name">
		<i class="fas fa-check"></i> 커버 이미지 사용 여부
	</div>

	<div class="setting_content">
		<form id="img_act_form">
			<input id="img_y" type="radio" name="img_act" value="y" onclick="updateBlog('img_act');" /> 사용 
				<input id="img_n" type="radio" name="img_act" value="n" onclick="updateBlog('img_act');" /> 미사용
		</form>
	</div>
</div>


<script>
	/* onload setting */

	var user_id = '${ user_id }';

	//블로그명
	var blog_name = '${ bVo.blog_name }';
	$('#blog_name_TXT').val(blog_name);

	//블로그명 사용여부
	var name_act = '${ bVo.name_act }';
	if (name_act == 'y') {
		$('#name_y').attr('checked', true);
	} else if (name_act == 'n') {
		$('#name_n').attr('checked', true);
	}

	//커버이미지 사용여부
	var img_act = '${ bVo.img_act }';
	if (img_act == 'y') {
		$('#img_y').attr('checked', true);
	} else if (img_act == 'n') {
		$('#img_n').attr('checked', true);
	}

	/* 이미지 file 태그 숨김 */
	$('#imageStorage').hide();

	/* 사진 찾기 버튼 클릭 */
	function findImage() {
		$('#imageStorage').click();
	}

	/* 이미지 저장 */
	function imageUpload() {
		
		var form = $("#imageForm")[0];
		var formData = new FormData(form);
		
		$.ajax({

			url : "${cp}/blog/uploadImg",
			enctype : 'multipart/form-data',
			method : "post",
			data : formData,
			processData : false,
			contentType : false,
			cache : false,
			timeout : 600000,
			success : function(data) {
				
				console.log("dd");
				console.log(data);
				$("#head_area").html(data);
				
			}
		});
	}

	function updateBlog(update_param) {
		var update_content = "";

		if (update_param == 'name_act') {
			update_content = $('#name_act_form input:radio[name=name_act]:checked').val();
		} else if (update_param == 'img_act') {
			update_content = $('#img_act_form input:radio[name=img_act]:checked').val();
		} else if (update_param == 'blog_name') {
			update_content = $('#blog_name_TXT').val();
		}

		$.ajax({
			url : "${cp}/blog/updateBlog",
			data : {
				"user_id" : user_id,
				"update_param" : update_param,
				"update_content" : update_content
			},
			success : function(data) {

				console.log(data);
				$("#head_area").html(data);

			}
		});

	}
</script>


