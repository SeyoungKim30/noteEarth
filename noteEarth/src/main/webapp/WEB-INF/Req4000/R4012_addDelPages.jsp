<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!--delPageModal  -->
<div class="modal fade" id="delPageModal" tabindex="-1" aria-labelledby="delPageModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="delPageModalLabel">현재 페이지 삭제</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
    <span class="text-danger">삭제한 페이지는 복구할 수 없습니다.</span><br>
        정말 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-danger" onclick="location.href='${path}/deletePages.do?pageCode=${pages.pageCode}&pageIndex=${pages.pageIndex }&noteCode=${pages.noteCode }&tempCode=${pages.tempCode }'">페이지 삭제</button>
      </div>
    </div>
  </div>
</div>

<!--add Modal -->
<div class="modal fade" id="addPageModal" tabindex="-1" aria-labelledby="addPageModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="addPageModalLabel">새 페이지 생성 </h1>
      </div>
      <div class="modal-body">
<form class="form-group" action="insertPages.do">
<%@include file="/resources/module_4001_chooseTemplate.jsp" %>
<input type="hidden" name="noteCode" value="${notes.noteCode }">
<input type="hidden" name="pageCode" value="${pages.pageCode }">
<input type="hidden" name="pageIndex" value="${pages.pageIndex }">
<div class="row p-4">
<button type="button" class="col btn btn-secondary m-2" data-bs-dismiss="modal" aria-label="Close">취소</button>
<button type="submit" class="col btn btn-primary m-2">페이지 추가</button>
</div>
</form>
      </div>
    </div>
  </div>
</div>