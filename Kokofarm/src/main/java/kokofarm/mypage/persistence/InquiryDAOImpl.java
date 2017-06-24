package kokofarm.mypage.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.mypage.domain.InquiryVO;
import kokofarm.orderproduct.domain.OrderFinishVO;
import kokofarm.product.domain.PagingMaker;
import kokofarm.product.domain.ReplyVO;

@Repository
public class InquiryDAOImpl implements InquiryDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace 
		="kokofarm.mapper.InquiryMapper";
	
	
	//구매자
	@Override
	public void Insert_Inquiry(InquiryVO vo) throws Exception {
		session.insert(namespace+".insertInquiry", vo);
	}

	@Override
	public List<InquiryVO> list_Inquiry(String member_id, PagingMaker PagingMaker) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("PagingMaker", PagingMaker);
		return session.selectList(namespace+".listInquiry", map);
	}
	
	@Override
	public void update_Inquiry(InquiryVO vo) throws Exception {
		session.update(namespace+".updateInquiry", vo);
	}
	

	//판매자 답변달기
	@Override
	public void Insert_InquiryReply(InquiryVO vo) throws Exception {
		session.update(namespace+".insertInquiryReply", vo);
	}
	
	@Override
	public List<InquiryVO> list_Inquiry_s(String seller_no, PagingMaker PagingMaker) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seller_no", seller_no);
		map.put("PagingMaker", PagingMaker);
		return session.selectList(namespace+".list_Inquiry", map);
	}

	//공통(글세부,삭제)
	@Override
	public InquiryVO detail_Inquiry(String inquiry_no) throws Exception {
	 return 	session.selectOne(namespace+".detailInquiry", inquiry_no);
	}
	
	@Override
	public void delete_Inquiry(String inquiry_no) throws Exception {
		session.delete(namespace+".deleteInquiry", inquiry_no);
	}

	@Override
	public int countInquiry(String member_id) throws Exception {
		return session.selectOne(namespace+".countInquiry", member_id);
	}

	@Override
	public List<OrderFinishVO> orderproduct_list(String member_id, PagingMaker PagingMaker) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("PagingMaker", PagingMaker);
		return session.selectList(namespace+".orderproduct_list", map);
	}

	@Override
	public int countOrderfinish(String member_id) throws Exception {
		return session.selectOne(namespace+".countOrderfinish", member_id);
	}
	
}
