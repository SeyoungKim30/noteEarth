package noteEarth.vo;


public class Member {
private String memberno;
private String email;
private String name;
private String rrn;
private String password;
private String kakaoemail;
private String googleemail;
private String snsemail;
public Member() {
}



public Member(String memberno, String email, String name, String rrn, String password, String kakaoemail,
		String googleemail, String snsemail) {
	this.memberno = memberno;
	this.email = email;
	this.name = name;
	this.rrn = rrn;
	this.password = password;
	this.kakaoemail = kakaoemail;
	this.googleemail = googleemail;
	this.snsemail = snsemail;
}



public Member(String memberno, String email, String name, String rrn, String password, String kakaoemail,
		String googleemail) {
	this.memberno = memberno;
	this.email = email;
	this.name = name;
	this.rrn = rrn;
	this.password = password;
	this.kakaoemail = kakaoemail;
	this.googleemail = googleemail;
}



public Member(String memberno, String email, String name, String rrn, String password) {
	this.memberno = memberno;
	this.email = email;
	this.name = name;
	this.rrn = rrn;
	this.password = password;
}



public Member(String email, String name, String rrn, String password) {
	this.email = email;
	this.name = name;
	this.rrn = rrn;
	this.password = password;
}
public Member(String name, String rrn) {
	this.name = name;
	this.rrn = rrn;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getRrn() {
	return rrn;
}
public void setRrn(String rrn) {
	this.rrn = rrn;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

public String getMemberno() {
	return memberno;
}

public void setMemberno(String memberno) {
	this.memberno = memberno;
}

public String getKakaoemail() {
	return kakaoemail;
}

public void setKakaoemail(String kakaoemail) {
	this.kakaoemail = kakaoemail;
}

public String getGoogleemail() {
	return googleemail;
}

public void setGoogleemail(String googleemail) {
	this.googleemail = googleemail;
}


//sns로그인 확인용
public String getSnsemail() {
	return snsemail;
}
public void setSnsemail(String snsemail) {
	this.snsemail = snsemail;
}



}
