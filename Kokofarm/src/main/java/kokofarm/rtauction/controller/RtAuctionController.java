package kokofarm.rtauction.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kokofarm.member.domain.MemberVO;
import kokofarm.rtauction.domain.RtAuctionInfoVO;
import kokofarm.rtauction.service.RtAuctionService;

@Controller
@RequestMapping("/rt_auction/*")
public class RtAuctionController {
	
	@Inject
	private RtAuctionService service;
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public void testGet(Model model) throws Exception{
		
	}
	
	@RequestMapping(value="/rt_auction",method=RequestMethod.GET)
	public String rt_actionGet(HttpServletRequest request, Model model)throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		if(member == null){
			return "/member/login";
		}
		
		RtAuctionInfoVO vo = service.rtauction_info("RT_Auction_f87efe7c6ba44b67b7b41f638ab54ca1");
		System.out.println(vo.toString());
		String name = vo.getRt_auction_name();
		String down = vo.getRt_auction_down();
		String unit = vo.getRt_auction_unit();
		String img = vo.getRt_auction_title_img();
		
		
		model.addAttribute("member_id", member.getMember_id());
		model.addAttribute("name", name);
		model.addAttribute("down", down);
		model.addAttribute("unit", unit);
		model.addAttribute("img", img);
		
		return "redirect:http://192.168.0.172:8083";
		
	}
}
