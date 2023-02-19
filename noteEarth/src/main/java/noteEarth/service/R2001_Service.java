package noteEarth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import noteEarth.dao.R2001_shopTemp;
import noteEarth.vo.Mytemplates;
import noteEarth.vo.PageTemplates;

@Service
public class R2001_Service {
	@Autowired
	private R2001_shopTemp dao;
	
	// 마켓에서 템플릿을 볼수있는 기능
	
	public List<PageTemplates> getPageTempList(PageTemplates sch){
		if(sch.getTempTitle()==null) sch.setTempTitle("");
		return dao.getPageTempList(sch);
	}
	
	// 마켓에서 템플릿 클릭시 템플릿 상세
	public PageTemplates getTemplate(String tempCode) {
		return dao.getTemplate(tempCode);
	}
	// 템플릿 구매하기
	public void insertTemp(Mytemplates ins) {
		dao.insertTemp(ins);
	}
	public void uptBuyCnt(String tempCode) {
		dao.uptBuyCnt(tempCode);
	}
}