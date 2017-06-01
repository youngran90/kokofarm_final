package kokofarm.auction.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kokofarm.auction.domain.AuctionRegisterVO;
import kokofarm.auction.service.AuctionService;

@Controller
@RequestMapping("/auction/*")
public class AuctionController {
	private static final Logger logger = LoggerFactory.getLogger(AuctionController.class);
	
	@Inject
	private AuctionService service;
	
	@RequestMapping(value="/auction_register", method=RequestMethod.GET)
	public void auctionRegisterGET(AuctionRegisterVO auction, Model model)throws Exception{
		logger.info("auction_register_get");
	}
	
}
