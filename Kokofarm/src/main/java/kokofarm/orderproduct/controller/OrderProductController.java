package kokofarm.orderproduct.controller;

import java.text.SimpleDateFormat;
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
import kokofarm.cart.service.CartService;
import kokofarm.member.domain.MemberVO;
import kokofarm.orderproduct.domain.MileageListVO;
import kokofarm.orderproduct.domain.MileageVO;
import kokofarm.orderproduct.domain.OrderFinishVO;
import kokofarm.orderproduct.domain.OrderFinish_DetailVO;
import kokofarm.orderproduct.domain.OrderFinish_Member_Address;
import kokofarm.orderproduct.domain.OrderFinish_Member_Homenum;
import kokofarm.orderproduct.domain.OrderFinish_Member_Phonenum;
import kokofarm.orderproduct.domain.OrderFinish_Payment_Info;
import kokofarm.orderproduct.domain.OrderFinish_Product_Info;
import kokofarm.orderproduct.service.MileageService;
import kokofarm.orderproduct.service.OrderProductService;
import kokofarm.product.domain.PagingMaker;

@Controller
@RequestMapping("/orderproduct/*")
public class OrderProductController {
	
	@Inject
	private OrderProductService service;
	
	@Inject
	private MileageService m_service;
	
	@Inject
	private CartService c_service;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
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
		c_service.cart_delete(product_no);
		return "redirect:/orderproduct/orderproduct";
	}
	
	
	
	@RequestMapping(value="/orderproduct", method=RequestMethod.POST)
	public String orderproductPost(OrderFinishVO vo, OrderFinish_Member_Address addr,
			OrderFinish_Member_Homenum home, OrderFinish_Member_Phonenum phone, 
			OrderFinish_Product_Info product_info, Model model,	HttpServletRequest request,
			OrderFinish_Payment_Info payment_info, MileageVO vo1) throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		String PhoneNum = phone.getMobileReceiver1() + phone.getMobileReceiver2() + phone.getMobileReceiver3();
		String HomeNum = home.getPhoneReceiver1() + home.getPhoneReceiver2() + home.getPhoneReceiver3();
		String HomeAddr = addr.getRecipientpost() + addr.getAddress() + addr.getAddress_sub();
		
		String orderfinish_no = UUID.randomUUID().toString().replace("-", "");
		String payment_no = UUID.randomUUID().toString().replace("-", "");
		String mileage_no = UUID.randomUUID().toString().replace("-", "");
		
		for(int i=0; i<product_info.getProduct_no().length; i++){
			vo.setOrderfinish_no(orderfinish_no);
			vo.setMileage_no(mileage_no);
			vo.setPayment_no(payment_no);
			
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
		
		
		//결제 방법 
		if(payment_info.getPay().equals("신용카드")){
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
		}else if(payment_info.getPay().equals("무통장입금")){
			payment_info.setCreditcard_name("none");
			payment_info.setPay_month("none");
		}
		
		//payment_info.setOrderfinish_no(orderfinish_no);
		payment_info.setPayment_no(payment_no);
		service.payment_insert(payment_info);
		
		
		//마일리지
		vo1.setOrderfinish_no(orderfinish_no);
		vo1.setMember_id(member.getMember_id());
		vo1.setMileage_no(mileage_no);
		
		m_service.insert_mileage(vo1);
		
		return "orderproduct/orderfinish";	
	}
	
	/*@RequestMapping(value="/payment", method=RequestMethod.POST)
	public void orderproductPost(OrderFinish_Payment_Info payment_info,HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		String payment_no = UUID.randomUUID().toString().replace("-", "");
		
		if(payment_info.getPay().equals("신용카드")){
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
		}else if(payment_info.getPay().equals("무통장입금")){
			payment_info.setCreditcard_name("none");
			payment_info.setPay_month("none");
		}
		
		payment_info.setOrderfinish_no(orderfinish_no);
		payment_info.setPayment_no(payment_no);
		payment_info.setMember_id(member.getMember_id());
		service.payment_insert(payment_info);
		
		
	}
	*/
	/*@RequestMapping(value="/mileage", method=RequestMethod.POST)
	public void mileagePost(MileageVO vo, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		String mileage_no = UUID.randomUUID().toString().replace("-", "");
		
		vo.setOrderfinish_no(orderfinish_no);
		vo.setMember_id(member.getMember_id());
		vo.setMileage_no(mileage_no);
		
		m_service.insert_mileage(vo);
		
	}*/
	
	/*@RequestMapping(value="/orderfinish", method=RequestMethod.GET)
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
	}*/
	
	
	@RequestMapping(value="/mileage_view", method=RequestMethod.GET)
	public String mileage_viewGET(Model model, HttpServletRequest request,@RequestParam(value="page", defaultValue = "1")int page
				) throws Exception{
		
		MemberVO member = (MemberVO)request.getSession().getAttribute("login");
		String member_id = member.getMember_id();
		
		PagingMaker PagingMaker = new PagingMaker();
		PagingMaker.setDisplayPageNum(5);
		
	    if(page != 1){
			PagingMaker.setPage(page);
	    }
	    
		PagingMaker.setTotalCount(m_service.mileagecount(member_id));
		
		List<MileageListVO> list = m_service.mileage_view(member_id, PagingMaker);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", PagingMaker);
		
		model.addAttribute("current", m_service.mileage_current(member.getMember_id()));
		return "mypage/mileage_view";
	}
	
	@RequestMapping(value="/mileage_view", method=RequestMethod.POST)
	public String mileage_viewPOST(Model model, HttpServletRequest request,@RequestParam(value="page", defaultValue = "1")int page,
			@RequestParam("start_date") String start, @RequestParam("end_date") String end) throws Exception{
		
		
		start = start.replace("-", "");
		end = end.replace("-", "");
		
		MemberVO member = (MemberVO)request.getSession().getAttribute("login");
		String member_id = member.getMember_id();
		
		PagingMaker PagingMaker = new PagingMaker();
		PagingMaker.setDisplayPageNum(5);
		
	    if(page != 1){
			PagingMaker.setPage(page);
	    }
	    
		PagingMaker.setTotalCount(m_service.mileage_search_count(member_id, start, end));
		
		List<MileageListVO> list = m_service.mileage_search_view(member_id, PagingMaker, start, end);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", PagingMaker);
		
		model.addAttribute("current", m_service.mileage_current(member.getMember_id()));
		
		return "mypage/mileage_view";
	}
	
	
	@RequestMapping(value="/order_detailview", method=RequestMethod.GET)
	public String order_detailview(@RequestParam("order_finish_no") String no, Model model) throws Exception{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		List<OrderFinish_DetailVO> list = m_service.orderproduct_detail(no);
		List<String> pay = m_service.detail_payment(no);
		
		model.addAttribute("list",list);
		System.out.println(list.toString());
		int sum = 0; //배달비
		int total =0; // 제품 가격
		int sum_total = 0; //배달비 + 제품가격
		int finish = 0; // (배달비 + 제품가격) - 할인가격
		String phonenumber = null;
		
		for(int i=0; i<list.size(); i++){
			model.addAttribute("order_finish_no",list.get(i).getOrderfinish_no());
			model.addAttribute("date",format.format(list.get(i).getOrderfinish_date()));
			model.addAttribute("membername",list.get(i).getOrderfinish_member_name());
			model.addAttribute("memberaddr",list.get(i).getOrderfinish_member_address());
			
			phonenumber = list.get(i).getOrderfinish_member_phonenum();
			
			total += list.get(i).getOrderfinish_total_price();
			model.addAttribute("total",total);
			
			sum += list.get(i).getOrderfinish_delivery_price();
			model.addAttribute("delivery",sum);
			
			model.addAttribute("finish",list.get(i).getOrderfinish_final_price());
			
			
		}
		sum_total = total + sum;
		model.addAttribute("sum_total",sum_total);
		
		for(int i=0; i<pay.size(); i++){
			System.out.println(pay.get(i));
			model.addAttribute("payment",pay.get(i));
		}
		
		String p_1 = phonenumber.substring(0,3);
		String p_2 = phonenumber.substring(3,7);
		String p_3 = phonenumber.substring(7,phonenumber.length());
		
		String phone = p_1+"-"+p_2+"-"+p_3;
		model.addAttribute("phonenumber",phone);
		
		model.addAttribute("mileage", m_service.detail_mileage(no));
		
		return "mypage/order_detailview";		
	}
	
	
} 
