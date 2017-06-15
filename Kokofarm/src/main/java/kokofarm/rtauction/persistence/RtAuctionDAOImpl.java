package kokofarm.rtauction.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.rtauction.domain.RtAuctionInfoVO;

@Repository
public class RtAuctionDAOImpl implements RtAuctionDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "kokofarm.rtauction.mapper.RtAuctionMapper";

	@Override
	public RtAuctionInfoVO rtauction_info(String rt_auction_no) throws Exception {
		return session.selectOne(namespace+".rtauction_info", rt_auction_no);
	}
	
	
}
