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

<script src="${path}/resources/module_4000_noteListAjax.js"></script>
</head>

<body>
<h1>로그인 했으면 노트 리스트로</h1>
<h1>안했으면 로그인창으로 자동 이동하게</h1>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addNewNote" id="addNewNoteBtn">
  새 노트 생성하기
</button>
<script>

<c:if test="${not empty Login.name}">
location.href="${path}/selectNoteList.do"
</c:if>
<c:if test="${empty Login.name}">
location.href="${path}/NE_SignIn.do"
</c:if>

</script>



<div class="card" style="width: 18rem;">
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
</div>



<!-- Modal -->
<div class="modal fade" id="addNewNote" tabindex="-1" aria-labelledby="addNewNoteLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-body p-0">
       <%@include file="WEB-INF/Req4000/R4000_addnote.jsp" %>
      </div>
    </div>
  </div>
</div>
</body>
<script>
let noteCode = '32432432465541'
var colorbynoteCode = function(noteCode){
	console.log(noteCode.subString(3))
}

let randomBrightColor = () => {
	  let color_r = Math.floor(Math.random() * 127 + 128).toString(16);
	  let color_g = Math.floor(Math.random() * 127 + 128).toString(16);
	  let color_b = Math.floor(Math.random() * 127 + 128).toString(16);
	  return `#${color_r+color_g+color_b}`;
	}

</script>
</html>