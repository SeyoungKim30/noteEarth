<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${Login.name }의 노트</title>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<style>

.cardDeck div{
	margin:0.5em;
	min-width: 10em;
}
</style>


<script>
$(function() {

	$('.card').each(function(index,eachCard) {
		let noteCode = $(eachCard).attr('id')
		let color_r = Math.floor(noteCode.substring(16,18)/100 * 127 +128).toString(16);
		let color_g = Math.floor(noteCode.substring(10,12)/100 * 127 +128).toString(16);
		let color_b = Math.floor(noteCode.substring(7,9)/100 * 127 +128).toString(16);
		let colorCode = '#'+color_r+color_g+color_b;
		$(eachCard).css("background",colorCode)
	})
})
</script>


</head>

<body class="container-lg">
<h1>${path}</h1>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addNewNote" id="addNewNoteBtn">
  새 노트 생성하기
</button>

<div class="cardDeck justify-content-center row row-cols-1 row-cols-sm-3 row-cols-lg-4 ">

<c:forEach items="${noteList }" var="each">
<div class="d-flex card col" id="${each.noteCode }" style="cursor:pointer;" onclick="location.href='/noteEarth/openNote.do?noteCode=${each.noteCode }&pageIndex=1'">
  <div class="card-body">
    <h5 class="card-title">${each.noteTitle }</h5>
    <p class="card-text" >
    ${fn:substring(each.noteCode,0,4) }/${fn:substring(each.noteCode,4,6) }/${fn:substring(each.noteCode,6,8) }
    </p>
  </div>
</div>
</c:forEach>

</div>

<!-- Modal -->
<div class="modal fade" id="addNewNote" tabindex="-1" aria-labelledby="addNewNoteLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-body p-0">
       <%@include file="/WEB-INF/Req4000/R4000_addnote.jsp" %>
      </div>
    </div>
  </div>
</div>


</body>

</html>