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
<%@include file="Top.jsp" %> <%-- TOP호출 --%>
<meta charset="UTF-8">
<title>노트어스</title>
<style>

</style>
<link rel="stylesheet" type="text/css" href="${path}/resources/style/signin.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script>
        function handleCredentialResponse(response) {
          console.log("Encoded JWT ID token: " + response.credential);
        }
        window.onload = function () {
          google.accounts.id.initialize({
            client_id: "480388421855-dkukvie0s0b8q34rtt7ae5kmdfrh59ug.apps.googleusercontent.com",
            callback: handleCredentialResponse
          });
          google.accounts.id.renderButton(
            document.getElementById("buttonDiv"),
            { theme: "outline", size: "large" }  // customization attributes
          );
          google.accounts.id.prompt(); // also display the One Tap dialog
        }
    </script>


<script type="text/javascript">
	$(document).ready(function(){
	var CheckSignUp = '${CheckSignUp}'
		if(CheckSignUp!=""){
			if(CheckSignUp=='1'){
				alert("가입 완료되었습니다. 로그인 후 이용부탁드립니다.")
			}else{
				alert("가입 실패하였습니다.")
			}
		}
		
	var CheckLogin = '${CheckLogin}' 
		if(CheckLogin!=""){
			alert(CheckLogin)
		}
});
</script>
</head>

<body>
  <div class="container  mt-20 SignInForm_Wrap">
  <form class="SignInForm  gy-2" action="NE_Login.do" method="post" onsubmit="CheckLogin()">
    <h1 class="h1 mb-3 fw-bold" style="text-align:center;">WelCome</h1>
    <h1 class="h3 mb-3 fw-bold" style="text-align:center;">Note-Earth</h1>
	<br><br>
    <div class="form-floating">
      <input name="email" type="email" class="form-control" id="floatingInput" required>
      <label for="floatingInput">이메일</label>
    </div>
    <div class="form-floating">
      <input name="password" type="password" class="form-control" id="floatingPassword" required>
      <label for="floatingPassword">비밀번호</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    
    <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
    <button class="w-100 btn btn-lg " type="button" id="SignUpBtn" 
    	data-bs-toggle="modal" data-bs-target="#SignUpModal">회원가입</button>
    <div class="d-flex SnsWrap">
     <div id="buttonDiv"></div> 
     <input type="hidden" name="snsemail">
	<img src="${path}/resources/img/kakao_login_medium_narrow.png" onclick="kakaoLogin()">
    </div>
    
  </form>
    <p class="mt-5 mb-3 text-muted">© Note-Earth</p>
</div>


<!-- 회원가입 모달 -->
<div class="modal fade" id="SignUpModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5 text-center" id="staticBackdropLabel">회원가입</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form class="SignUp_Form" action="NE_SignUp.do" method="post" onsubmit="return CreateMember()">
      <div class="modal-body">
      <label for="SignUp_name" class="form-label">이름</label>
		  <div class="mb-3">
		    <input name="name" type="text" class="form-control"  id="SignUp_name" placeholder="홍길동" required>    
		  </div>
		  
		<label for="SignUp_FrontRrn" class="form-label">주민등록번호</label>
		  <div class="input-group mb-3">
			  <input type="text" class="form-control" placeholder="앞 6자리" id="SignUp_FrontRrn" maxlength="6" required
			  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/> <!-- 숫자만입력하도록 -->
			  <span class="input-group-text">-</span>
			  <input type="text" class="form-control" placeholder="뒤 7자리" id="SignUp_BackRrn"  maxlength="7" required
			  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" ><!-- 숫자만입력하도록 -->
			  <input name="rrn" type="hidden"  id="SignUp_FullRrn" class=""/>
			  <div class="invalid-feedback">올바른 주민등록번호를 입력해주세요.</div>
		  </div>
		  <div class="">
		  	<button type="button" class="btn btn-primary" onclick="CheckUser()">여부확인</button>
		  </div>
		  <hr>
		  <label for="SignUp_email" class="form-label">이메일</label>
		  <div class="mb-3">   
		    <input name="email" type="email" class="form-control" id="SignUp_email"  placeholder="아이디@도메인"  required>
		    <div class="invalid-feedback" id="emailfeedback">이메일양식이 맞지 않습니다.</div>
		  </div>
		  <div class="d-flex justify-content-left">
		  	<button type="button" class="btn btn-primary " id="CheckEmailBtn">이메일 인증</button>
		  	<input type="text" class="form-control w-25" id="checkEmailCode"/>
		  </div>
		   <hr>
		  <div class="mb-3">
		    <label for="password1" class="form-label">비밀번호(8자 이상 / 16자리 이하)</label>
		    <div id="passHelp" class="form-text">숫자/영문/특수문자 중 2가지 이상 혼합</div>
		    <input name=password type="password" class="form-control" id="password1" aria-describedby="passHelp" required>
		  	<div class="invalid-feedback" id="pass1feedback"></div>
		  </div>
		  <div class="mb-3">
		    <label for="password2" class="form-label">비밀번호 확인</label>
		    <input type="password" class="form-control" id="password2" required>
		     <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
		  </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
        <button type="submit" class="btn btn-primary">가입완료</button>
      </div>
     </form>
    </div>
  </div>
</div> <!-- 회원가입 모달끝 -->
<!-- sns확인모달 -->
<div data-bs-toggle="modal" data-bs-target="#SnsresultModal" id="SnsresultModalbtn"></div>
<div class="modal fade" id="SnsresultModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content SnsresultModalContent">
      <div class="modal-header">
        <h1 class="modal-title fs-5 text-center" id="staticBackdropLabel">Result</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
     
      <div class="modal-body">
		<div class="mb-3">
		  <textarea class="form-control" rows="3" id="SNSLoginTextArea"></textarea>
		</div>
		<div class="mb-3 mt-3" style="color:red; font-weight:bold" id="SNSLoginTextAreaAfter"></div>
		<div class="mb-3">
			<input type="hidden" id="snsemail">
			<button type="button" class="btn btn-primary" id="SNSLoginbnt"></button>
		</div>
      </div>
      
      <div class="modal-footer">
        회사소개 | 이용약관 | <strong>개인정보처리방침</strong>
      </div>
     
    </div>
  </div>
</div> <!-- sns확인모달 모달끝 -->
<script src="${path}/resources/js/SignIn.js"></script>
<script>

</script>
</body>
</html>