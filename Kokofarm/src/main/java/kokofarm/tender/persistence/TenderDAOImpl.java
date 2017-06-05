package kokofarm.tender.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.tender.domain.AuctionVO;
import kokofarm.tender.domain.TenderVO;

@Repository
public class TenderDAOImpl implements TenderDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace= "kokofarm.tender.mappers.TenderMapper";

	@Override
	public void insertTender(TenderVO tender) throws Exception {
		session.insert(namespace+".insertTender",tender);
	}

	@Override
	public AuctionVO selectAuctionProduct(int auction_no) throws Exception {
		return session.selectOne(namespace+".selectAuctionProduct",auction_no);
	}

	@Override
	public Integer selectCurrentPrice(int auction_no) throws Exception {
		return session.selectOne(namespace+".selectCurrentPrice",auction_no);
	}

	@Override
	public List<TenderVO> AllTender(int auctioin_no) throws Exception {
		return session.selectList(namespace+".AllTender",auctioin_no);
	}

	@Override
	public void insertSuccess(int tender_no) throws Exception {
		session.insert(namespace+".insertSuccess",tender_no);
	}

	@Override
	public void updateAuctionResult(int auction_no) throws Exception {
		session.update(namespace+".updateAuctionResult",auction_no);
		
	}
	
}
