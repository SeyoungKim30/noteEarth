<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<div class="bg-light text-center border rounded-3 ">
<h2 style="margin:1em;padding:1em">새 노트 생성</h2>
<form class="form-group" action="createNote.do">
<div class="mx-3 my-3 p-2"><input class="form-control form-control-lg " name="noteTitle" placeholder="노트 제목"></div>
<input type="hidden" value="${logon.email }" >
<%@include file="module_4001_chooseTemplate.jsp" %>
<div class="row p-4">
<button type="button" class="col btn btn-secondary m-2" data-bs-dismiss="modal" aria-label="Close">취소</button>
<button type="submit" class="col btn btn-primary m-2">노트생성</button>
</div>
</form>
</div>