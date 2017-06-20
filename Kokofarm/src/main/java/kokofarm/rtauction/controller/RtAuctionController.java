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
		String name = vo.getRt_auction_name();
		int down = vo.getRt_auction_down();
		String unit = vo.getRt_auction_unit();
		String img = vo.getRt_auction_title_img();
		String img01 = vo.getRt_auction_title_img01();
		String img02 = vo.getRt_auction_title_img02();
		String content = vo.getRt_auction_content();
		String area = vo.getRt_auction_area();
		String seller_no = vo.getSeller_no();
		String rt_auction_no = vo.getRt_auction_no();
		
		model.addAttribute("member_id", member.getMember_id());
		model.addAttribute("name", name);
		model.addAttribute("down", down);
		model.addAttribute("unit", unit);
		model.addAttribute("img", img);
		model.addAttribute("img01", img01);
		model.addAttribute("img02", img02);
		model.addAttribute("content", content);
		model.addAttribute("area", area);
		model.addAttribute("seller_no", seller_no);
		model.addAttribute("rt_auction_no", rt_auction_no);
		
		//return "redirect://localhost:8083";
		//return "redirect:http://192.168.0.172:8083"; // 학원에서 할때 학원 서버
		//return "redirect:http://106.242.203.68:8083"; //집에서 할때 학원 서버
		return "redirect:http://192.168.0.172:8083"; // 학원에서 내껄로 접속할때
		
		
	}
}
