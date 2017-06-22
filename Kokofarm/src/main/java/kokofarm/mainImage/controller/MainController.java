package kokofarm.mainImage.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kokofarm.auction.domain.AuctionRegisterVO;
import kokofarm.mainImage.domain.AuctionListDTO;
import kokofarm.mainImage.service.MainImageService;
import kokofarm.product.domain.ProductVO;

@Controller
public class MainController {

	@Inject
	private MainImageService service;
	
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String main(Model model) throws Exception{
		
		
		List<ProductVO> productLatestList = service.productLatest();
		List<AuctionListDTO> auctionPLatestList = service.auctionPLatest();
		List<ProductVO> TbestList = service.bestSellerItems();
		
		
		model.addAttribute("Latestlist",productLatestList);
		model.addAttribute("auctionList",auctionPLatestList);
		model.addAttribute("bestList", TbestList);
						
		return "home";
	}

	
	
}
