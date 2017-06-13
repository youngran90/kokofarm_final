package kokofarm.tender.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.tender.domain.AuctionVO;
import kokofarm.tender.domain.PayVO;
import kokofarm.tender.domain.SuccessPayVO;
import kokofarm.tender.domain.SuccessVO;
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

	@Override
	public List<SuccessVO> selectSuccess() throws Exception {
		return session.selectList(namespace+".selectSuccess");
	}

	@Override
	public SuccessPayVO selectSuccessPay(TenderVO tender) throws Exception {
		return session.selectOne(namespace+".selectSuccessPay",tender);
	}

	@Override
	public TenderVO selectTender(int tender_no) throws Exception {
		return session.selectOne(namespace+".selectTender",tender_no);
	}

	@Override
	public void insertPayInfo(PayVO payvo) throws Exception {
		session.insert(namespace+".insertPayInfo",payvo);
		
	}

	@Override
	public List<PayVO> selectPayInfo() throws Exception {
		return session.selectList(namespace+".selectPayInfo");
	}

	@Override
	public void updateSuccess(PayVO payvo) throws Exception {
		session.update(namespace+".updateSuccess",payvo);
		
	}
	
	
	
	
	
	
	
}
