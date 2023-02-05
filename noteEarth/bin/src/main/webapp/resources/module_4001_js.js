
$(function() {

$.ajax({
		url:"selectMyTemps.do",
		type:"post",
		dataType:"json",
		success:function(data){
			var temthumnailsAddHTML="";
			console.log(data)
			$(data.myTempsList).each(function(idx,eachTemp){
				temthumnailsAddHTML+='<label><img src="'+eachTemp.thumbnail+'" title="'+eachTemp.tempTitle +'"><input type="radio" name="tempCode" value="'+eachTemp.tempCode +'"></label>'
			})
			$(".temthumnails").html(temthumnailsAddHTML);	
			
			//ajax로 생성된 object에 대한 function이기 때문에 ajax 실행된 후에 click이벤트 부여해야해서 ajax명령 안에 넣음
				$('[name=tempCode]').click(function(){
					$('[name=tempCode]').siblings().removeClass('selectedLabel');
					$(this).siblings().addClass('selectedLabel');
				})
			
		},
		
		error:function(xhr,status,error){
				console.log(xhr)
				console.log(status)
				console.log(error)
		}
	})
	

});