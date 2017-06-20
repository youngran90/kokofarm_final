package kokofarm.mypage.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.mypage.domain.AuctionViewVO;
import kokofarm.mypage.domain.SuccessViewVO;
import kokofarm.mypage.domain.TenderViewVO;

@Repository
public class AuctionViewDAOImpl implements AuctionViewDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="kokofarm.mypage.mappers.AuctionViewMapper";

	/*@Override
	public List<SuccessViewVO> selectSuccessView(TenderViewVO tender) throws Exception {
		return session.selectList(namespace+".selectSuccessView" , tender);
	}*/
	
	@Override
	public List<SuccessViewVO> selectSuccessView() throws Exception {
		return session.selectList(namespace+".selectSuccessView");
	}
	

	@Override
	public List<TenderViewVO> selectTenderView(String member_id) throws Exception {
		return session.selectList(namespace+".selectTenderView", member_id);
	}

	@Override
	public List<TenderViewVO> selectTenderAll() throws Exception {
		return session.selectList(namespace+".selectTenderAll");
	}


	@Override
	public AuctionViewVO selectAuctionAll(int auction_no) throws Exception {
		return session.selectOne(namespace+".selectAuctionAll",auction_no);
	}


	@Override
	public List<AuctionViewVO> selectAuctionSeller(String seller_no) throws Exception {
		return session.selectList(namespace+".selectAuctionSeller", seller_no);
	}
	
	
	
	
}
