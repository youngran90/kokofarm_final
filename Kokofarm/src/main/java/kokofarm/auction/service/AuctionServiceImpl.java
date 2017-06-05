package kokofarm.auction.service;

import java.util.List;

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
		dao.register(auction);
		
	}

	@Override
	public AuctionRegisterVO detail(int auction_no) throws Exception {
		return dao.detail(auction_no);
	}

	@Override
	public List<AuctionRegisterVO> list() throws Exception {
		return dao.list();
	}

}
