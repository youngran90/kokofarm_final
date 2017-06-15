package kokofarm.rtaction.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kokofarm.member.domain.MemberVO;

@Controller
@RequestMapping("/rt_action/*")
public class RtActionController {
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public void testGet(Model model) throws Exception{
		
	}
	
	@RequestMapping(value="/rt_action",method=RequestMethod.GET)
	public String rt_actionGet(HttpServletRequest request, Model model)throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		if(member == null){
			return "/member/login";
		}
		
		model.addAttribute("member_id", member.getMember_id());
		return "redirect:http://192.168.0.172:8083";
		
	}
}
