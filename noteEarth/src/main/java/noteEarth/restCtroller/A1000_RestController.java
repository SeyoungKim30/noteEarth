package noteEarth.restCtroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import noteEarth.service.A1000_Service;
import noteEarth.vo.Member;


//import org.springframework.stereotype.Controller;

@RestController("NE_RestController1")
public class A1000_RestController {

	@Autowired(required=false)
	private A1000_Service service;
	
	@RequestMapping(value="NE_CheckMem.do", produces="text/plain;charset=UTF-8")
	public String NE_CheckMem(Member sch) {
		Gson g = new Gson();
		System.out.println(g.toJson(service.NE_CheckMem(sch)));
		return g.toJson(service.NE_CheckMem(sch));
	}
	//일반회원가입시, 이메일 중복여부
	@RequestMapping(value="NE_CheckEmail.do", produces="text/plain;charset=UTF-8")
	public String NE_CheckEmail(Member sch) {
		Gson g = new Gson();
		return g.toJson(service.NE_CheckEmail(sch));
	}
	//카카오 로그인시도시, 이메일 중복여부
	@RequestMapping(value="NE_CheckKEmail.do", produces="text/plain;charset=UTF-8")
	public String NE_CheckKEmail(Member sch) {
		Gson g = new Gson();
		return g.toJson(service.NE_CheckKEmail(sch));
	}
	
}
