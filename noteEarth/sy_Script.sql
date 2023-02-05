
-- 노트
--DROP TABLE IF EXISTS notes;

-- 노트
CREATE TABLE notes (
	noteCode varchar2(100) PRIMARY key,
	email varchar2(100) NULL,
	noteTitle varchar2(100) NULL
);

-- 페이지
--DROP TABLE IF EXISTS pages;

-- 페이지
CREATE TABLE pages (
	pageCode varchar2(100) PRIMARY key,
	noteCode varchar2(100) NULL,
	tempCode varchar2(100) NULL,
	mainHTML CLOB
);

ALTER TABLE pages ADD pageIndex NUMBER;

CREATE sequence notesSeq
INCREMENT BY 1
START WITH 1000
nocycle
nocache;

CREATE sequence pagesSeq
INCREMENT BY 1
START WITH 1000
nocycle
nocache;

SELECT to_char(sysdate,'YYYYMMDDHH24MISS')||notesSeq.nextval FROM dual;
SELECT to_char(sysdate,'YYYYMMDDHH24MISS')||pagesSeq.nextval FROM dual;

INSERT INTO notes values('202301252309271005','jeju@email.com','월간지출');
INSERT INTO pages values('202301261723241007','202301252309271005','month1','<h2>hello</h2>','1');

SELECT * FROM notes;
SELECT * FROM pages;

INSERT INTO pages VALUES ('202301302203251021','202301302203251026','BRT1','<table class="table"><thead><tr><th>table head</th></tr></thead></table>',2)

--노트정보(페이지수 포함)
SELECT n.* , totalPageCount FROM notes n, (SELECT max(pageIndex) totalPageCount FROM pages WHERE notecode='202301302203251026') lp
WHERE notecode='202301302203251026' ;

SELECT * FROM pages WHERE notecode='202301302203251026' AND pageIndex = 2 AND 1=1;

--입력했을때 수정
update pages set mainHTML = '<h3 contenteditable="true">맛있겠다</h3>' where pageCode = 202301311248221023 ;

--DELETE FROM notes;
--DELETE FROM pages;

-- 템플릿
DROP TABLE IF EXISTS PageTemplates;

-- 템플릿
CREATE TABLE PageTemplates (
	tempCode varchar2(100) NOT NULL,
	tempTitle varchar2(100) NULL,
	price number NULL,
	category varchar2(100) NULL,
	sales number NULL,
	thumbnail varchar2(100) NULL,
	templateHTML CLOB NULL
);


SELECT * FROM PAGETEMPLATES ;
UPDATE PAGETEMPLATES SET thumbnail = 'resources\img\thumnail_month1.PNG' WHERE TEMPCODE = 'MONTH1';
UPDATE PAGETEMPLATES SET thumbnail = 'resources\img\thumnail_BRT1.PNG', TEMPLATEHTML = '<h3 contenteditable="true">부리또</h3>' WHERE TEMPCODE = 'BRT1';


/*INSERT INTO PAGETEMPLATES VALUES ('BRT1','부리또',0,'레시피',0,'resources\img\BRT1.PNG','<h3>맛있겠다</h3>'); 
INSERT INTO PAGETEMPLATES VALUES ('BASIC1','기본입력카드',0,'기본',0,'resources\img\thumnail_basic1.PNG','<style>
.tempSector{
border:#F1F1F1 1px solid;
margin:1em;
padding:1em;
border-radius: 1em;}

.tempArticle{
min-height: 10em;
}

.tempsTemp{
display:none;}
</style>

<div class="row writingCard">
<div class="col tempSector p-2" contenteditable="true"><h1>제목을 입력하세요</h1><div class="tempArticle">내용을 입력하세요</div></div>
<div class="col-1">
	<div class="row"><button type="button" class="btn btn-secondary btnAdd" onclick="addCard(this)">+</button></div>
</div>
</div>

<div class="tempsTemp">
<div class="row writingCard">
<div class="col tempSector p-2" contenteditable="true"><h1>제목을 입력하세요</h1><div class="tempArticle">내용을 입력하세요</div></div>
<div class="col-1">
	<div class="row"><button type="button" class="btn btn-secondary btnAdd" onclick="addCard(this)">+</button></div>
	<div class="row"><button type="button" class="btn btn-secondary btnRemove" onclick="removeCard(this)">-</button></div>
</div>
</div>

</div>
<script>
	function addCard(self){
		let newCard=$(".tempsTemp").html();
		console.log(newCard)
		$(self).parents(".writingCard").after(newCard)
	}
	
	function removeCard(self){
		$(self).parents(".writingCard").remove();
	}
</script>'); 

INSERT INTO PAGETEMPLATES VALUES ('MONTH1','월간 캘린더 기본형',0,'월간',0,'resources\img\thumnail_month1.PNG','  
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.0.3/index.global.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.0.3/main.min.css" rel="stylesheet"></link>
<script>
document.addEventListener("DOMContentLoaded", function () {
	  var calendarEl = document.getElementById("calendar");
	  document.querySelector("#renderCal").addEventListener("click",function(){
			let initialDateInput=document.querySelector("[name=initialDateInput]")
			  var calendar = new FullCalendar.Calendar(calendarEl, {
					initialDate: initialDateInput.value,
				    timeZone: "UTC",
				    themeSystem: "bootstrap5",
				    headerToolbar: {
				      right: "dayGridMonth,timeGridWeek,timeGridDay,listMonth"
				    },
				    weekNumbers: false,
				    dayMaxEvents: true, // allow "more" link when too many events
				 
				  });
				  calendar.render();
				  document.querySelector("#setMonth").remove();
				  
				  $(".fc-daygrid-day-events").attr( "contenteditable", "true" )
				  $("td .fc-day").css("overflow", "auto")
				  $("td .fc-day").css("text-overflow", "ellipsis")
				  
				  $("td .fc-day").click(function(){
					  $(this).find(".fc-daygrid-day-events").focus()
				  })
			
				  
		})
	});
    </script>
<div class="row" id="setMonth">
<input class="form-control col" type="month" name="initialDateInput">
<button class="form-control col" type="button" id="renderCal">캘린더 생성</button>
</div>
    <div id="calendar"></div>
');
*/
-- 내가 산거
--DROP TABLE IF EXISTS myTemplates;

-- 내가 산거
CREATE TABLE myTemplates (
	email varchar2(100),
	tempCode varchar2(100)
);

--ALTER TABLE myTemplates MODIFY tempCode varchar2(100);
--ALTER TABLE myTemplates MODIFY email varchar2(100);

INSERT INTO MYTEMPLATES VALUES ('jeju@email.com','MONTH1');
INSERT INTO MYTEMPLATES VALUES ('jeju@email.com','BRT1');
INSERT INTO MYTEMPLATES VALUES ('jeju@email.com','BASIC1');

SELECT p.TEMPCODE ,TEMPTITLE, CATEGORY,THUMBNAIL FROM MYTEMPLATES m , PAGETEMPLATES p WHERE p.TEMPCODE = m.TEMPCODE AND email ='jeju@email.com' ;

SELECT * FROM pages WHERE PAGECODE = '202302011045111013';