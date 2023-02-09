<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>

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