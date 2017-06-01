package kokofarm.auction.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.auction.domain.AuctionRegisterVO;

@Repository
public class AuctionDAOImpl implements AuctionDAO{

	@Inject
	private SqlSession session;
	
	@Override
	public void create(AuctionRegisterVO vo) throws Exception {
		
		
	}

}
