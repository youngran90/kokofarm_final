package kokofarm.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kokofarm.member.domain.LoginDTO;
import kokofarm.member.domain.MemberVO;
import kokofarm.member.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	private MemberService service;
	
	@RequestMapping(value= "/join", method = RequestMethod.GET)
	public void join(Model model) throws Exception{
		model.addAttribute("MemberCommand", new MemberVO());
		
			
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute("MemberCommand") @Valid MemberVO vo, BindingResult errors) throws Exception{
		
		if(errors.hasErrors()){
			System.out.println("에러발생");
			return "member/join";
		}
		
		System.out.println(vo.toString());
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
			
		model.addAttribute("MemberVO", vo);
		return "member/loginPost";
	}
}


