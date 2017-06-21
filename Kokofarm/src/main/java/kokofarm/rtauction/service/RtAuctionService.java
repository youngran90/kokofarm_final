package kokofarm.rtauction.service;

import kokofarm.rtauction.domain.RtAuctionInfoVO;
import kokofarm.rtauction.domain.RtResultAuctionVO;

public interface RtAuctionService {
	public RtAuctionInfoVO rtauction_info(String rt_auction_no) throws Exception;
	
	public void rtresultauction(RtResultAuctionVO vo) throws Exception;
}
