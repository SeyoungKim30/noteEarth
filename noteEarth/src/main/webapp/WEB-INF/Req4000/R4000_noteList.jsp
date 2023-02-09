<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${Login.name }의 노트</title>
<%@include file="/resources/module_header.jsp" %> 

<style>
.cardDeck div{
	margin:0.5em;
	min-width: 10em;
}
div.card:hover{
	color:white;
	box-shadow: 0 0 0.4em rgba(70, 78, 89, 0.7) inset;
	
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
		$(eachCard).css("background",colorCode);
	})

})
</script>

</head>

<body>
<div class="container-lg">


<div class="cardDeck justify-content-center row row-cols-1 row-cols-sm-3 row-cols-lg-4 ">

<c:forEach items="${noteList }" var="each">
<div class="d-flex card border-0 col" id="${each.noteCode }">
  <div class="card-body" style="cursor:pointer;" onclick="location.href='/noteEarth/openNote.do?noteCode=${each.noteCode }&pageIndex=1'">
    <h5 class="card-title">${each.noteTitle }</h5>
    <p class="card-text" >
    ${fn:substring(each.noteCode,0,4) }/${fn:substring(each.noteCode,4,6) }/${fn:substring(each.noteCode,6,8) }
    </p>
    </div>
  <div class="text-end" >
  <span class="badge rounded-pill text-bg-secondary text-end" data-bs-toggle="dropdown">
  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16"><path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"></path></svg>
  </span>
		    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			<a class="dropdown-item" href="#">공유하기</a>
			<a class="dropdown-item delNoteModalBtn" href="#" data-bs-toggle="modal" data-bs-target="#delNoteModal" id="${each.noteCode }">노트삭제</a>
			</div>    
	</div> 		
</div>
</c:forEach>

</div>

</div>
<!-- Modal -->
<div class="modal fade" id="addNewNote" tabindex="-1" aria-labelledby="addNewNoteLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-body p-0">
       <div class="bg-light text-center border rounded-3 ">
			<h2 style="margin:1em;padding:1em">새 노트 생성</h2>
			<form class="form-group" action="createNote.do">
			<div class="mx-3 my-3 p-2"><input class="form-control form-control-lg " name="noteTitle" placeholder="노트 제목"></div>
			<input type="hidden" value="${logon.email }" >
			<%@include file="/resources/module_4001_chooseTemplate.jsp" %>
			<div class="row p-4">
			<button type="button" class="col btn btn-secondary m-2" data-bs-dismiss="modal" aria-label="Close">취소</button>
			<button type="submit" class="col btn btn-primary m-2">노트생성</button>
			</div>
			</form>
			</div>
      </div>
    </div>
  </div>
</div>

<%@include file="/WEB-INF/Req4000/R4021_deleteNote.jsp" %>


</body>

</html>