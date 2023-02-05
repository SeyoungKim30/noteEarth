package noteEarth.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import noteEarth.service.R4000_Service;
import noteEarth.vo.Member;
import noteEarth.vo.Notes;
import noteEarth.vo.Pages;

@Controller
public class R4000_Controller {

	@Autowired
	private R4000_Service service;

	
	  //http://localhost:6080/noteEarth/addNote.do
	  
	 @RequestMapping("/addNote.do") public String addNote() {
	  return "/WEB-INF/Req4000/R4000_addnote.jsp"; 
	  }
	 
	@RequestMapping("/selectNoteList.do")
	public String selectNoteList(Model d,HttpServletRequest request) {
		HttpSession session =request.getSession();
		Notes notes = new Notes();
		notes.setEmail(((Member) session.getAttribute("Login")).getEmail());		//메일주소 임시값
		d.addAttribute("noteList",service.selectNoteList(notes));
		return "/WEB-INF/Req4000/R4000_noteList.jsp";	
	}

	 
	
	//http://localhost:6080/noteEarth/createNote.do
	@RequestMapping("/createNote.do")
	public String createNotes(Notes newNote,Pages newPage,Model d,HttpServletRequest request) {
		HttpSession session =request.getSession();
		newNote.setEmail(((Member) session.getAttribute("Login")).getEmail());
		newPage = service.createNotes(newNote, newPage);
		
		return "redirect:/openNote.do?noteCode="+newPage.getNoteCode()+"&pageIndex=1";
	}
	
	@RequestMapping("/openNote.do")
	public String openNote(Pages pages,@RequestParam(value="noteCode",required = false) String noteCode,Model d) {
		System.out.println(pages.getPageCode());
		pages = service.selectPages(pages);	
	System.out.println(pages);
		if(noteCode==null) {
			noteCode = pages.getNoteCode();
		}
		d.addAttribute("notes",service.selectNotes(noteCode));
		d.addAttribute("pages",pages);
		
		return "/WEB-INF/Req4000/R4011_noteViewer.jsp";	
	}

	
	@RequestMapping("/insertPages.do")
	public String insertPages(Pages pages,Model d) {
		//받아야하는거 : 템플릿, 노트, 페이지인덱스
	//	Pages newPage= pages;
//		newPage = service.insertPages(newPage);	//받은걸로 페이지 만들어서 select해서 리턴
		pages = service.insertPages(pages);	//받은걸로 페이지 만들어서 select해서 리턴
		return "redirect:/openNote.do?pageCode="+pages.getPageCode();
	}
	
	@RequestMapping("/deletePages.do")
	public String deletePages(Pages pages,Model d) {
		//페이지 코드랑 노트의 이메일(X안받음) 받아서 노트 소유자만 삭제할 수 있게
		//사용자 확인..? 공동작성하면 email에 추가해서 그 중에 찾는걸로??? 
		//아니면 수정 가능한 사람한테만 del 보이게?? 아 근데 어차피 가능한 사람만 추가고 뭐고 할 수 있으니까 토글자체를 가능한 사람만 보게 하면 이메일도 받ㅇ르 필요 없구나
		Pages prevPages= service.deletePages(pages);	//그 이전페이지 노트코드랑 페이지인덱스만 넣어서 리턴
		
		//삭제하고 나서 앞페이지로 redirect
		return "redirect:/openNote.do?noteCode="+prevPages.getNoteCode()+"&pageIndex="+prevPages.getPageIndex();
	}
	
	@RequestMapping("/updatePageMainHTML.do")
	@ResponseBody
	public String updatePageMainHTML(Pages pages) {
		service.updatePageMainHTML(pages);
		return "saved successfully";
	}
	
}
