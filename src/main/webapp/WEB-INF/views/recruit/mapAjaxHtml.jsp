<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<h3>회사 수 : ${corpList2.size() }</h3>
<h3>출력 : 예 - 1,3,10</h3>
<c:forEach begin="1" end="${corpList2.size() }" varStatus="i">
	${i.index }. ${corpList2.get(i.index - 1).corp_name } / ${corpList2.get(i.index - 1).addr1 } / 거리 : xxx <br>
</c:forEach> <br><br>
	