package noteEarth.vo;

public class Mytemplates {
	private String email;
	private String tempCode;
	public Mytemplates() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Mytemplates(String email, String tempCode) {
		super();
		this.email = email;
		this.tempCode = tempCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTempCode() {
		return tempCode;
	}

	public void setTempCode(String tempCode) {
		this.tempCode = tempCode;
	}

	
}