package kokofarm.tender.service;

import java.util.List;

import kokofarm.tender.domain.AuctionVO;
import kokofarm.tender.domain.TenderVO;

public interface TenderService {
	public void insertTender(TenderVO tender) throws Exception;
	public AuctionVO selectAuctionProduct(String auction_no) throws Exception;
	public Integer selectCurrentPrice(String auction_no) throws Exception;
	public List<TenderVO> AllTender(String auctioin_no) throws Exception;


}
