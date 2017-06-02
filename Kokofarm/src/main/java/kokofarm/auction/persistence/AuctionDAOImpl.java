package kokofarm.auction.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.auction.domain.AuctionRegisterVO;

@Repository
public class AuctionDAOImpl implements AuctionDAO{

	@Inject
	private SqlSession session;
	private static String namespace = "kokofarm.auction.mappers.auctionMapper";
	
	@Override
	public void register(AuctionRegisterVO vo) throws Exception {
		session.insert(namespace+".register", vo);
	}

	@Override
	public AuctionRegisterVO detail(int auction_no) throws Exception {
		return session.selectOne(namespace+".detail", auction_no);
	}

	@Override
	public List<AuctionRegisterVO> list() throws Exception {
		return session.selectList(namespace+".list");
	}


}
