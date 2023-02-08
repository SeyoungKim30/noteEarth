package noteEarth.dao;

import java.util.List;

import noteEarth.vo.Notes;
import noteEarth.vo.Pages;

public interface R4000_notesDao {
	
	public String createNotesSeq();
	public void insertNotes(Notes newNote);
	public void updateNotes(Notes notes);
	
	public String createPagesSeq();
	public void insertPages(Pages pages);
	
	public List<Notes> selectNotes(Notes notes);
	public Pages selectPages(Pages pages);
	
	public void updatePageMainHTML(Pages pages);
	
	public void deleteNotes(Notes notes);
	public void deletePages(Pages pages);
	
	public void add1intoPageIndexAfterThisPage(Pages pages);
	public void reduce1intoPageIndexAfterdeletedPage(Pages pages);
}
