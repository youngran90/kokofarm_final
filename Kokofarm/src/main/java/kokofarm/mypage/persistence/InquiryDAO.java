package kokofarm.mypage.persistence;

import java.util.List;

import kokofarm.mypage.domain.InquiryVO;
import kokofarm.orderproduct.domain.OrderFinishVO;
import kokofarm.product.domain.PagingMaker;
import kokofarm.product.domain.ReplyVO;

public interface InquiryDAO {

		public void Insert_Inquiry(InquiryVO vo)throws Exception;
		
		public List<InquiryVO> list_Inquiry(String member_id, PagingMaker PagingMaker)throws Exception;
		
		public List<InquiryVO> list_Inquiry_s(String seller_no, PagingMaker PagingMaker)throws Exception;
		
		public void update_Inquiry(InquiryVO vo)throws Exception;
		
		//판매자
		public void Insert_InquiryReply(InquiryVO vo)throws Exception;
	
		//공통
		public InquiryVO detail_Inquiry(String inquiry_no)throws Exception;
		
		public void delete_Inquiry(String reply_no)throws Exception;	
		
		public int countInquiry(String member_id)throws Exception;
		
		public int count_Inquiry(String seller_id)throws Exception;
		
		//order
		public List<OrderFinishVO> orderproduct_list(String member_id, PagingMaker PagingMaker)throws Exception;
		
		public int countOrderfinish(String member_id)throws Exception;

}
