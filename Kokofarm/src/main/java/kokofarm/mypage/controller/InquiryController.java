package kokofarm.mypage.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kokofarm.member.domain.MemberVO;
import kokofarm.mypage.domain.InquiryVO;
import kokofarm.mypage.domain.graphVO;
import kokofarm.mypage.service.GraphService;
import kokofarm.mypage.service.InquiryService;
import kokofarm.orderproduct.domain.OrderFinishVO;
import kokofarm.product.domain.PagingMaker;

@Controller
@RequestMapping("/mypage/*")
public class InquiryController {
	
	@Inject
	private InquiryService service;
	
	@Inject
	private GraphService g_service;
	
	
	private static final Logger logger = LoggerFactory.getLogger(InquiryController.class); 
	
	@RequestMapping(value="/Insert_inquiry", method=RequestMethod.GET)
	public String InquiryGET(@Param("product_name") String product_name, @Param("product_no") String product_no,
								@Param("seller_no")String seller_no, InquiryVO inquiry,Model model)throws Exception{
		logger.info("insert form....");
		inquiry.setProduct_name(product_name);
		inquiry.setProduct_no(product_no);
		inquiry.setSeller_no(seller_no);
		model.addAttribute("inquiry", inquiry);
		return "/mypage/insert_inquiry";
	}

	@RequestMapping(value="/InsertInquiry", method=RequestMethod.POST)
	public String InquiryPost(InquiryVO inquiry, Model model)throws Exception{
		System.out.println("insert in-----------------");
		String uuid = UUID.randomUUID().toString().replace("-", "");
		String inquiry_no = "I-"+uuid;
		inquiry.setInquiry_no(inquiry_no);
		service.Insert_Inquiry(inquiry);
		
		System.out.println(inquiry.toString());
		return "redirect:/product/list_product";
}
	
	@RequestMapping(value="/list_Inquiry", method= RequestMethod.GET)
	public void listInquiry(InquiryVO inquiry, Model model, HttpServletRequest request, @RequestParam(value="page1", defaultValue = "1")int page1, @RequestParam(value="page2", defaultValue = "1")int page2)throws Exception{
		
		logger.info("inquiry..list...");
		
		MemberVO member = (MemberVO)request.getSession().getAttribute("login");
		String member_id = member.getMember_id();
		
		String seller_no = member.getSeller_no();
		if(seller_no == null){
			seller_no = "";
		}
		PagingMaker PagingMaker = new PagingMaker();
		PagingMaker.setDisplayPageNum(4);
	    if(page1 != 1){
			PagingMaker.setPage(page1);
	    }
		PagingMaker.setTotalCount(service.countInquiry(member_id));
		List<InquiryVO> inquirylist =  service.list_Inquiry(member_id, PagingMaker);
		
		System.out.println("PagingMaker : ");
		System.out.println(PagingMaker.toString());
		
		PagingMaker PagingMaker_s = new PagingMaker();
		PagingMaker_s.setDisplayPageNum(4);
	    if(page2 != 1){
	    	PagingMaker_s.setPage(page2);
	    }
		PagingMaker_s.setTotalCount(service.count_Inquiry(seller_no));
		List<InquiryVO> inquirylist_s =  service.list_Inquiry_s(seller_no, PagingMaker_s);
		System.out.println("PagingMaker_s : ");
		System.out.println(PagingMaker_s.toString());
		
		
		model.addAttribute("inquirylist",inquirylist); //구매자용 1:1
		model.addAttribute("pageMaker", PagingMaker);
		
		model.addAttribute("inquirylist_s",inquirylist_s); //판매자용 1:1
		model.addAttribute("pageMaker_s", PagingMaker_s);

		
		
		
		
	}
	
	
	
	@RequestMapping(value="/inquiry_reply", method=RequestMethod.GET)
	public String Inquiry_replyGET(InquiryVO inquiry,Model model)throws Exception{
		logger.info("insert form....");
		
		model.addAttribute("inquiry", inquiry);
		return "/mypage/inquiry_reply";
	}
		
	@RequestMapping(value="/inquiry_update", method=RequestMethod.POST)
	@ResponseBody
	public void inquiry_update(@Param("inquiry_no")String inquiry_no, @Param("inquiry_content")String inquiry_content,Model model)throws Exception{
		logger.info("inquiry_update....");
		InquiryVO inquiry = new InquiryVO();
		inquiry.setInquiry_no(inquiry_no);
		inquiry.setInquiry_content(inquiry_content);
		service.update_Inquiry(inquiry);
		
		//model.addAttribute("inquiry", inquiry);
	}
		
	@RequestMapping(value="/inquiry_delete", method=RequestMethod.POST)
	@ResponseBody
	public void inquiry_delete(@Param("inquiry_no")String inquiry_no ,Model model)throws Exception{
		logger.info("inquiry_delete....");
		service.delete_Inquiry(inquiry_no);
		
	}
	
	@RequestMapping(value="/Insert_inquiry_reply", method=RequestMethod.GET)
	public String Insert_inquiry_form(@Param("inquiry_no")String inquiry_no, Model model)throws Exception{
		logger.info("reply form....");
		InquiryVO inquiry = service.detail_Inquiry(inquiry_no);
		model.addAttribute("inquiry", inquiry);
		return "/mypage/inquiry_reply";
	}

	@RequestMapping(value="/graph" , method=RequestMethod.GET)
	public String graph(HttpServletRequest request ,Model model, @Param("action") String action)throws Exception{
		
		System.out.println("graph in");
		MemberVO member = (MemberVO)request.getSession().getAttribute("login");
		String member_id = member.getMember_id();
		
		List<graphVO> list = g_service.v_product_no();
		model.addAttribute("list", list); //가장 판매율 높은 3가지 상품
		
		List<graphVO> list1 = new ArrayList<>();
		List<graphVO> list2 = new ArrayList<>();
		graphVO gh = new graphVO();
		list1 = g_service.sum_graph(member_id);
		int max = 0;
		System.out.println("size  :  "+ list1.size() );
			for(int i=0 ;i<list1.size(); i++){
				if(max < list1.get(i).getSum()){
					max = list1.get(i).getSum();
				};
			
				if(list1.get(i).getO_date().indexOf("01") >0){
					gh.setSum1(list1.get(i).getSum());
				}else if(list1.get(i).getO_date().equals("17-02")){
					gh.setSum2(list1.get(i).getSum());
				}else if(list1.get(i).getO_date().equals("17-03")){
					gh.setSum3(list1.get(i).getSum());
				}else if(list1.get(i).getO_date().equals("17-04")){
					gh.setSum4(list1.get(i).getSum());
				}else if(list1.get(i).getO_date().equals("17-05")){
					gh.setSum5(list1.get(i).getSum());
				}else if(list1.get(i).getO_date().equals("17-06")){
					gh.setSum6(list1.get(i).getSum());
				}else if(list1.get(i).getO_date().equals("17-07")){
					gh.setSum7(list1.get(i).getSum());
				}else if(list1.get(i).getO_date().equals("17-08")){
					gh.setSum8(list1.get(i).getSum());
				}else if(list1.get(i).getO_date().equals("17-09")){
					gh.setSum9(list1.get(i).getSum());
				}else if(list1.get(i).getO_date().equals("17-10")){
					gh.setSum10(list1.get(i).getSum());
				}else if(list1.get(i).getO_date().equals("17-11")){
					gh.setSum11(list1.get(i).getSum());
				}else if(list1.get(i).getO_date().equals("17-12")){
					gh.setSum12(list1.get(i).getSum());
				}
		}
			System.out.println(max);
		 double max1 = max*1.2;
		model.addAttribute("action", action);
		model.addAttribute("max", max1);
		model.addAttribute("gh", gh); //로그인한 사람 별 월별 총 구매액
		return "mypage/graph_view";
	}
	
	@RequestMapping(value="/Insert_inquiry_reply", method=RequestMethod.POST)
	@ResponseBody
	public void Insert_inquiry_reply(@Param("inquiry_no")String inquiry_no, @Param("inquiry_reply")String inquiry_reply,Model model)throws Exception{
		logger.info("inquiry reply_update....");
		InquiryVO inquiry = new InquiryVO();
		inquiry.setInquiry_no(inquiry_no);
		inquiry.setInquiry_reply(inquiry_reply);
		service.Insert_InquiryReply(inquiry);
		
	}
	
	@RequestMapping(value="/update_inquiry_reply", method=RequestMethod.POST)
	@ResponseBody
	public void update_inquiry_reply(@Param("inquiry_no")String inquiry_no, @Param("inquiry_reply")String inquiry_reply,Model model)throws Exception{
		logger.info("inquiry reply_update....");
		InquiryVO inquiry = new InquiryVO();
		inquiry.setInquiry_no(inquiry_no);
		inquiry.setInquiry_reply(inquiry_reply);
		service.Insert_InquiryReply(inquiry);
	}
	
	@RequestMapping(value="/mypage_main", method=RequestMethod.GET)
	public String Mypage()throws Exception{
		
		return "mypage/Mypage";
	}
	
	@RequestMapping(value="/mypage/order_list", method=RequestMethod.GET)
	public String order_list(HttpServletRequest request, @Param("orderproduct_list")OrderFinishVO orderproduct_list ,
			Model model, @RequestParam(value="page", defaultValue = "1")int page)throws Exception{
		
		MemberVO member = (MemberVO)request.getSession().getAttribute("login");
		String member_id = member.getMember_id();
		PagingMaker PagingMaker = new PagingMaker();
		PagingMaker.setDisplayPageNum(5);
		if(page != 1){
			PagingMaker.setPage(page);
	    }
		PagingMaker.setTotalCount(service.countOrderfinish(member_id)); //토탈
		model.addAttribute("list", service.orderproduct_list(member_id, PagingMaker));
		model.addAttribute("pageMaker", PagingMaker);
		System.out.println(PagingMaker.toString());
		return "mypage/order_list";
	}
	
}
