package kokofarm.rtauction.service;

import kokofarm.rtauction.domain.RtAuctionInfoVO;

public interface RtAuctionService {
	public RtAuctionInfoVO rtauction_info(String rt_auction_no) throws Exception;
}
