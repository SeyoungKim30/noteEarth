package noteEarth.dao;

import java.util.List;

import noteEarth.vo.Mytemplates;
import noteEarth.vo.PageTemplates;

public interface R2001_shopTemp {
	public List<PageTemplates> getPageTempList(PageTemplates sch);
	// 마켓에서 템플릿을 볼수있는 기능
	
	public PageTemplates getTemplate(String tempCode);
	// 마켓에서 템플릿 클릭시 템플릿 상세

	public void insertTemp(Mytemplates ins);
	// 템플릿 구매하기
	
	public void uptBuyCnt(String tempCode);
	// 구매량
}