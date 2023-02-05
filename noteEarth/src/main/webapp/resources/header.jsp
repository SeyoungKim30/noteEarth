<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>    

<meta charset="UTF-8">

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<style>

header{
padding-left:0px;
padding-right:0px;
padding-top:3px;
padding-bottom:3px;
height: 56px;
display: flex;
justify-content: space-between;
align-items: center;
border-bottom: 1px solid lightgray;
}

header img{
	height: 50px;
	}

header div{
	text-align: center;
	padding-right:10px;
	padding-left:10px;
	align-items: center;}	
	
header .center{padding-left:20px;text-align: center;}
header .lefter{width: 200px; text-align:left;}
header .righter{width: 200px;text-align:right;}

.pagenav{text-align: center; }
.pagenav div{text-align: center;display:inline-block;}

</style>

<header>

<div class="lefter"><a href="${path }"><img alt="메인으로 가는 이미지" src="https://img.freepik.com/premium-vector/earth-planet-isolated-white-flat-global-earth-icon-vector-simple-illustration-eco-environment_439591-339.jpg?w=360"></a></div>
<div class="center">
	<h4 class="dropdown-toggle dropdown" data-bs-toggle="dropdown" aria-expanded="false">${notes.noteTitle}</h4>
	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    	<a class="dropdown-item" href="${noteEarthurl }/insertPages.do?noteCode=${pages.noteCode }&tempCode=${pages.tempCode }&pageIndex=${pages.pageIndex}">현재 템플릿으로 새 페이지 생성</a>
    	<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#addPageModal">다른 템플릿으로 새 페이지 생성 </a>
    	<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delPageModal">지금 페이지 삭제</a>
  </div></div>
<div class="row righter">
<div class="col"><select class="form-select form-select-sm pageSelect">
	<c:forEach begin="1" end="${notes.totalPageCount }" varStatus="eachSt">
	<option value="${noteEarthurl }/openNote.do?pageIndex=${eachSt.count }&noteCode=${notes.noteCode }">${eachSt.count }</option>
	</c:forEach>
</select></div>
	<a class="col" href="#"><img alt="마이페이지 프로필" src="https://cdn-icons-png.flaticon.com/512/3135/3135823.png"></a>
</div>

</header>