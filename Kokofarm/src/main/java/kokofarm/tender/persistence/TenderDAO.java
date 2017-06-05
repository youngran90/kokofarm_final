package kokofarm.tender.persistence;

import java.util.List;

import kokofarm.tender.domain.AuctionVO;
import kokofarm.tender.domain.TenderVO;

public interface TenderDAO {
	public void insertTender(TenderVO tender) throws Exception;
	public AuctionVO selectAuctionProduct(int auction_no) throws Exception;
	public Integer selectCurrentPrice(int auction_no) throws Exception;
	public List<TenderVO> AllTender(int auctioin_no) throws Exception;
	public void insertSuccess(int tender_no) throws Exception;
	public void updateAuctionResult(int auction_no) throws Exception;
	//
	/*
	public TenderDto selectSuccess(@Param("a") String s, @Param("b") Integer i) throws Exception;
	public int selectPriceUp(String auction_no) throws Exception;
	public int selectPriceDown(String auction_no) throws Exception;
	public void updateTender(int tender_price) throws Exception;*/
	
	//public String selectSeller(String auction_no) throws Exception;

}
