package noteEarth.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import noteEarth.service.A1000_Service;
import noteEarth.vo.Member;




@Controller("NE_Controller1")
public class R1000_Controller {

	@Autowired(required=false)
	private A1000_Service service;
	
	
	
	
	@RequestMapping("NE_SignIn.do") // 로그인 페이지
	public String NE_SignIn(){
		return "WEB-INF\\Req1000\\SignIn.jsp";
	}
	
	@PostMapping("NE_SignUp.do") // 회원가입 진행 후, 로그인화면 ㄱㄱ
	public String NE_SignUp(Member ins,Model d) {
		d.addAttribute("CheckSignUp",service.NE_SignUp(ins));
		return "WEB-INF\\Req1000\\SignIn.jsp";
	}
	
	@RequestMapping("NE_Login.do") //로그인ㄱㄱ
	public String NE_Login(Member log,Model d,
						HttpServletRequest request) {
		HttpSession session =request.getSession();
		Member mem;
		//NE_KakaoEmailPlus.do(로그인화면에서 연동처리)으로 받은 데이터가 있다면
		if(d.asMap().get("NE_SnsEmailPlus")!=null) {
		//해당 데이터로 할당해서 바로 연동+로그인
			mem = (Member)d.asMap().get("NE_SnsEmailPlus");
			session.setAttribute("Login",service.NE_Login(mem));
			 return "WEB-INF\\Req1000\\Main.jsp";
		// 그냥 데이터받을경우 일반로그인
		}else{
			System.out.println("Sndd"+log.getSnsemail());
			if(service.NE_Login(log)!=null) { 
				 session.setAttribute("Login", service.NE_Login(log));
				 return "WEB-INF\\Req1000\\Main.jsp";
			//일치하는놈이없으면
			}else{
				d.addAttribute("CheckLogin","일지하는 회원이 없습니다.");
				return "WEB-INF\\Req1000\\SignIn.jsp";
			}	
		}		
	}
	
	@RequestMapping("NE_SnsEmailPluss.do")//기존계정에 연동계정 업데이트
	public String NE_SnsEmailPlus(Member upt,
									RedirectAttributes redirectAttributes) {
		service.NE_SnsEmailPlus(upt);
		redirectAttributes.addFlashAttribute("NE_SnsEmailPlus",upt);
		return "redirect:NE_Login.do";	
	}
	
	@GetMapping("NE_Logout.do") //로그아웃 ㄱㄱ
	public String NE_Logout(HttpServletRequest request) {
		HttpSession session =request.getSession();
		session.removeAttribute("Login");
		return "WEB-INF\\Req1000\\SignIn.jsp";
	}
	
	
	 @PostMapping("NE_UpdateInfo.do")
	 public String NE_UpdateInfo(Member upt,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		 System.out.println("C:"+upt.getEmail());
		int SucUptInfo= service.NE_UpdateInfo(upt);
		
		if(SucUptInfo==1) {
			HttpSession session =request.getSession();
			session.removeAttribute("Login");
			redirectAttributes.addFlashAttribute("NE_SnsEmailPlus",upt);
			return "redirect:NE_Login.do";
		}
		else {
		 return "WEB-INF\\Req1000\\Main.jsp";}
	 }
	 
	
}
