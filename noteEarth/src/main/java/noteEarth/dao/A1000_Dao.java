package noteEarth.dao;

import java.util.List;

import noteEarth.vo.Member;


public interface A1000_Dao {
	public Member NE_CheckMem(Member sch); //이름,주민 중복검사
	public Member NE_CheckEmail(Member sch); //이메일 중복검사
	public Member NE_CheckKEmail(Member sch); //이메일 중복검사
	public int NE_SignUp(Member ins);
	public Member NE_Login(Member log);
	public Member NE_LoginE(Member log);
	public void NE_SnsEmailPlus(Member upt);
	public int NE_UpdateInfo(Member upt);
	public int NE_LinkSns(Member upt);
}

