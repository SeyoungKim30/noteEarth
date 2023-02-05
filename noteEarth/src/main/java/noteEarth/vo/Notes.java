package noteEarth.vo;

public class Notes {
	private String noteCode;
	private String email;
	private String noteTitle;
	private int totalPageCount;
	
	public Notes() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notes(String noteCode, String email, String noteTitle) {
		super();
		this.noteCode = noteCode;
		this.email = email;
		this.noteTitle = noteTitle;
	}
	
	public Notes(String noteCode, String email, String noteTitle, int totalPageCount) {
		super();
		this.noteCode = noteCode;
		this.email = email;
		this.noteTitle = noteTitle;
		this.totalPageCount = totalPageCount;
	}
	public String getNoteCode() {
		return noteCode;
	}
	public void setNoteCode(String noteCode) {
		this.noteCode = noteCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNoteTitle() {
		return noteTitle;
	}
	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	
	
}
