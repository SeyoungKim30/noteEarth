package noteEarth.dao;

import java.util.List;

import noteEarth.vo.PageTemplates;

public interface R2000_myTempsDao {
	
	public List<PageTemplates> selectMyTemps(String email);
	public String selectTemplateHTML(String tempCode);

}
