package kokofarm.orderproduct.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kokofarm.cart.controller.CartController;
import kokofarm.orderproduct.domain.OrderProductData;
import kokofarm.orderproduct.service.OrderProductService;

@Controller
@RequestMapping("/orderproduct/*")
public class OrderProductController {
	
	@Inject
	private OrderProductService service;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@RequestMapping(value="/orderproduct", method=RequestMethod.GET)
	public void orderproductGet(Model model) throws Exception{
		model.addAttribute("order_list",service.order_list("123123"));
	}
	
	/*@RequestMapping(value="/orderproduct", method=RequestMethod.POST)
	public String orderproductPost(@RequestBody OrderProductData vo) throws Exception{
			System.out.println(vo.toString());
		return null;
	}*/
	
	
	
	
}
