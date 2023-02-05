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
<link rel="stylesheet" href="./jw_style.css">
<link rel="stylesheet" href="./reset.css">
<style>
</style>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>
	});
</script>
</head>

<body style="background-color:#e2e2e2;">
<div class="jumbotron text-center">
  <h2 class="header-title">NoteEarth</h2>
</div>
<div class="nav-bar">
	<div class="nav-left" style="padding-left:2.5%">
		<a href="">Note</a>
		<a href="">Market</a>
	</div>
	<div class="nav-right" style="padding-right:2.5%">
		<a href="">Login/Join</a>
		<a href="">MyPage</a>	
	</div>
</div>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control" placeholder="검색어를 입력해주세요" />
	    <button class="btn btn-dark" type="submit">Search</button>
 	</nav>
	</form>
	<div class="table-contain">
   <table>
   	<col width="33%">
   	<col width="33%">
   	<col width="33%">
    <thead>

    </thead>	
    <tbody>
    	<tr>
    	<td><div class="temp_img">템플릿이미지</div>
    	<div class="temp_header">
    	<span>템플릿 이름</span><span style="padding-right: 103px;">구매 횟수</span>
    	</div>
    	</td>
    	<td><div class="temp_img">템플릿이미지</div>
    	<div class="temp_header">
    	<span>템플릿 이름</span><span style="padding-right: 103px;">구매 횟수</span>
    	</div>
    	</td>
    	<td><div class="temp_img">템플릿이미지</div>
    	<div class="temp_header">
    	<span>템플릿 이름</span><span style="padding-right: 103px;">구매 횟수</span>
    	</div>
    	</td>
    	</tr>

    </tbody>
	</table>    
    </div>
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="직책명 입력" name="job">
	      </div>
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>