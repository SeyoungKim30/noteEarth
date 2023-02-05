<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.storethumnail{
	max-height: 400px;
	max-width:80%;
	border-radius: 1em;}
	
	.hbox{margin:1em;padding:1em;}
	
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

</head>

<body>

<div class="bg-light container text-center border rounded-3">
<div class="hbox">
<h2>새 노트를 생성할 수 없습니다</h2>
<h5>멤버쉽에 가입하고 노트를 무제한으로 생성해보세요</h5>
</div>

<img class="storethumnail" src="https://images-gmi-pmc.edge-generalmills.com/e59f255c-7498-4b84-9c9d-e578bf5d88fc.jpg" title="">

<div class="row p-4">
<button type="button" class="col btn btn-secondary m-2">다음에 할게요</button>
<button type="submit" class="col btn btn-primary m-2">멤버쉽 가입하기</button>
</div>
</div>


</body>
</html>