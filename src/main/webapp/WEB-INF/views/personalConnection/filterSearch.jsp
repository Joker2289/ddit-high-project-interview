<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/css/personalConnection/feedFollowing.css" rel="stylesheet">

<nav class="navbar navbar-inverse navbar-fixed-top feedTop" style="height: 55px;">
	<div class="container" style="padding-top: 8px;">
		<div class="dropdown" style="display:inline;">
			<button class="btn btn-default" id="dLabel" style="border-style: hidden;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<label>사람</label>
			</button>
			<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" style="top: 36px;left: 770px;width: 297px;height: 272px;margin-top: 0px;">
				<li role="presentation" style="padding-bottom: 10px;padding-top: 10px;"><a class="feedDropdown" role="menuitem" tabindex="-1" title="connections">전체</a></li>
			</ul>
		</div>
		<div class="feedDiv">
			<a href="/feedFollowing">로우 중</a>
		</div>
		<div class="feedDiv">
			<a href="/feedFollowers">팔로</a>
		</div>
	</div>
</nav>