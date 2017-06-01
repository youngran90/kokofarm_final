package kokofarm.auction.service;

import kokofarm.auction.domain.AuctionRegisterVO;

public interface AuctionService {
	public void regist(AuctionRegisterVO auction)throws Exception;
}
