package noteEarth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import noteEarth.dao.R2000_myTempsDao;
import noteEarth.dao.R4000_notesDao;
import noteEarth.vo.Notes;
import noteEarth.vo.Pages;

@Service
public class R4000_Service {

	@Autowired(required = false )
	private R4000_notesDao dao4000;
	
	@Autowired
	private R2000_myTempsDao dao2000;
	
	public Pages createNotes(Notes newNote,Pages newPages) {
		//노트객체랑 페이지객체(템플릿코드만 있는)받아서 노트만들고 페이지객체 채워서 리턴
		String noteCode = dao4000.createNotesSeq();
		newNote.setNoteCode(noteCode);
		if(newNote.getNoteTitle().length()<1) {newNote.setNoteTitle("untitled");}
		dao4000.insertNotes(newNote);
		
		String pageCode=dao4000.createPagesSeq();
		newPages.setPageCode(pageCode);
		newPages.setNoteCode(noteCode);
		newPages.setMainHTML(dao2000.selectTemplateHTML(newPages.getTempCode()));//템프코드로 검색해서
		newPages.setPageIndex(1);
		
		dao4000.insertPages(newPages);
		return newPages;
	}
		
	public List<Notes> selectNoteList(Notes notes) {
		return dao4000.selectNotes(notes);
	}
	
	public Notes selectNotes(String noteCode) {
		Notes notes = new Notes();
		notes.setNoteCode(noteCode);
		return dao4000.selectNotes(notes).get(0);
	}
	
	public void updateNotes(Notes note) {
		dao4000.updateNotes(note);
	}
	
	public Pages selectPages(Pages pages) {
		if(pages.getPageIndex()==0&&pages.getPageCode()==null) {	//노트코드만 입력했을때
			pages.setPageIndex(1);
		}
		return dao4000.selectPages(pages);
	}
	
	public void deleteNotes(Notes notes) {
		dao4000.deleteNotes(notes);
	}
	
	
	public Pages deletePages(Pages pages) {
		//지움
		dao4000.deletePages(pages);
		//뒤에 페이지들 앞으로 땡기기
		dao4000.reduce1intoPageIndexAfterdeletedPage(pages);
		//삭제한 페이지의 앞장 페이지로 이동할 수 있게 불러와서 리턴
		if(pages.getPageIndex()!=1) {
			pages.setPageIndex(pages.getPageIndex()-1);
		}
		pages.setPageCode(null);
		return dao4000.selectPages(pages);
	}

	public Pages insertPages(Pages pages) {
		String pageCode=dao4000.createPagesSeq();
		pages.setPageCode(pageCode);
		pages.setPageIndex(pages.getPageIndex()+1);//현재 페이지인덱스에 1 더해서 다음장에 저장
		dao4000.add1intoPageIndexAfterThisPage(pages);//위에서 설정한 인덱스랑 똑같은거 있으면 하나씩 더함
		pages.setMainHTML(dao2000.selectTemplateHTML(pages.getTempCode()));
		dao4000.insertPages(pages);	//인서트
		return dao4000.selectPages(pages);
	}
	
	
	public void updatePageMainHTML(Pages pages) {
		dao4000.updatePageMainHTML(pages);
	}
}