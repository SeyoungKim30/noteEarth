<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>

<body>

	
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addNewNote">
  새 노트 생성하기
</button>
대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴대ㅑ충이런저런 메인메뉴
<img src="resources\img\thumnail_month1.PNG" title="">${path }
<!-- Modal -->
<div class="modal fade" id="addNewNote" tabindex="-1" aria-labelledby="addNewNoteLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-body p-0">
       <%@include file="R4000_addnote.jsp" %>
      </div>
    </div>
  </div>
</div>
</body>
</html>