package kokofarm.cart.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kokofarm.cart.domain.CartVO;
import kokofarm.cart.service.CartService;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	/*@Inject
	private CartService service;*/
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public void cartGet(CartVO vo, Model model) throws Exception{
		logger.info("왜 안넘어가");
	}

	@RequestMapping(value="/test", method=RequestMethod.GET)
	public void testGet(Model model) throws Exception{
	}
	

}
