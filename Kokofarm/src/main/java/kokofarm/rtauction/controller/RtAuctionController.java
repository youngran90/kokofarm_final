package kokofarm.rtauction.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kokofarm.member.domain.MemberVO;
import kokofarm.rtauction.domain.RtAcutionFinishVO;
import kokofarm.rtauction.domain.RtAuctionInfoVO;
import kokofarm.rtauction.domain.RtResultAuctionListVO;
import kokofarm.rtauction.domain.RtResultAuctionVO;
import kokofarm.rtauction.domain.Rt_Auction_Address;
import kokofarm.rtauction.domain.Rt_Auction_Homenum;
import kokofarm.rtauction.domain.Rt_Auction_Phonenum;
import kokofarm.rtauction.service.RtAuctionService;

@Controller
@RequestMapping("/rt_auction/*")
public class RtAuctionController {
	
	@Inject
	private RtAuctionService service;
	
	@RequestMapping(value="/rt_auction",method=RequestMethod.GET)
	public String rt_actionGet(//@RequestParam("rt_auction_no") String rt_auction_no,
			HttpServletRequest request, Model model)throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		
	
		if(member == null){
			return "/member/login";
		}
		
		
		RtAuctionInfoVO vo = service.rtauction_info("RT_Auction_bff703e9e7f449cead2ad6f1d52ed6e4");
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
		
		return "redirect://localhost:8083";
		//return "redirect:http://192.168.0.172:8083"; // 학원에서 할때 학원 서버
		//return "redirect:http://106.242.203.68:8083"; //집에서 할때 학원 서버
		//return "redirect:http://192.168.0.172:8083/"; // 학원에서 내껄로 접속할때
		
	}
	
	@RequestMapping(value="/result_rt_auction", method=RequestMethod.POST)
	public void result_rt_auction(@RequestParam("no")String no,	@RequestParam("id")String id,
			@RequestParam("price")int price, @RequestParam("date")String date, Model model) throws Exception{
		
		String tender_no = UUID.randomUUID().toString().replace("-", ""); //경매번호 생성
		String rt_tender_no = tender_no.substring(0, 5);

		String r_year= date.substring(0, 4);
		String r_month=date.substring(5, 7);
		String r_day = date.substring(8,10);
		String r_hour = date.substring(11,13);
		String r_minute = date.substring(14,16);
		String r_second = date.substring(17,19);
		
		String rt_result_no = r_year+r_month+r_day+r_hour+r_minute+r_second+rt_tender_no; 
		
		java.sql.Timestamp time = java.sql.Timestamp.valueOf(date); // String 날짜 형식 -> TimeStamp 형식으로 변환
		
		System.out.println(rt_result_no);
		
		RtResultAuctionVO vo = new RtResultAuctionVO();
		vo.setRt_tender_no(rt_result_no); // 낙찰번호
		vo.setRt_auction_no(no); // 경매 번호
		vo.setMember_id(id); // 경매 낙찰자 ID
		vo.setRt_tender_price(price); // 경매 낙찰가
		vo.setRt_tender_date(time); // 낙찰 시간
		
		System.out.println(vo.toString());
		
		service.rtresultauction(vo);
		
	}
	
	@RequestMapping(value="/rt_auctionpay", method=RequestMethod.GET)
	public String rt_auctionpayGet(/*@RequestParam("rt_acution_no") String rt_acution_no,*/ Model model,
			HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		RtResultAuctionListVO rt_result_actionListVO = service.resultList("RT_Auction_bff703e9e7f449cead2ad6f1d52ed6e4");
			
		MemberVO memberVO = service.member_info(member.getMember_id());
		
		String phoneNum = memberVO.getMember_phoneNum();
		
		String phone0 = phoneNum.substring(0,3);
		String phone1 = phoneNum.substring(3, 7);
		String phone2 = phoneNum.substring(7, 11);
		
		model.addAttribute("phone0", phone0);
		model.addAttribute("phone1", phone1);
		model.addAttribute("phone2", phone2);
		
		
		model.addAttribute("rt_result_actionListVO",rt_result_actionListVO);
		model.addAttribute("memberVO",memberVO);
		
		return "rt_auction/rt_auctionpay";
		
	}
	
	@RequestMapping(value="/rt_auctionfinish", method=RequestMethod.POST)
	public String rt_auction_finishPost(RtAcutionFinishVO vo, Rt_Auction_Address addr,
				Rt_Auction_Homenum home, Rt_Auction_Phonenum phone) throws Exception{
		
		String PhoneNum = phone.getMobileReceiver1() + phone.getMobileReceiver2() + phone.getMobileReceiver3(); //전화번호
		String HomeNum = home.getPhoneReceiver1() + home.getPhoneReceiver2() + home.getPhoneReceiver3(); //집번호
		String HomeAddr = addr.getRecipientpost() +" "+ addr.getAddress() +" "+ addr.getAddress_sub(); //집주소
		
		String rt_tender_finish_no = UUID.randomUUID().toString().replace("-", ""); // 실시간 경매 결제번호 생성
		
		vo.setRt_tender_finish_no(rt_tender_finish_no);
		vo.setRecipient_address(HomeAddr);
		vo.setRecipient_phone(PhoneNum);
		vo.setRecipient_tel(HomeNum);
		
		service.rt_auction_finish(vo);
		
		System.out.println(vo.toString());
		
		return "/rt_auction/rt_auctionfinish";
	}
}
