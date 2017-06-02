package kokofarm.member.controller;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


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
		
		service.joinMember(vo);
		return "redirect:/home";
	}
	
	

}


