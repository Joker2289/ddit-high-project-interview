<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>

  <div class="jk-modalsasun">
  	 <div class="jk-modal">
  			
  			
  
  	
     
   </div>
  </div>
    
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
 
  
  $(document).ready(function(){
	  
  	 //form 전송 object 타입으로 보낼때
     jQuery.fn.serializeObject = function() {
	    var obj = null;
	    try {
	        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
	            var arr = this.serializeArray();
	            if (arr) {
	                obj = {};
	                jQuery.each(arr, function() {
	                    obj[this.name] = this.value;
	                });
	            }//if ( arr ) {
	        }
	    } catch (e) {
	        alert(e.message);
	    } finally {
	    }
	 
	    return obj;
	};

		
  });
</script>
  
  
 
 
 
 
 
