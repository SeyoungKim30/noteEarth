<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tempSector{
border:#F1F1F1 1px solid;
margin:1em;
padding:1em;
border-radius: 1em;}

.tempArticle{
min-height: 10em;
}

.tempsTemp{
display:none;}
</style>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

</head>
<body>

<div class="row writingCard">
<div class="col tempSector p-2" contenteditable="true"><h1>제목을 입력하세요</h1><div class="tempArticle">내용을 입력하세요</div></div>
<div class="col-1">
	<div class="row"><button type="button" class="btn btn-secondary btnAdd" onclick="addCard(this)">+</button></div>
</div>
</div>

<div class="tempsTemp">
<div class="row writingCard">
<div class="col tempSector p-2" contenteditable="true"><h1>제목을 입력하세요</h1><div class="tempArticle">내용을 입력하세요</div></div>
<div class="col-1">
	<div class="row"><button type="button" class="btn btn-secondary btnAdd" onclick="addCard(this)">+</button></div>
	<div class="row"><button type="button" class="btn btn-secondary btnRemove" onclick="removeCard(this)">-</button></div>
</div>
</div>

</div>
<script>
	function addCard(self){
		let newCard=$(".tempsTemp").html();
		console.log(newCard)
		$(self).parents(".writingCard").after(newCard)
	}
	
	function removeCard(self){
		$(self).parents(".writingCard").remove();
	}
</script>
</body>
</html>