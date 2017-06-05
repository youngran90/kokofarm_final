package kokofarm.tender.service;

import java.util.List;

import kokofarm.tender.domain.AuctionVO;
import kokofarm.tender.domain.TenderVO;

public interface TenderService {
	public void insertTender(TenderVO tender) throws Exception;
	public AuctionVO selectAuctionProduct(int auction_no) throws Exception;
	public Integer selectCurrentPrice(int auction_no) throws Exception;
	public List<TenderVO> AllTender(int auctioin_no) throws Exception;
	public void insertSuccess(int tender_no) throws Exception;
	public void updateAuctionResult(int auction_no) throws Exception;


}
