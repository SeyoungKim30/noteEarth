package noteEarth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import noteEarth.dao.R2000_myTempsDao;
import noteEarth.vo.PageTemplates;

@Service
public class R2000_Service {

	@Autowired(required = false )
	R2000_myTempsDao dao;
	
	public List<PageTemplates> selectMyTemps(String email){
		
		return dao.selectMyTemps(email);
	};
	
	public String selectTemplateHTML(String tempCode) {
		return dao.selectTemplateHTML(tempCode);
	}
}
