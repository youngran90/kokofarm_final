package kokofarm.mypage.controller;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kokofarm.basic.domain.Criteria;
import kokofarm.basic.domain.PageMaker;
import kokofarm.member.domain.MemberVO;
import kokofarm.mypage.domain.InquiryVO;
import kokofarm.mypage.service.InquiryService;

@Controller
@RequestMapping("/mypage/*")
public class InquiryController {
	
	@Inject
	private InquiryService service;
	
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
	public void listInquiry(InquiryVO inquiry, Model model, HttpServletRequest request)throws Exception{
		
		logger.info("inquiry..list...");
		
		
		MemberVO member = (MemberVO)request.getSession().getAttribute("login");
		String member_id = member.getMember_id();
		
		String seller_no = member.getSeller_no();
		if(seller_no == null){
			seller_no = "";
		}
		
		List<InquiryVO> inquirylist =  service.list_Inquiry(member_id);
		System.out.println("1"+inquirylist.toString());
		
		List<InquiryVO> inquirylist_s =  service.list_Inquiry_s(seller_no);
		System.out.println("2"+inquirylist_s.toString());
		

		model.addAttribute("inquirylist",inquirylist);
		model.addAttribute("inquirylist_s",inquirylist_s);
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
}
