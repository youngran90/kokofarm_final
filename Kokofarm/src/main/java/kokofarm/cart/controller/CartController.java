package kokofarm.cart.controller;

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

import kokofarm.cart.service.CartService;
import kokofarm.orderproduct.domain.OrderProductData;
import kokofarm.orderproduct.service.OrderProductService;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Inject
	private CartService service;
	
	@Inject
	private OrderProductService op_service;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public void cartGet(Model model) throws Exception{
		logger.info("장바구니 리스트");
		
		model.addAttribute("listcart",service.cart_list("123123"));
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteGet(@RequestParam("product_no") String product_no) throws Exception{
		service.cart_delete(product_no);
		return "redirect:/cart/cart";
	}
	
	@RequestMapping(value="/deleteall" ,method=RequestMethod.GET)
	public String deleteallGET(@RequestParam("data[]") String[] product_no) throws Exception{
		HashMap<String, String> map = new HashMap<String,String>();
		
		for(int i=0; i<product_no.length; i++){
			map.put("product_no", product_no[i]);
			service.cart_delte_all(map);
		}
		
		return "redirect:/cart/cart";
	}
	
	@RequestMapping(value="/orderproduct", method=RequestMethod.POST)
	public String orderproductPost(@RequestParam("product_no") String[] product_no,
			@RequestParam("order_product_amount") String[] order_product_amount,
			@RequestParam("order_delivery_price") String[] order_delivery_price,
			@RequestParam("order_total_price") String[] order_total_price, Model model ) throws Exception{
		
		OrderProductData data = new OrderProductData();
		
		for(int i=0; i<product_no.length; i++){
			data.setMember_id("123123");
			data.setProduct_no(product_no[i]);
			data.setOrder_product_amount(order_product_amount[i]);
			data.setOrder_delivery_price(order_delivery_price[i]);
			data.setOrder_total_price(order_total_price[i]);
			
			op_service.order_insert(data);
		}

		
		return "redirect:/orderproduct/orderproduct";
	}
	

}
