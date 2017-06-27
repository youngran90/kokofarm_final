package kokofarm.rtauction.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.member.domain.MemberVO;
import kokofarm.rtauction.domain.RtAcutionFinishVO;
import kokofarm.rtauction.domain.RtAuctionFinishListVO;
import kokofarm.rtauction.domain.RtAuctionInfoVO;
import kokofarm.rtauction.domain.RtResultAuctionListVO;
import kokofarm.rtauction.domain.RtResultAuctionVO;

@Repository
public class RtAuctionDAOImpl implements RtAuctionDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "kokofarm.rtauction.mapper.RtAuctionMapper";

	@Override
	public RtAuctionInfoVO rtauction_info(String rt_auction_no) throws Exception {
		return session.selectOne(namespace+".rtauctioninfo", rt_auction_no);
	}

	@Override
	public void rtresultauction(RtResultAuctionVO vo) throws Exception {
		session.insert(namespace+".rtresultauction",vo);
		
	}

	@Override
	public RtResultAuctionListVO resultList(String rt_auction_no) throws Exception {
		return session.selectOne(namespace+".resultList", rt_auction_no);
	}

	@Override
	public MemberVO member_info(String member_id) throws Exception {
		return session.selectOne(namespace+".member_info", member_id);
	}

	@Override
	public void rt_auction_finish(RtAcutionFinishVO vo) throws Exception {
		session.insert(namespace+".rt_auction_finish", vo);
	}

	@Override
	public List<RtAuctionFinishListVO> rt_auction_finish_list(String member_id) throws Exception {
		return session.selectList(namespace+".rt_auction_finish_list",member_id);
	}
	
	
	
	
}
