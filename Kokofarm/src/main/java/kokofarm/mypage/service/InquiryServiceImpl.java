package kokofarm.mypage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.mypage.domain.InquiryVO;
import kokofarm.mypage.persistence.InquiryDAO;
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
	public List<InquiryVO> list_Inquiry(String member_id) throws Exception {
		return dao.list_Inquiry(member_id);
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
	public List<InquiryVO> list_Inquiry_s(String seller_no) throws Exception {
		return dao.list_Inquiry_s(seller_no);
	}



	
	
}
