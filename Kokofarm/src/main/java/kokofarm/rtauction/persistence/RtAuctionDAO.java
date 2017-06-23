package kokofarm.rtauction.persistence;

import java.util.List;

import kokofarm.member.domain.MemberVO;
import kokofarm.rtauction.domain.RtAuctionInfoVO;
import kokofarm.rtauction.domain.RtResultAuctionListVO;
import kokofarm.rtauction.domain.RtResultAuctionVO;

public interface RtAuctionDAO {
	public RtAuctionInfoVO rtauction_info(String rt_auction_no) throws Exception;
	
	public void rtresultauction(RtResultAuctionVO vo) throws Exception;
	
	public RtResultAuctionListVO resultList(String rt_auction_no) throws Exception;
	
	public MemberVO member_info(String member_id) throws Exception;
	
}
