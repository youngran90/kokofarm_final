package kokofarm.member.controller;



import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;


import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kokofarm.member.domain.LoginDTO;
import kokofarm.member.domain.MemberVO;
import kokofarm.member.domain.LicenseVO;
import kokofarm.member.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	private MemberService service;
	
	
	
	@RequestMapping("/join1")
	public void join1(Model model) throws Exception{
		
	}
	
	@RequestMapping("/join1_1")
	public void join1_1(Model model) throws Exception{
		
	}
	
	@RequestMapping(value= "/join", method = RequestMethod.GET)
	public void join(Model model) throws Exception{
		model.addAttribute("MemberCommand", new MemberVO());
		
			
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute("MemberCommand") MemberVO vo,BindingResult errors) throws Exception{
	System.out.println("널이 되나 안되나:" +vo.getBizNum());
		
		service.joinMember(vo);
		return "redirect:/";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto){
		
	}
	
	@RequestMapping(value="/loginPost", method= RequestMethod.POST)
	public String loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception{
		MemberVO vo = service.login(dto);
		
	
		
		if(vo == null){
			return "member/login";
		}
			
		model.addAttribute("memberVO", vo);
		return "member/loginPost";
	}
	
	@RequestMapping(value="/id_check", method = RequestMethod.GET)
	public void id_check(@RequestParam("userid")String userid ,Model model) throws Exception{
		model.addAttribute("userid",userid);
		System.out.println("userid : "+ userid);
			
	}
	
@RequestMapping(value="/id_check",method = RequestMethod.POST)
	public void id_check(HttpServletRequest request, HttpServletResponse
			response, @RequestParam("userid") String userid) throws Exception{
			
	System.out.println("입력한아이디:"+userid);
		int re = service.id_checkService(userid);
		
		response.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=utf-8");
	       PrintWriter out = response.getWriter();

	       if(re==1){out.println("0"); //아이디 중복
	       	
		
	}else{
		out.println("1"); //아이디 생성가능
	}
	out.close();
	
}

	@RequestMapping("/logout")
	public void logout(){
		
	}

	
	@RequestMapping("/join0")
	public void join0(){
				
	}
	
	@RequestMapping(value= "/join_li", method = RequestMethod.GET)
	public void join_li(Model model) throws Exception{
		model.addAttribute("MemberCommand", new MemberVO());
		
			
	}

	@RequestMapping(value = "/join_li", method = RequestMethod.POST)
	public String join_li(@ModelAttribute("MemberCommand") MemberVO vo,BindingResult errors) throws Exception{
				
		service.joinMember(vo);
		return "redirect:/";
	}
	
	
	
}

