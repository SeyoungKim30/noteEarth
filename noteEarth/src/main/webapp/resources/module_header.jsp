<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<html>

<meta charset="UTF-8">

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2/dist/email.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>


<link rel="stylesheet" type="text/css" href="${path }/resources/style/noteViewer_hearder.css">


<header>

<div class="lefter"><a href="${path }"><img alt="메인으로 가는 이미지" src="https://img.freepik.com/premium-vector/earth-planet-isolated-white-flat-global-earth-icon-vector-simple-illustration-eco-environment_439591-339.jpg?w=360"></a></div>

<c:if test="${not empty notes }">
<div class="center">
	<h4 class="dropdown-toggle dropdown" data-bs-toggle="dropdown" aria-expanded="false" id="headerNoteTitle">${notes.noteTitle}</h4>
		<c:if test="${notes.email==Login.email }">
		<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			<li><a class="dropdown-item" href="${path }/insertPages.do?noteCode=${pages.noteCode }&tempCode=${pages.tempCode }&pageIndex=${pages.pageIndex}">현재 템플릿으로 새 페이지 생성</a></li>
		    <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#addPageModal" id="addNewNoteBtn">다른 템플릿으로 새 페이지 생성 </a></li>
		    <li><hr class="dropdown-divider"></li>
		    	<c:if test="${notes.totalPageCount>1 }">
			    <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delPageModal">지금 페이지 삭제</a></li>
		    	</c:if>
		    <li><hr class="dropdown-divider"></li>
		    <li><a class="dropdown-item upNoteModalBtn" href="#" data-bs-toggle="modal" data-bs-target="#updateNoteModal" >노트 제목 변경</a></li>
		    <li><a class="dropdown-item delNoteModalBtn" href="#" data-bs-toggle="modal" data-bs-target="#delNoteModal" id="${notes.noteCode }">노트 삭제</a></li>
		</ul>
		</c:if>
</div>
</c:if>
  
<div class="row righter">
	<c:if test="${empty notes }">
	<div class="col">
	<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#addNewNote" id="addNewNoteBtn">새 노트 생성하기</button>
	</div>
	</c:if>

<c:if test="${not empty notes }">
	<div class="col">
		<select class="form-select form-select-sm pageSelect">
		<c:forEach begin="1" end="${notes.totalPageCount }" varStatus="eachSt">
		<option value="${path }/openNote.do?pageIndex=${eachSt.count }&noteCode=${notes.noteCode }">${eachSt.count }</option>
		</c:forEach>
		</select>
	</div>
</c:if>

	<c:if test="${Login.name!=null}"> 
	<div class="col">
		<a href="#" data-bs-toggle="dropdown" aria-expanded="false">
		<img alt="마이페이지 프로필" src="https://cdn-icons-png.flaticon.com/512/3135/3135823.png">
		</a>
			 <ul class="dropdown-menu">
		            <li><a class="dropdown-item" href="#">설정</a></li>
		            <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#MemberInfoModal">회원정보</a></li>
		            <li><hr class="dropdown-divider"></li>
		            <li><a class="dropdown-item" href="NE_Logout.do">로그아웃</a></li>
		     </ul>
	</div>
	</c:if>
</div>

</header>



<!-- 회원정보 확인창 -->

<div class="modal fade" id="MemberInfoModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
  <div class="row">
    <div class="modal-content col InfoMadalContent">
      <div class="modal-header">
        <h1 class="modal-title fs-5 text-center" id="staticBackdropLabel">'${Login.name}'님 회원정보</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form class="MemInfo_Form" action="NE_UpdateInfo.do" method="post">
      <div class="modal-body">
      <label for="MemInfo_name" class="form-label">이름</label>
		  <div class="mb-3">
		    <input name="name" type="text" class="form-control"  id="MemInfo_name" value="${Login.name}" readonly>    
		  	<input name="rrn" type="hidden" value="${Login.rrn }"/>
		  </div>
		  
		  <hr>
		  
		  <label for="MemInfo_email" class="form-label">이메일</label>
		  <div class="mb-3">   
		    <input name="email" type="email" class="form-control" id="MemInfo_email"  value="${Login.email}"  required>
		    <div class="invalid-feedback" id="uptemailfeedback">이메일양식이 맞지 않습니다.</div>
		  </div>
		  <div class="d-flex justify-content-left" id="CheckEmail_Wrap">
		  	<button type="button" class="btn btn-primary " id="CheckUptEmailBtn">이메일 인증</button>
		  	<input type="text" class="form-control w-25" id="checkUptEmailCode"/>
		  </div>
		  <label for="MemInfo_SNSemail" class="form-label">연동 계정</label>
		  <div class="mb-3"> 
		  	<label for="" class="form-label">카카오</label>  
		    <input name="kakaoemail" type="email" class="form-control" id="MemInfo_SNSemail1"  value="${Login.kakaoemail }" placeholder="카카오연동이메일" readonly>
		    <label for="" class="form-label">구글</label> 
		    <input name="googleemail" type="email" class="form-control" id="MemInfo_SNSemail2"  value="${Login.googleemail }" placeholder="구글이메일" readonly>
		   
		  </div>
		  
		   <hr>
		  <div class="mb-3">
		    <label for="MemInfo_password1" class="form-label " >비밀번호</label>
		    <div id="passHelp" class="form-text UptPass">숫자/영문/특수문자 중 2가지 이상 혼합(8자리 이상 16자리 이하)</div>
		    <input name=password type="password" class="form-control" id="MemInfo_password1" aria-describedby="passHelp" value="${Login.password }" required>
		  	<div class="invalid-feedback" id="uptpass1feedback"></div>
		  </div>
		  <div class="mb-3">
		    <label for="MemInfo_password2" class="form-label UptPass" >비밀번호 확인</label>
		    <input type="password" class="form-control UptPass" id="MemInfo_password2" required>
		     <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
		  </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
        <button type="button" class="btn btn-success" id="ConnectSNS">SNS계정연동</button>
        <button type="button" class="btn btn-primary" id="UptUserInfoBtn">수정하기</button>
      </div>
     </form>
    </div>
      <div class="modal-content col SNSModalContent">
      <div class="modal-header">
        <h1 class="modal-title fs-5 text-center" id="staticBackdropLabel">SNS 연동</h1>
        <button type="button" class="btn-close"  id="SNSModalClose"></button>
      </div>
      <div class="modal-body">
      	<div>
      	<h4 style="text-align:center;">구글연동</h4>
	       <img src="${path}/resources/img/btn_google_signin_light_normal_web.png">
	    <h4 style="text-align:center;">카카오연동</h4>
		   <img src="${path}/resources/img/kakao_login_medium_narrow.png">
	   </div>
      </div>
      <div class="modal-footer">
      	연동 이후,로그인 화면에서 <strong>SNS로그인을 바로 이용</strong>할 수 있습니다.
      </div>
     
    </div>
    </div>
  </div>
</div>
  
  
  
  
 <%--EL태그써야하면 여기 --%>
<script>
var SessionEmail = '${Login.email}'; //세션처리된 이메일
var SessionPass = '${Login.password}'; //세션처리된 비밀번호


emailjs.init("mzN3R1G0GZQBRs8hh");
</script>
<script src="${path}/resources/js/Top.js"></script> <%--el태그안써도되는것만 여기 --%>




</html>