package kokofarm.mypage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.mypage.domain.InquiryVO;
import kokofarm.mypage.persistence.InquiryDAO;
import kokofarm.orderproduct.domain.OrderFinishVO;
import kokofarm.product.domain.PagingMaker;
import kokofarm.product.domain.ReplyVO;

@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Inject
	private InquiryDAO dao;

	@Override
	public void Insert_Inquiry(InquiryVO vo) throws Exception {
		dao.Insert_Inquiry(vo);
	}

	@Override
	public List<InquiryVO> list_Inquiry(String member_id, PagingMaker PagingMaker) throws Exception {
		return dao.list_Inquiry(member_id, PagingMaker);
	}

	@Override
	public void update_Inquiry(InquiryVO vo) throws Exception {
		dao.update_Inquiry(vo);
	}

	@Override
	public void Insert_InquiryReply(InquiryVO vo) throws Exception {
		dao.Insert_InquiryReply(vo);
	}
	
	@Override
	public InquiryVO detail_Inquiry(String inquiry_no) throws Exception {
	 return 	dao.detail_Inquiry(inquiry_no);
		
	}

	@Override
	public void delete_Inquiry(String reply_no) throws Exception {
		dao.delete_Inquiry(reply_no);
	}

	@Override
	public List<InquiryVO> list_Inquiry_s(String seller_no, PagingMaker PagingMaker) throws Exception {
		return dao.list_Inquiry_s(seller_no, PagingMaker);
	}

	@Override
	public int countInquiry(String member_id) throws Exception {
		return dao.countInquiry(member_id);
	}

	@Override
	public List<OrderFinishVO> orderproduct_list(String member_id, PagingMaker PagingMaker) throws Exception {
		return dao.orderproduct_list(member_id, PagingMaker);
	}

	@Override
	public int countOrderfinish(String member_id) throws Exception {
		return dao.countOrderfinish(member_id);
	}

	@Override
	public int count_Inquiry(String seller_id) throws Exception {
		return dao.count_Inquiry(seller_id);
	}



	
	
}
