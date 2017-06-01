package kokofarm.auction.persistence;

import kokofarm.auction.domain.AuctionRegisterVO;

public interface AuctionDAO {
	public void create(AuctionRegisterVO vo) throws Exception;
}
