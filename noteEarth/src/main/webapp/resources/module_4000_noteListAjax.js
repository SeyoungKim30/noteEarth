
$(function() {

	$.ajax({
		url:"selectNoteList.do",
		type:"post",
		dataType:"json",
		success:function(data){
			console.log(data)
		},
		error:function(xhr,status,error){
				console.log(xhr)
				console.log(status)
				console.log(error)
		}
	})


});