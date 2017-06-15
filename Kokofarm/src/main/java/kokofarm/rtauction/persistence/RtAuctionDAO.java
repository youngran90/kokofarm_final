package kokofarm.rtauction.persistence;

import kokofarm.rtauction.domain.RtAuctionInfoVO;

public interface RtAuctionDAO {
	public RtAuctionInfoVO rtauction_info(String rt_auction_no) throws Exception;
}
