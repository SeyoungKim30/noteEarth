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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <style>
    body {
      min-height: 100vh;
      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }
    .input-form {
      max-width: 680px;
      margin-top: 80px;
      padding: 32px;
      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    td{
    	text-align:center;
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
	.temp-flex-contain{
		display:flex;
		gap: 50px;
	}
	.datail-btn{
		display: block;
		width: 100%;
	}
	.datail-btn-contain{
		padding-top: 5%;
	}
  </style>
<script type="text/javascript">
	$(document).ready(function(){

		
	    var msg = "${msg}"
	        if(msg!=""){
	        	if(confirm(msg+"\n 조회화면으로 이동하시겠습니까?")){
	            	location.href="${path}/shopTempList.do";
	            }
        }
		$("#goMain").click(function(){
			location.href="${path}/shopTempList.do"			
		});
	    $("#buyBtn").click(function(){
	  		if(confirm("구매하시겠습니까?")){
	  			$("form").submit()
	  		}
			
      	})
	});
</script>
</head>

<body>
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">템플릿</h4>
        
        <form method="post" 
        action="${path}/insertTemp.do" class="validation-form" novalidate>
          <div class="temp-flex-contain">
          	<div class="temp-flex-contain-left">
          		<div class="temp_img">
          		<img class="temp_preImg" src="${temp.thumbnail }">
          		</div>
          	</div>
          	<div class="temp-flex-contain-right">
          		<input type="hidden" name="tempCode" value="${temp.tempCode}">
          		<input type="hidden" name="email" value="${Login.email }">
          		<input type="hidden" name="sales" value="${temp.sales }">
          		<p><span>템플릿 코드 : </span>${temp.tempCode }</p>
          		<p><span>템플릿 이름 : </span>${temp.tempTitle }</p>
          		<p><span>템플릿 가격 : </span>${temp.price }</p>
          		<p><span>템플릿 종류 : </span>${temp.category }</p>
          		<p><span>판 매 량 : </span>${temp.sales }</p>
          	</div>
          </div>
          <div class="datail-btn-contain">
			<button id="buyBtn" type="button" class="btn btn-outline-primary btn-lg btn-block datail-btn" style="margin-bottom: 5%;">템플릿 구매</button>
          	<button id="goMain" type="button" class="btn btn-secondary  btn-lg btn-block datail-btn" >이전 화면</button>
          </div>
        </form>
      </div>
    </div>
</body>
</html>