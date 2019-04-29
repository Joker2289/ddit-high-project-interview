	$("#btn_moreRecent").hide();
	$("#btn_morePrevious").hide();
	
	if($(".previousAlarm_contents").length == 0){
		$("#division_previous").hide();
	}
	

	var recentPageNum = 2;
	var lastRecentAlarm = "";
	$("#btn_moreRecent").on("click", function() {
		lastRecentAlarm = $(".recentAlarm_contents:last").attr('data-code');
		
		$.ajax({
			type : 'POST',
			url : '/nextrecentalarm',
			data : {"alarm_code" : lastRecentAlarm, "pageNum" : recentPageNum},
			success : function(data) {
				
				recentPageNum++;
				if(data != ""){
					$(".alarm_recent-area").append(data);
				}
			   
			}
		});
	});
	
	var previousPageNum = 2;
	var lastPreviousAlarm = "";
	$("#btn_previousRecent").on("click", function() {
		lastAlarm = $(".previousAlarm_contents").attr('data-code');
		
		$.ajax({
			type : 'POST',
			url : '/nextpreviousalarm',
			data : {"alarm_code" : lastPreviousAlarm, "pageNum" : previousPageNum},
			success : function(data) {
				
				previousPageNum++;
				if(data != ""){
					$(".alarm_previous-area").append(data);
				}
			   
			}
		});
	});
	
	var delete_code = "";
	$(".btn_deleteAlarm").on("click", function() {
		delete_code = $(this).attr('data-code');
		
		if($(this).attr('data-division') == 'recent'){
			$.ajax({
				type : 'POST',
				url : '/deletealarm',
				data : {"alarm_code" : delete_code},
				success : function(data) {
					
					console.log("recent >> "+data);
					$('#alarm'+delete_code).remove();
					$('#recentAlarm_contents'+delete_code).append('<div><h4 style="margin-top:15px;">해당 알림을 삭제했습니다.</h4></div>');
				}
			});
		} else {
			$.ajax({
				type : 'POST',
				url : '/deletealarm',
				data : {"alarm_code" : delete_code},
				success : function(data) {
					
					console.log("recent >> "+data);
					$('#alarm'+delete_code).remove();
					$('#previousAlarm_contents'+delete_code).append('<div><h4 style="margin-top:15px;">해당 알림을 삭제했습니다.</h4></div>');
				}
			});
		}
	});
	
	var mem_id = "";
	var send_name = "";
	var alarm_code = "";
	$(".btn_unfollow").on("click", function() {
		mem_id 	   = $(this).attr('data-id');
		send_name  = $(this).attr('data-name');
		alarm_code = $(this).attr('data-code');
		
		$.ajax({
			type : 'POST',
			url : '/unfollow',
			data : {"target_id" : mem_id},
			success : function(data) {
	            
	        	$('#alarm'+alarm_code).remove();
	        	$('#recentAlarm_contents'+alarm_code).append('<div><h4 style="margin-top:15px;">' + send_name + '님을 언팔로우 했습니다.</h4></div>');
	            
			 }
		});
	});