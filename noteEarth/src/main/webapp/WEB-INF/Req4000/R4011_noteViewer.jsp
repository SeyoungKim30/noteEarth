<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>${notes.noteTitle}</title>

<%@include file="/resources/module_header.jsp" %> 
</head>

<body>
notes : ${notes.noteCode }<br>
 &nbsp;${notes.email }<br>
pages: ${pages.pageIndex }<br>
 &nbsp;${pages.pageCode }<br>
 &nbsp;${pages.tempCode }<br>
 &nbsp;${pages.noteCode }<br>


<main>
${pages.mainHTML}
</main>

서버용 코드 바꿀거 c:set var="path" value="http://106.10.71.20:6080/noteEarth"/

<div class="pagenav">
<div>
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link previousPage" href="${path }/openNote.do?pageIndex=${pages.pageIndex - 1}&noteCode=${notes.noteCode }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    	<c:forEach begin="1" end="${notes.totalPageCount }" varStatus="eachSt">
   			 <li class="page-item"><a class="page-link" href="${path }/openNote.do?pageIndex=${eachSt.count }&noteCode=${notes.noteCode }">${eachSt.count }</a></li>
    	</c:forEach>
    <li class="page-item">
      <a class="page-link nextPage" href="${path }/openNote.do?pageIndex=${pages.pageIndex + 1}&noteCode=${notes.noteCode }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</div>
</div>

<%@include file="/WEB-INF/Req4000/R4021_deleteNote.jsp" %>
<%@include file="/WEB-INF/Req4000/R4012_addDelPages.jsp" %>


<!-- Modal -->
<div class="modal fade" id="updateNoteModal" tabindex="-1" aria-labelledby="updateNoteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="updateNoteModalLabel">노트 제목 변경</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form id="updateNoteForm" >
      <div class="modal-body">
      <input name="noteCode" value="${notes.noteCode }" type="hidden">
      <input name="noteTitle" class="form-control" value="${notes.noteTitle}" id="inputNoteTitle">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" >변경하기</button>
      </div>
      </form>
    </div>
  </div>
</div>
<script>

$("#updateNoteForm").submit(function(){
	$.ajax({
		url:"${path }/updateNote.do",
		type:"post",
		data: $("#updateNoteForm").serialize(),
		dataType: "text",
		success:function(data){
				$("#headerNoteTitle").text(data)
		},
		error:function(xhr,status,error){
			console.log(xhr)
			console.log(status)
			console.log(error)
		}
	})
})
</script>


<script>
var thispageIndex = ${pages.pageIndex}

//하단 페이지내비에 현재 페이지 파란색으로
$('.page-item').each(function(idx,eachitem){
	if(idx==thispageIndex){
		$(this).addClass('active')
	}
})

//헤더에 페이지 셀렉트에서 현재 페이지 선택되어있게
$('.pageSelect option').each(function(idx,eachoption){
	if($(this).text()==thispageIndex){
		$(this).attr('selected','selected')
	}
})

//페이지 셀렉트로 이동
$('.pageSelect').change(function(){
	location.href=$(this).val()
})

//첫페이지 마지막페이지에서 앞뒤로 가는 화살표 못누르게
if(thispageIndex==1){
	$('.previousPage').removeAttr('href');
}
if(thispageIndex==${notes.totalPageCount }){
	$('.nextPage').removeAttr('href');
}

//자동저장
var mainkids=$('main').children()
	mainkids.keyup(function(){
/* 		let newhtml = $('main').html()
		location.href="${path}/updatePageMainHTML.do?pageCode=${pages.pageCode}&mainHTML="+newhtml
		console.log(newhtml) */
			$.ajax({
				url:"${path}/updatePageMainHTML.do",
				type:"post",
				data : "pageCode=${pages.pageCode}&mainHTML="+$('main').html(),
				dataType: "text",
				success:function(data){
					console.log(data)},
				error:function(xhr,status,error){
					console.log(xhr)
					console.log(status)
					console.log(error)
				}
			})  
		})

</script>
</body>
</html>