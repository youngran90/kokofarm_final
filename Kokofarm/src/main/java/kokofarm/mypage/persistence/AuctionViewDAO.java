package kokofarm.mypage.persistence;

import java.util.List;

import javax.inject.Inject;

import kokofarm.mypage.domain.AuctionViewVO;
import kokofarm.mypage.domain.SuccessViewVO;
import kokofarm.mypage.domain.TenderViewVO;

public interface AuctionViewDAO {
	//public List<SuccessViewVO> selectSuccessView(TenderViewVO tender) throws Exception;
	public List<SuccessViewVO> selectSuccessView() throws Exception;
	public List<TenderViewVO> selectTenderView(String member_id) throws Exception;
	public List<TenderViewVO> selectTenderAll() throws Exception;
	public AuctionViewVO selectAuctionAll(int auction_no) throws Exception;
	public List<AuctionViewVO> selectAuctionSeller(String seller_no) throws Exception;
}
