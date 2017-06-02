package kokofarm.auction.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kokofarm.auction.domain.AuctionRegisterVO;
import kokofarm.auction.domain.RT_AuctionRegisterVO;
import kokofarm.auction.service.AuctionService;

@Controller
@RequestMapping("/auction/*")
public class AuctionController {
	private static final Logger logger = LoggerFactory.getLogger(AuctionController.class);
	
	@Inject
	private AuctionService service;
	
	@RequestMapping(value="/auction_register", method=RequestMethod.GET)
	public void auctionRegisterGET(AuctionRegisterVO auction, Model model)throws Exception{
		logger.info("일반 경매 등록폼_get");
	}
	
	@RequestMapping(value="/auction_register", method=RequestMethod.POST)
	public String auctionRegsterPOST(AuctionRegisterVO auction, Model model)throws Exception{
		logger.info(auction.toString());
		service.regist(auction);
		
		model.addAttribute("result", "SUCCESS");
	
		return "redirect:/auction/auction_list";
	}
	
	
	@RequestMapping(value="/auction_list", method=RequestMethod.GET)
	public void auctionListGET(AuctionRegisterVO auction, Model model)throws Exception{
		model.addAttribute("list", service.list());
		logger.info("일반 경매 리스트_get");
	}
	
	@RequestMapping(value="/auction_detail", method=RequestMethod.GET)
	public void detail(@RequestParam(value="auction_no") int auction_no, Model model)throws Exception{
		model.addAttribute(service.detail(auction_no));
		System.out.println(auction_no);
	}
	
	/*@RequestMapping(value="/tender")*/
	@RequestMapping(value="/RT_auction_register", method=RequestMethod.GET)
	public void RT_auctionRegisterGET(RT_AuctionRegisterVO auction_rt, Model model)throws Exception{
		logger.info("실시간 경매 등록폼_get");
	}
	

}
