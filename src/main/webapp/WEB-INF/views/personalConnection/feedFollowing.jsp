<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-inverse navbar-fixed-top" style="margin-top: 51px;min-height: 36px; height: 36px; background-color: white; border-bottom-color: white; box-shadow: 0 6px 12px rgba(0, 0, 0, .175);">
	<div class="container" style="padding-top: 8px;">
		<div style="display: inline; padding-right: 15px;">
			<a href="/feedFollow" >신선한 시각 팔로우</a>
		</div>
		<div style="display: inline; padding-right: 15px;">
			<a href="/feedFollowing">()명 팔로우 중</a>
		</div>
		<div style="display: inline; padding-right: 15px;">
			<a href="/feedFollowers">팔로워 ()명</a>
		</div>
	</div>
 </nav>

<div class="container">
<div class="row">
<div style="margin-top: 101px;">
<div class="row">

	<div id="pc_leftmenu" class="col-md-3" style="padding-left: 0px;margin-left: 30px;">
		<div class="whiteBox" style="background-color: white; width: 1126px;padding-left: 15px;padding-bottom: 13px;padding-top: 13px; margin-top: 30px; font-size: 17px;">
			<label>필터 : </label>
			<button class="btn btn-default" style="margin-left: 1015px; border-style: hidden;"><i class="fas fa-align-right"></i></button>
		</div>
		<div class="row" style="display: flex; flex: auto; flex-direction: row; flex-wrap: wrap; margin-left: 0px; width: 1200px;">
		<c:forEach items="${corporationList}" var="corp" varStatus="corpCount">
		
			 <div style="width: 225px;  ">
				<div class="col-md-3" style="border:1px solid #d0d0d0 ; border-bottom-width:2px; margin:20px 0 0 0; background-color: white; width: 225px; height: 211px;">
					<div style="width: 59px;height: 59px;background-image:url(/profile?mem_id=${corp.corp_id});background-repeat: no-repeat;background-size: cover;background-position: center;margin-left: 5px;margin-top: 15px; margin-bottom: 12px;"></div>
					<div>
						<label style="font-size: 17px;"><strong>${corp.corp_name} </strong></label><br/>
						<label>${corp.industry_type }</label>
					</div>
				</div>
				<div>
					<button class="btn btn-default" style="font-size:16px; height: 39px; width: 225px; border: 1px solid #d0d0d0; border-top-width: 0px; border-radius: 0px;"><i class="fas fa-check"></i> 팔로우 중</button>
				</div>
			</div> 
			<div></div>
			
		</c:forEach>
		
		</div>
		
	</div>
	
</div>
</div>
</div>
</div>