package kokofarm.auction.service;

import java.util.List;

import kokofarm.auction.domain.AuctionRegisterVO;

public interface AuctionService {
	public void regist(AuctionRegisterVO auction) throws Exception;
	public AuctionRegisterVO detail(int auction_no) throws Exception;
	public List<AuctionRegisterVO> list() throws Exception;
}
