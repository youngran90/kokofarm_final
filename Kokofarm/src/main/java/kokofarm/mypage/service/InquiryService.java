package kokofarm.mypage.service;

import java.util.List;

import kokofarm.mypage.domain.InquiryVO;
import kokofarm.product.domain.ReplyVO;

public interface InquiryService {

	
	public void Insert_Inquiry(InquiryVO vo)throws Exception;
	
	public List<InquiryVO> list_Inquiry(String member_id)throws Exception;
	
	public void update_Inquiry(InquiryVO vo)throws Exception;
	
	//판매자
	public void Insert_InquiryReply(InquiryVO vo)throws Exception;
	
	public List<InquiryVO> list_Inquiry_s(String seller_no)throws Exception;


	//공통
	public InquiryVO detail_Inquiry(String inquiry_no)throws Exception;
	
	public void delete_Inquiry(String reply_no)throws Exception;	
	
}
