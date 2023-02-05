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
  
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.0.3/index.global.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.0.3/main.min.css" rel="stylesheet"></link>

<script id="calendarMaker">
document.addEventListener("DOMContentLoaded", function () {
	  var calendarEl = document.getElementById("calendar");
	  document.querySelector("#renderCal").addEventListener("click",function(){
			let initialDateInput=document.querySelector("[name=initialDateInput]")
			  var calendar = new FullCalendar.Calendar(calendarEl, {
					initialDate: initialDateInput.value,
				    timeZone: "UTC",
				    themeSystem: "bootstrap5",
				   
				    weekNumbers: false,
				    dayMaxEvents: true, // allow "more" link when too many events
				 
				  });
				  calendar.render();
					$("table").attr("style","");
					$("table").css("width","80%")
					$(".fc-view-harness-active").attr("style","");
			    	$(".fc-daygrid-day-events").attr( "contenteditable", "true" )
			    	$("td .fc-day").css("overflow", "auto")
			    	$("td .fc-day").css("text-overflow", "ellipsis")
			    	$(".fc-daygrid-day-events").css("padding","5px")
			    	
				  document.querySelector("#setMonth").remove();
			
				  let calinnerHTML = $('#calendarAndScript').html()
				  document.write(calinnerHTML)
			  
		})

	});
    </script>
</head>

<body>
<div class="row" id="setMonth">
<input class="form-control col" type="month" name="initialDateInput">
<button class="form-control col" type="button" id="renderCal">캘린더 생성</button>
</div>
    <div id="calendarAndScript">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <style>
  .fc-daygrid-day{
  padding:3px;
  vertical-align: top;
  border:1px lightgray solid;
  }
  </style>
	<div id="calendar"></div>
	    <script>
	$('body').click(function(){
	
	})
	
	$("td .fc-day").children().click(function(){
    		$(this).parents('.fc-day').find(".fc-daygrid-day-events").focus()
    	 })
    	
	   
	</script>
	
    </div>
</body>


</html>
