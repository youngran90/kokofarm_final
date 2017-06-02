package kokofarm.tender.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.tender.domain.AuctionVO;
import kokofarm.tender.domain.TenderVO;
import kokofarm.tender.persistence.TenderDAO;

@Service
public class TenderServiceImpl implements TenderService {
	
	@Inject
	private TenderDAO dao;

	@Override
	public void insertTender(TenderVO tender) throws Exception {
		
		dao.insertTender(tender);
		
	}

	@Override
	public AuctionVO selectAuctionProduct(String auction_no) throws Exception {
		return dao.selectAuctionProduct(auction_no);
	}

	@Override
	public Integer selectCurrentPrice(String auction_no) throws Exception {
		return dao.selectCurrentPrice(auction_no);
	}

	@Override
	public List<TenderVO> AllTender(String auctioin_no) throws Exception {
		return dao.AllTender(auctioin_no);
	}
	
	
	
	

}
