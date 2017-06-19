package kokofarm.orderproduct.controller;

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

import kokofarm.cart.controller.CartController;
import kokofarm.member.domain.MemberVO;
import kokofarm.orderproduct.domain.MileageListVO;
import kokofarm.orderproduct.domain.MileageVO;
import kokofarm.orderproduct.domain.OrderFinishVO;
import kokofarm.orderproduct.domain.OrderFinish_Member_Address;
import kokofarm.orderproduct.domain.OrderFinish_Member_Homenum;
import kokofarm.orderproduct.domain.OrderFinish_Member_Phonenum;
import kokofarm.orderproduct.domain.OrderFinish_Payment_Info;
import kokofarm.orderproduct.domain.OrderFinish_Product_Info;
import kokofarm.orderproduct.service.MileageService;
import kokofarm.orderproduct.service.OrderProductService;

@Controller
@RequestMapping("/orderproduct/*")
public class OrderProductController {
	
	@Inject
	private OrderProductService service;
	
	@Inject
	private MileageService m_service;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	private static final String orderfinish_no = UUID.randomUUID().toString().replace("-", "");
	
	@RequestMapping(value="/orderproduct", method=RequestMethod.GET)
	public String orderproductGet(Model model, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		if(member == null){
			return "/home";
		}
		
			MemberVO memberVO = service.member_info(member.getMember_id());
			
			String phoneNum = memberVO.getMember_phoneNum();
			
			String phone0 = phoneNum.substring(0,3);
			String phone1 = phoneNum.substring(3, 7);
			String phone2 = phoneNum.substring(7, 11);
			
			model.addAttribute("phone0", phone0);
			model.addAttribute("phone1", phone1);
			model.addAttribute("phone2", phone2);
			
			model.addAttribute("memberVO", memberVO);
			model.addAttribute("order_list", service.order_list(member.getMember_id()));
			
			return "/orderproduct/orderproduct";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String deleteGet(@RequestParam("product_no") String product_no) throws Exception{
		service.delete(product_no);
		return "redirect:/orderproduct/orderproduct";
	}
	
	
	@RequestMapping(value="/orderproduct", method=RequestMethod.POST)
	public void orderproductPost(OrderFinishVO vo, OrderFinish_Member_Address addr,
			OrderFinish_Member_Homenum home, OrderFinish_Member_Phonenum phone, 
			OrderFinish_Product_Info product_info, Model model,	HttpServletRequest request ) throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		String PhoneNum = phone.getMobileReceiver1() + phone.getMobileReceiver2() + phone.getMobileReceiver3();
		String HomeNum = home.getPhoneReceiver1() + home.getPhoneReceiver2() + home.getPhoneReceiver3();
		String HomeAddr = addr.getRecipientpost() + addr.getAddress() + addr.getAddress_sub();
		for(int i=0; i<product_info.getProduct_no().length; i++){
			vo.setOrderfinish_no(orderfinish_no);
			
			vo.setOrderfinish_product_no(product_info.getProduct_no()[i]);
			vo.setOrderfinish_product_name(product_info.getOrderfinish_product_name()[i]);
			vo.setOrderfinish_product_amount(Integer.parseInt(product_info.getOrder_product_amount()[i]));
			vo.setOrderfinish_product_price(Integer.parseInt(product_info.getOrderfinish_product_price()[i]));
			vo.setOrderfinish_delivery_price(Integer.parseInt(product_info.getOrder_delivery_price()[i]));
			vo.setOrderfinish_total_price(Integer.parseInt(product_info.getOrder_total_price()[i]));
			
			vo.setOrderfinish_member_id(member.getMember_id());
			vo.setOrderfinish_member_phonenum(PhoneNum);
			vo.setOrderfinish_member_homenum(HomeNum);
			vo.setOrderfinish_member_address(HomeAddr);
			
			service.orderfinish_insert(vo);
			
			service.product_update(Integer.parseInt(product_info.getOrder_product_amount()[i]), product_info.getProduct_no()[i]);
			
		}
		
		
	}
	
	@RequestMapping(value="/payment", method=RequestMethod.POST)
	public void orderproductPost(OrderFinish_Payment_Info payment_info,HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		String payment_no = UUID.randomUUID().toString().replace("-", "");
		
		if(payment_info.getPay().equals("creditcard")){
			payment_info.setPay_bank("none");
			payment_info.setDeposit_name("none");
		}else if(payment_info.getPay().equals("kakaopay")){
			payment_info.setCreditcard_name("none");
			payment_info.setPay_month("none");
			payment_info.setPay_bank("none"); 
			payment_info.setDeposit_name("none");
		}else if(payment_info.getPay().equals("naverpay")){
			payment_info.setCreditcard_name("none");
			payment_info.setPay_month("none");
			payment_info.setPay_bank("none");
			payment_info.setDeposit_name("none");
		}else if(payment_info.getPay().equals("accounttransfer")){
			payment_info.setCreditcard_name("none");
			payment_info.setPay_month("none");
		}
		
		payment_info.setOrderfinish_no(orderfinish_no);
		payment_info.setPayment_no(payment_no);
		payment_info.setMember_id(member.getMember_id());
		service.payment_insert(payment_info);
		
		
	}
	
	@RequestMapping(value="/mileage", method=RequestMethod.POST)
	public void mileagePost(MileageVO vo, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		String mileage_no = UUID.randomUUID().toString().replace("-", "");
		
		vo.setOrderfinish_no(orderfinish_no);
		vo.setMember_id(member.getMember_id());
		vo.setMileage_no(mileage_no);
		
		m_service.insert_mileage(vo);
		
	}
	
	@RequestMapping(value="/orderfinish", method=RequestMethod.GET)
	public String orderfinishGET(Model model, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		List<String> list = service.orderfinish_no(orderfinish_no);
		
		for(int i=0; i<list.size(); i++){
			System.out.println(list.get(i));
			if(list.get(i).equals(orderfinish_no)){
				return "orderproduct/orderfinish";	
			}
		}
		if(member == null){
			return "/home";
		}
		
		return "/home";
	}
	
	@RequestMapping(value="/mileage_view", method=RequestMethod.GET)
	public String mileage_viewGET(Model model, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		List<MileageListVO> list = m_service.mileage_view(member.getMember_id());
		model.addAttribute("list", list);
		model.addAttribute("current", m_service.mileage_current(member.getMember_id()));
		return "mypage/mileage_view";
	}
	
} 
