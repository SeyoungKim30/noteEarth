package noteEarth.vo;

public class Pages {

	private String pageCode;
	private String noteCode;
	private String tempCode;
	private String mainHTML;
	private int pageIndex;
	
	public Pages() {
		super();
	}
	
	public Pages(String pageCode, String noteCode, String tempCode, String mainHTML, int pageIndex) {
		super();
		this.pageCode = pageCode;
		this.noteCode = noteCode;
		this.tempCode = tempCode;
		this.mainHTML = mainHTML;
		this.pageIndex = pageIndex;
	}

	public String getPageCode() {
		return pageCode;
	}
	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}
	public String getNoteCode() {
		return noteCode;
	}
	public void setNoteCode(String noteCode) {
		this.noteCode = noteCode;
	}
	public String getTempCode() {
		return tempCode;
	}
	public void setTempCode(String tempCode) {
		this.tempCode = tempCode;
	}
	public String getMainHTML() {
		return mainHTML;
	}
	public void setMainHTML(String mainHTML) {
		this.mainHTML = mainHTML;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	
	
	
}
