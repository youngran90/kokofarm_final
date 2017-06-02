package kokofarm.auction.persistence;

import java.util.List;

import kokofarm.auction.domain.AuctionRegisterVO;


public interface AuctionDAO {
	public void register(AuctionRegisterVO vo) throws Exception;
	public AuctionRegisterVO detail(int auction_no) throws Exception;
	public List<AuctionRegisterVO> list() throws Exception;
}
