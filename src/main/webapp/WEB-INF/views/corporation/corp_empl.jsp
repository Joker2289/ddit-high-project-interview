<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- corp_empl.css -->

<!-- Downloaded chart.css -->
<link rel="stylesheet" href="chart.css">
<link rel="stylesheet" href="https://cdn.rawgit.com/theus/chart.css/v1.0.0/dist/chart.css" />


<div style="border: 1px solid; width: 100%; background-color: white;">

	<label style="">직원 ${empl_count}명</label>
	
	<div  style="border: 1px solid;border-color: red;">
		<div class="charts" style="border: 1px solid;width: 280px;display: inline-block;">
			<label>출신학교||${eec.size()}</label>
			<c:forEach begin="0" end="${eec.size()-1}" var="i">
				${university_list.get(i).getSchool_name()} || ${eec.get(i)} 
				<div class="charts__chart chart--p${Integer(100*eec.get(i)/eec.size())} chart--blue chart--hover" ></div>
			</c:forEach>
		</div>
		<div class="charts" style="border: 1px solid;width: 280px;display: inline-block;">
			<label>전공||${major_count.size()}</label>
			<c:forEach begin="0" end="${major_count.size()-1}" var="i">
				${major_list.get(i).getMajor()} || ${major_count.get(i)} 
				<div class="charts__chart chart--p${Integer(100*major_count.get(i)/major_count.size())} chart--blue chart--hover" ></div>
			</c:forEach>
		</div>	
		<div class="charts" style="border: 1px soli]d;width: 280px;display: inline-block;">
			<label>직책||${job_position_count.size()}</label>
			<c:forEach begin="0" end="${job_position_count.size()-1}" var="i">
				${job_position_list.get(i).getJob_position()} || ${job_position_count.get(i)} 
				<div class="charts__chart chart--p${Integer(100*job_position_count.get(i)/job_position_count.size())} chart--blue chart--hover" ></div>
			</c:forEach>
		</div>	
	</div>
	
</div>

<div style="margin-top: 20px;">
	<c:forEach begin="0" end="${empl_list.size()-1 }" var="i">
		<div style="border: 1px solid;margin-right: 10px; width: 200px;height: 300px; display: inline-block;text-align: center;">
			<img style="border-radius: 100px;width: 100px;height: 100px;margin-top: 10px;" alt="" src="/images/logo/ruda.png"><br>
			<label style="margin-top: 10px;">${empl_list.get(i).getUser_name() }</label>
			<label style="margin-top: 10px;height: 80px;width: 180px;overflow: hidden;">${empl_list.get(i).getProfile_contents() }></label>
		<div style="border: 1px solid;margin-top: 10px;">
			<c:choose>
				<c:when test="${empl_list.get(i).getReceive_accept() eq 'Y'}">
					<button>일촌 끊기</button>
				</c:when>
				<c:when test="${empl_list.get(i).getReceive_accept() eq 'N'}">
					<button>일촌수락 대기</button>
				</c:when>
				<c:when test="${empl_list.get(i).getReceive_accept() eq null}">
					<button>일촌 맺기</button>
				</c:when>
			</c:choose>
		</div>
		</div>
	</c:forEach>
</div>
