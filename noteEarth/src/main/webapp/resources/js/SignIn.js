/*로그인 메인화면*/





/*---------------회원가입 모달창-------------------*/

// 인증 및 회원가입완료 확인용 ㅇㅇ
var OkName =false;
var OkFrontRrn = false;
var OkBackRrn = false;
var OkCheck1 = false; //이름/주민 중복검사
var OkEamil = false;
var OkPaa1 = false;
var OkPaa2 = false;


// 주민번호 앞자리 유효성
$('#SignUp_FrontRrn').keyup(function(){ 
	var FRrnLength = $(this).val().length
	if(FRrnLength<6){
		$(this).addClass('is-invalid')
		$(this).removeClass('is-valid')
		OkFrontRrn=false;
	}else{
		$(this).addClass('is-valid')
		$(this).removeClass('is-invalid')
		OkFrontRrn=true;
	}
})
// 주민번호 뒷자리 유효성
$('#SignUp_BackRrn').keyup(function(){
	var BRrnLength = $(this).val().length
	console.log("주민앞자리확인")
	if(BRrnLength<7){
		$(this).addClass('is-invalid')
		$(this).removeClass('is-valid')
		OkBackRrn=false;
	}else{
		// 주민번호 정규식
		var RegRrn=/^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
		var FullRrnVal = $('#SignUp_FrontRrn').val()+'-'+$('#SignUp_BackRrn').val()
		if(!RegRrn.test(FullRrnVal)){
			$(this).addClass('is-invalid')
			$(this).removeClass('is-valid')
		}else{
			$(this).addClass('is-valid')
			$(this).removeClass('is-invalid')
			$('#SignUp_FullRrn').val(FullRrnVal)
			console.log($('#SignUp_FullRrn').val())
			OkBackRrn=true;
		}
	}
})


// 이름/주민번호 기존 여부확인
function CheckUser(){ 
	var NameValCheck = $('#SignUp_name').val().length>0
	var NameVal = $('#SignUp_name').val() //이름 value
	var FulRrnVal = $('#SignUp_FullRrn').val() //주민value
	if(!NameValCheck || !OkFrontRrn || !OkBackRrn){
		alert("이름/주민번호란을 맞게 채워주세요")
	}else{
		var qstr = "name="+NameVal+"&rrn="+FulRrnVal
		$.ajax({
			url:"NE_CheckMem.do",
			type:"post",
			data:qstr,
			dataType:"json",
			success:function(data){
				if(data==null){
					alert("중복확인되었습니다. 감사합니다.")
					$('#SignUp_name,#SignUp_FrontRrn,#SignUp_BackRrn,#SignUp_FullRrn').attr('readonly',true)
					OkCheck1=true;
				}else{
					alert("일치하는 회원이 있습니다. 다시입력바랍니다.")
					$('#SignUp_name,#SignUp_FrontRrn,#SignUp_BackRrn,#SignUp_FullRrn').val('')
					$('#SignUp_name').focus()
				}
			},
			error:function(xhr,status,error){
                  console.log(xhr)
                  console.log(status)
                  console.log(error)
            }
		})
	}	
}

//이메일 양식확인
$('#CheckEmailBtn').click(function(){
	var RegEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var EmailVal = $('#SignUp_email').val()
	if(!RegEmail.test(EmailVal) || EmailVal==''){
		$('pass1feedback').text('이메일 형식이 맞지않습니다.')
		$('#SignUp_email').addClass('is-invalid')
	}else if(!OkCheck1){
		alert("이름/주민번호 중복검사부터 완료 부탁드립니다.")
		$('#SignUp_email').removeClass('is-invalid')
	}
	else{
		var qstr ="email="+EmailVal
		$.ajax({
			url:"NE_CheckEmail.do",
			type:"post",
			data:qstr,
			dataType:"json",
			success:function(data){
				if(data==null){
					$('#SignUp_email').removeClass('is-invalid')
					$('#SignUp_email').addClass('is-valid')
					sendEmail()
				}else{
					alert("중복된 이메일이 있습니다. 다시입력바랍니다.")
					$('pass1feedback').text('이메일 형식이 맞지않습니다.')
					$('#SignUp_email').val('')
					$('#SignUp_email').focus()
					$('#SignUp_email').addClass('is-invalid')
				}
			},
			error:function(xhr,status,error){
                  console.log(xhr)
                  console.log(status)
                  console.log(error)
            }
		})
		
		
	}
})


//이메일 보내기
emailjs.init("mzN3R1G0GZQBRs8hh");
var SixRanNum = ""; 
        function sendEmail(){
        	SixRanNum=""
        	//6자 난수생성
        	for(let i = 0; i < 6; i++) {
        		SixRanNum += Math.floor(Math.random() * 10)
        	  }           	
        	
          var templateParams = {
          //각 요소는 emailJS에서 설정한 템플릿과 동일한 명으로 작성!
                to_name: $('#SignUp_name').val(),
                to_email : $('#SignUp_email').val(),
                message : SixRanNum
                
          }
         emailjs.send('service_ee7pra4','template_azph6ba', templateParams)
         //emailjs.send('service ID', 'template ID > emailjs 페이지에서 만든 템플릿에서 확인이 가능하다', 보낼 내용이 담긴 객체)
         	    .then(function(response) {
         	       alert('입력하신 메일을 확인하시고, 인증번호를 입력부탁드립니다.')
         	       
         	    }, function(error) {
         	       alert('정상적인 제출이 이루어지지 않았습니다. 다시 시도해주세요!')
         	    });
       } 
        
 $('#checkEmailCode').keyup(function(){
    	 if($(this).val()==SixRanNum){
			 alert("확인되었습니다. 감사합니다.")
			 $('#SignUp_email').attr('readonly',true)
    		 $(this).attr('readonly',true)
    		 $(this).addClass("is-valid")
    		 OkEamil = true;
    	 }
      });
      
//비밀번호1 유효성검사
$('#password1').keyup(function chkPW(){
	 var pw = $(this).val();
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩';:₩/?]/gi);
		 if(pw.length < 8 || pw.length > 16){
			 console.log(pw);
			 $('#pass1feedback').text("8자리 ~ 16자리 이내로 입력해주세요.")
			 $(this).addClass('is-invalid')
			 OkPass1 = false;		 
		 }else if(pw.search(/\s/) != -1){
			 $(this).removeClass('is-invalid')
			 $('#pass1feedback').text("비밀번호는 공백 없이 입력해주세요.")
			 $(this).addClass('is-invalid')
			 OkPass1 = false;
		 }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
			 $(this).removeClass('is-invalid')
			 $('#pass1feedback').text("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.")
			 $(this).addClass('is-invalid')
			 OkPass1 = false;
		 }else {
			 $(this).removeClass('is-invalid')
			 $(this).addClass('is-valid')
			 OkPass1 = true;
		 }

})

//비밀번호2 유효성검사
$('#password2').keyup(function(){
	var pass1val = $('#password1').val()
	var pass2val = $(this).val()
	if(!OkPass1){
		alert("위 칸의 비밀번호부터 입력부탁드립니다.")
		$(this).val('')
		$('#password1').focus()
	}else{
		if(pass1val!=pass2val){
			$(this).removeClass('is-valid')
			$(this).addClass('is-invalid')
			OkPaa2=false;
		}else{
			$(this).removeClass('is-invalid')
			$(this).addClass('is-valid')
			OkPaa2=true;
		}
	}
})


//최종 회원가입 
function CreateMember(){

	if(!OkCheck1){
		alert("중복검사 확인 부탁드립니다.")
		$('#SignUp_name').focus()
		return false;
	}
	else if(!OkEamil){
		alert("이메일인증 부탁드립니다.")
		$('#SignUp_email').focus()
		return false;
	}
	else if(!OkPaa2){
		alert("비밀번호 양식 확인 부탁드립니다.")
		$('#password1').focus()
		return false;
	}


}

//연동확인 후, 연동안되있을 때 연동하도록하기
$('#SNSLoginbnt').click(function(){
	  var snsemail = $('#snsemail').val()
	  if($(this).text()=='카카오연동 및 바로 로그인'){
		  location.href='NE_SnsEmailPluss.do?kakaoemail='+snsemail
	  }else if($(this).text()=='확인'){
		  
	  }else{
		  location.href='NE_SnsEmailPluss.do?googleemail='+snsemail
	  }
  })

/*카카오 로그인 연동*/

var connected_at="";
var kakaoemail="";
//카카오로그인
Kakao.init('397291d0416daa0cdb592b95e6b9c7f7'); //발급받은 키 중 javascript키를 사용해준다.
function kakaoLogin(){
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
    Kakao.Auth.login({
      scope:'profile_nickname,account_email',
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
        	  connected_at = response.connected_at
        	  kakao_account = response.kakao_account
        	  if(typeof kakao_account != 'undefined'){
            	  kakaoemail = kakao_account.email;         	
              }
        	  	SNSResult('kakao',kakaoemail)  
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }	
  
  

  
/*구글 로그인*/
     function handleCredentialResponse(response) {
     const responsePayload = decodeJwtResponse(response.credential);

     //console.log("ID: " + responsePayload.sub);
     //console.log('Full Name: ' + responsePayload.name);
     //console.log('Given Name: ' + responsePayload.given_name);
     //console.log('Family Name: ' + responsePayload.family_name);
     //console.log("Image URL: " + responsePayload.picture);
     console.log("Email: " + responsePayload.email);
     SNSResult('google',responsePayload.email)
  }
    function decodeJwtResponse (token) {
    var base64Url = token.split('.')[1];
    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join(''));
    return JSON.parse(jsonPayload);
};

//sns로그인 시도 존재유무 확인
function SNSResult(platforms,snsemail){
	var qstr ="snsemail="+snsemail
				$.ajax({
					url:"NE_CheckKEmail.do",
					type:"post",
					data:qstr,
					dataType:"json",
					success:function(data){
						console.log(data)
						if(data==null){
							ResultModal('no',snsemail)
						}else{
							if(platforms=='kakao'){
								if(data.kakaoemail==null){
									$('#SNSLoginbnt').text('카카오연동 및 바로 로그인')
									.css({"color":"black","background":"yellow","border":"1px solid black"})
									ResultModal('ok',data.email)	 
								}else{
									location.href="NE_Login.do?snsemail="+data.kakaoemail
								}
							}else{
								if(data.googleemail==null){
									$('#SNSLoginbnt').text('구글연동 및 바로 로그인')
									.css({"color":"black","background":"green","border":"1px solid black"})
									ResultModal('ok',data.email)
								}else{
									location.href="NE_Login.do?snsemail="+data.googleemail
								}
							}
						}
					},
					error:function(xhr,status,error){
		                  console.log(xhr)
		                  console.log(status)
		                  console.log(error)
		            }
				})
}

// sns로그인 시도 후 처리결과
function ResultModal(sign,snsemail){
	if(sign=='ok'){
		$('#SNSLoginTextArea').val("<"+snsemail+">"+'로 가입된 아이디가 있습니다.\r\n해당 SNS계정을 연동하시겠습니까?')
		$('#SNSLoginTextAreaAfter').text('')
		$('#SNSLoginbnt').removeAttr('data-bs-dismiss',"modal")
		$('#snsemail').val(snsemail)
		$('#SnsresultModalbtn').click()
	}else{
		$('#SNSLoginTextArea').attr('rows','5')
		$('#SNSLoginTextArea').val(snsemail+'로 가입된 아이디가 없습니다.\r\n회원가입 후, 연동 부탁드립니다.\r\n\r\n로그인->(상단 오른쪽 회원메뉴)회원정보-> sns연동하기')
		$('#SNSLoginTextAreaAfter').text('만일 기존 이메일과 해당 SNS계정이 틀릴 경우 확인이 안되오니, 로그인 후 연동 부탁드립니다.')
		$('#SNSLoginbnt').attr('data-bs-dismiss',"modal")
		$('#SNSLoginbnt').text('확인')
		$('#SnsresultModalbtn').click()
	}
}