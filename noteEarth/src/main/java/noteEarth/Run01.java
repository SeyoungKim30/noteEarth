package noteEarth;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import noteEarth.dao.R2000_myTempsDao;
import noteEarth.dao.R4000_notesDao;
import noteEarth.vo.PageTemplates;
import noteEarth.vo.Pages;


public class Run01 {

	public static void main(String[] args) {
		String path = "noteEarth\\run01.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		R4000_notesDao obj = ctx.getBean("r4000_notesDao", R4000_notesDao.class);
		System.out.println(obj.createNotesSeq());
	
		R2000_myTempsDao dao = ctx.getBean("r2000_myTempsDao", R2000_myTempsDao.class);
		List<PageTemplates> ptlist = dao.selectMyTemps("jeju@email.com");
		for(PageTemplates each : ptlist) {
			System.out.println(each.getTempCode());
		}
		
		Pages delpages = new Pages();
		delpages.setNoteCode("202302012326351029");
		delpages.setPageIndex(4);
		obj.reduce1intoPageIndexAfterdeletedPage(delpages);
		
	}

}
