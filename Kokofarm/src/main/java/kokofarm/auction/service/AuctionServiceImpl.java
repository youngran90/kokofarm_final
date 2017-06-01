package kokofarm.auction.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.auction.domain.AuctionRegisterVO;
import kokofarm.auction.persistence.AuctionDAO;

@Service
public class AuctionServiceImpl implements AuctionService{
	
	@Inject
	private AuctionDAO dao;
	
	@Override
	public void regist(AuctionRegisterVO auction) throws Exception {
		
		
	}

}
