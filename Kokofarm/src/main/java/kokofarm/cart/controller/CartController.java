package kokofarm.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kokofarm.cart.domain.CartVO;
import kokofarm.cart.service.CartService;
import kokofarm.member.domain.MemberVO;
import kokofarm.orderproduct.domain.OrderProductListVO;
import kokofarm.orderproduct.domain.OrderProductVO;
import kokofarm.orderproduct.service.OrderProductService;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Inject
	private CartService service;
	
	@Inject
	private OrderProductService op_service;
	
	
	private static String cart_no = UUID.randomUUID().toString().replace("-", "");
	
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public String cartGet(Model model, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		if(member == null){
			return "/cart/cart";
		}
		
		model.addAttribute("listcart",service.cart_list(member.getMember_id()));
		
		return "/cart/cart";
	}
	
	@RequestMapping(value="/cart_detail", method=RequestMethod.GET)
	public String cart_detailkGet(@RequestParam("num") String product_unit,
			@RequestParam("product_no") String product_no,
			Model model, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");

		if(member == null){
			return "/cart/cart";
		}
		
		CartVO vo = new CartVO();
		vo.setCart_no(cart_no);
		vo.setMember_id(member.getMember_id());
		vo.setProduct_no(product_no);
		vo.setProduct_unit(product_unit);
		service.cart_insert(vo);
		
		model.addAttribute("listcart",service.cart_list(member.getMember_id()));
		return "redirect:/cart/cart";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteGet(@RequestParam("product_no") String product_no,HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");

		List<OrderProductListVO> list = op_service.order_list(member.getMember_id());
		
		for(int i=0; i<list.size(); i++){
			if(list.get(i).getProduct_no().equals(product_no)){
				op_service.delete(product_no);
				service.cart_delete(product_no);
			}
		}
		service.cart_delete(product_no);
		return "redirect:/cart/cart";
	}
	
	
	@RequestMapping(value="/deleteall" ,method=RequestMethod.GET)
	public String deleteallGET(@RequestParam("data[]") String[] product_no) throws Exception{
		HashMap<String, String> map = new HashMap<String,String>();
		
		for(int i=0; i<product_no.length; i++){
			map.put("product_no", product_no[i]);
			op_service.orderproduct_delete_all(map);
			service.cart_delete_all(map);
		}
		
		return "redirect:/cart/cart";
	}
	
	
	
	@RequestMapping(value="/orderproduct", method=RequestMethod.POST)
	public String orderproductPost(@RequestParam("product_no") String[] product_no,
			@RequestParam("order_product_amount") String[] order_product_amount,
			@RequestParam("order_delivery_price") String[] order_delivery_price,
			@RequestParam("order_total_price") String[] order_total_price, 
			@RequestParam("order_product_name") String[] order_product_name,
			@RequestParam("order_product_price") String[] order_product_price,
			Model model, HttpServletRequest request ) throws Exception{
		
		String order_no = UUID.randomUUID().toString().replace("-", "");
		
		OrderProductVO data = new OrderProductVO();
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		for(int i=0; i<product_no.length; i++){
			data.setOrder_no(order_no);
			data.setMember_id(member.getMember_id());
			data.setProduct_no(product_no[i]);
			data.setOrder_product_amount(order_product_amount[i]);
			data.setOrder_delivery_price(order_delivery_price[i]);
			data.setOrder_total_price(order_total_price[i]);
			data.setOrder_product_name(order_product_name[i]);
			data.setOrder_product_price(order_product_price[i]);
			op_service.order_insert(data);
		}
		
		return "redirect:/orderproduct/orderproduct";
	}
	
	
	
	

}
