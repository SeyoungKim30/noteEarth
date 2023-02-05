<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="noteEarthurl" value="http://localhost:6080/noteEarth"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>${notes.noteTitle}</title>

<style>

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

</style>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<script>
$(function() {
	
	
})
</script>
<body>

<header>

<div class="lefter"><a href="${noteEarthurl }"><img alt="메인으로 가는 이미지" src="https://img.freepik.com/premium-vector/earth-planet-isolated-white-flat-global-earth-icon-vector-simple-illustration-eco-environment_439591-339.jpg?w=360"></a></div>
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

notes : ${notes.noteCode }<br>
 &nbsp;${notes.email }<br>
pages: ${pages.pageIndex }<br>
 &nbsp;${pages.pageCode }<br>
 &nbsp;${pages.tempCode }<br>
 &nbsp;${pages.noteCode }<br>
noteEarthurl : ${noteEarthurl }

<main>
${pages.mainHTML}
</main>

서버용 코드 바꿀거 c:set var="noteEarthurl" value="http://106.10.71.20:6080/noteEarth"/

<div class="pagenav">
<div>
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link previousPage" href="${noteEarthurl }/openNote.do?pageIndex=${pages.pageIndex - 1}&noteCode=${notes.noteCode }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    	<c:forEach begin="1" end="${notes.totalPageCount }" varStatus="eachSt">
   			 <li class="page-item"><a class="page-link" href="${noteEarthurl }/openNote.do?pageIndex=${eachSt.count }&noteCode=${notes.noteCode }">${eachSt.count }</a></li>
    	</c:forEach>
    <li class="page-item">
      <a class="page-link nextPage" href="${noteEarthurl }/openNote.do?pageIndex=${pages.pageIndex + 1}&noteCode=${notes.noteCode }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</div>
</div>

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
        <button type="button" class="btn btn-danger" onclick="location.href='${noteEarthurl}/deletePages.do?pageCode=${pages.pageCode}&pageIndex=${pages.pageIndex }&noteCode=${pages.noteCode }&tempCode=${pages.tempCode }'">페이지 삭제</button>
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
<%@include file="module_4001_chooseTemplate.jsp" %>
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


<script>
var thispageIndex = ${pages.pageIndex}

//하단 페이지내비에 현재 페이지 파란색으로
$('.page-item').each(function(idx,eachitem){
	if(idx==thispageIndex){
		$(this).addClass('active')
	}
})

//헤더에 페이지 셀렉트에서 현재 페이지 선택되어있게
$('.pageSelect option').each(function(idx,eachoption){
	if($(this).text()==thispageIndex){
		$(this).attr('selected','selected')
	}
})

//페이지 셀렉트로 이동
$('.pageSelect').change(function(){
	location.href=$(this).val()
})

//첫페이지 마지막페이지에서 앞뒤로 가는 화살표 못누르게
if(thispageIndex==1){
	$('.previousPage').removeAttr('href');
}
if(thispageIndex==${notes.totalPageCount }){
	$('.nextPage').removeAttr('href');
}

//자동저장
var mainkids=$('main').children()
	mainkids.keyup(function(){
/* 		let newhtml = $('main').html()
		location.href="${noteEarthurl}/updatePageMainHTML.do?pageCode=${pages.pageCode}&mainHTML="+newhtml
		console.log(newhtml) */
			$.ajax({
				url:"${path}/updatePageMainHTML.do",
				type:"post",
				data : "pageCode=${pages.pageCode}&mainHTML="+$('main').html(),
				dataType: "text",
				success:function(data){
					console.log(data)
				},
				error:function(xhr,status,error){
					console.log(xhr)
					console.log(status)
					console.log(error)
				}
			})  
		})

</script>
</body>
</html>