<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- class="delNoteModalBtn" data-bs-toggle="modal" 
data-bs-target="#delNoteModal" id="${each.noteTitle }">
 --%>

 <!-- deletenote Modal -->
<div class="modal fade" id="delNoteModal" tabindex="-1" aria-labelledby="delNoteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="delNoteModalLabel">노트삭제</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        삭제한 노트는 복구할 수 없습니다.<br>
        정말 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-danger" id="delNoteFinalBtn">노트 삭제</button>
      </div>
    </div>
  </div>
</div>

<script>
$(".delNoteModalBtn").click(function(){
	let delnotecode='${notes.noteCode }'
	let	delnotetitle='${notes.noteTitle }'
	if(delnotetitle==''){
		delnotetitle=$(this).parents(".card").find('.card-title').text()
		delnotecode = $(this).attr('id')
	 }
	 
	$('#delNoteModalLabel').text(delnotetitle +' 삭제')
	$('#delNoteFinalBtn').click(function(){
		location.href='${path}/deleteNote.do?noteCode='+delnotecode
	})
})
</script>