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
<link rel="stylesheet" href="../jw_style.css">
<link rel="stylesheet" href="./reset.css">
<style>
body{
	overflow-x: hidden;
}
	td{text-align:center;}
	header{
padding-left:0px;
padding-right:0px;
padding-top:3px;
padding-bottom:3px;
height: 56px;
display: flex;
justify-content: space-between;
align-items: center;
border-bottom: 1px solid lightgray;
}
header img{
	height: 50px;
	}
header div{
	text-align: center;
	padding-right:10px;
	padding-left:10px;
	align-items: center;}	
	
header .center{padding-left:20px;text-align: center;}
header .lefter{width: 200px; text-align:left;}
header .righter{width: 200px;text-align:right;}
.pagenav{text-align: center; }
.pagenav div{text-align: center;display:inline-block;}
.header-title{
	position: relative;
	width: 100%;
	height: 96px;
	font-style: normal;
	font-weight: 400;
	font-size: 48px;
	line-height: 58px;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	color: #212529;
}
.nav-bar{
	position: relative;
	display:flex;
	width: 100%;
	height: 37px;
	background: #212529;
	margin-bottom: 2%;
	justify-content: space-between;
}
.nav-left a{
	color:#fff;
	font-size: 25px;
	text-decoration: none;
}
.nav-left a:hover{
	text-decoration: underline;
}
.nav-right a{
	color:#fff;
	font-size: 25px;
	text-decoration: none;
}
.nav-right a:hover{
	text-decoration: underline;
}
.table-contain{
	padding-left: 7%;
}
.shop-temp-contain{
	padding-top:2%;
	display:flex;
	justify-content: center;
	gap: 100px;
	flex-wrap: wrap;
}
.temp_img{
width: 300px;
height: 300px;
text-align: center;
}
.temp_preImg{
	width: 300px;
	height: 300px;
}
.temp_header{
	padding-top:10px;
	display: flex;
	justify-content: space-between;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
			
		--%>
/* 		$("#schTitle").keyup(function(){
			if(event.keyCode==13){
				var schLen =$("#schTitle").val();
				console.log($("#schTitle").length);
				if("#schTitle").length()==1){
					alert("1자이상 입력해주세요")
				}
			}
		}) */
/* 		$(".temp-val").dblclick(function(){
			//var tempCodeVal=$(".input-hidden").val();
			//console.log("${path}/template.do?tempCode="+tempCodeVal)
			console.log($(this "input").val)
			//location.href="${path}/template.do?tempCode="+$(".input-hidden").val()
		}) */
	});
	function goDetail(tempCode){
		console.log(tempCode);
		location.href="${path}/template.do?tempCode="+tempCode;
	}
</script>
</head>
<header>

<div class="lefter"><a href="${path }"><img alt="메인으로 가는 이미지" src="https://img.freepik.com/premium-vector/earth-planet-isolated-white-flat-global-earth-icon-vector-simple-illustration-eco-environment_439591-339.jpg?w=360"></a></div>
<div class="center">
	<h4 class="dropdown-toggle dropdown" data-bs-toggle="dropdown" aria-expanded="false">${notes.noteTitle}</h4>
	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    	<a class="dropdown-item" href="${noteEarthurl }/insertPages.do?noteCode=${pages.noteCode }&tempCode=${pages.tempCode }&pageIndex=${pages.pageIndex}">현재 템플릿으로 새 페이지 생성</a>
    	<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#addPageModal">다른 템플릿으로 새 페이지 생성 </a>
    	<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delPageModal">지금 페이지 삭제</a>
  </div></div>
<div class="row righter">
<div class="col"><select class="form-select form-select-sm pageSelect">
	<c:forEach begin="1" end="${notes.totalPageCount }" varStatus="eachSt">
	<option value="${noteEarthurl }/openNote.do?pageIndex=${eachSt.count }&noteCode=${notes.noteCode }">${eachSt.count }</option>
	</c:forEach>
</select></div>
	<a class="col" href="#"><img alt="마이페이지 프로필" src="https://cdn-icons-png.flaticon.com/512/3135/3135823.png"></a>
</div>

</header>
<body>

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
	    <input id="schTitle" name="tempTitle" name="${sch.tempTitle }" class="form-control" placeholder="검색어를 입력해주세요" />
	    <button class="btn btn-dark" type="submit">Search</button>
 	</nav>
	</form>
	<input type="hidden" value="${Login.email }">
	<div class="shop-temp-contain">
		<c:forEach var="pageTemplates" items="${templist }">
	    	<div class="temp-val" 
	    	ondblclick="goDetail('${pageTemplates.tempCode}')">
    			<div class="temp_img">
    				<img class="temp_preImg" src="${pageTemplates.thumbnail }">
    			</div>
		    	<div class="temp_header">
		    		<span>${pageTemplates.tempTitle }</span>
		    		<span>${pageTemplates.sales }</span>
				</div>
				<input type="hidden" value="${pageTemplates.tempCode }" 
				class="input-hidden"></input>
		    </div>
		</c:forEach>
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