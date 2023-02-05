package noteEarth.vo;

public class PageTemplates {

	private String tempCode;
	private String tempTitle;
	private int price;
	private String category;
	private int sales;
	private String thumbnail;
	private String templateHTML;
	public PageTemplates() {
		// TODO Auto-generated constructor stub
	}
	public PageTemplates(String tempCode, String tempTitle, int price, String category, int sales, String thumbnail,
			String templateHTML) {
		this.tempCode = tempCode;
		this.tempTitle = tempTitle;
		this.price = price;
		this.category = category;
		this.sales = sales;
		this.thumbnail = thumbnail;
		this.templateHTML = templateHTML;
	}
	
	public String getTempCode() {
		return tempCode;
	}
	public void setTempCode(String tempCode) {
		this.tempCode = tempCode;
	}
	public String getTempTitle() {
		return tempTitle;
	}
	public void setTempTitle(String tempTitle) {
		this.tempTitle = tempTitle;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getTemplateHTML() {
		return templateHTML;
	}
	public void setTemplateHTML(String templateHTML) {
		this.templateHTML = templateHTML;
	}
	
	
	
}
