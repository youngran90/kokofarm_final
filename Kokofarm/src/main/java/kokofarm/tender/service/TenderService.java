package kokofarm.tender.service;

import java.util.List;

import kokofarm.tender.domain.AuctionVO;
import kokofarm.tender.domain.PayVO;
import kokofarm.tender.domain.SuccessPayVO;
import kokofarm.tender.domain.SuccessVO;
import kokofarm.tender.domain.TenderVO;

public interface TenderService {
	public void insertTender(TenderVO tender) throws Exception;
	public AuctionVO selectAuctionProduct(int auction_no) throws Exception;
	public Integer selectCurrentPrice(int auction_no) throws Exception;
	public List<TenderVO> AllTender(int auctioin_no) throws Exception;
	public void insertSuccess(int tender_no) throws Exception;
	public void updateAuctionResult(int auction_no) throws Exception;
	public List<SuccessVO> selectSuccess() throws Exception;
	public SuccessPayVO selectSuccessPay(TenderVO tender) throws Exception;
	public TenderVO selectTender(int tender_no) throws Exception;
	public void insertPayInfo(PayVO payvo) throws Exception;
	public List<PayVO> selectPayInfo() throws Exception;
	public void updateSuccess(PayVO payvo) throws Exception;
	public void updateAuctionSuccess(int auction_no) throws Exception;
	//public void updateAuctionHit(int auction_no) throws Exception;





}
