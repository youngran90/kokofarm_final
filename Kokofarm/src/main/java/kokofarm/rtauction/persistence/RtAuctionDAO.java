package kokofarm.rtauction.persistence;

import kokofarm.rtauction.domain.RtAuctionInfoVO;
import kokofarm.rtauction.domain.RtResultAuctionVO;

public interface RtAuctionDAO {
	public RtAuctionInfoVO rtauction_info(String rt_auction_no) throws Exception;
	
	public void rtresultauction(RtResultAuctionVO vo) throws Exception;
}
