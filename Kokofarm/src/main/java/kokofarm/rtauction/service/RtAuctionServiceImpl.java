package kokofarm.rtauction.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.rtauction.domain.RtAuctionInfoVO;
import kokofarm.rtauction.persistence.RtAuctionDAO;

@Service
public class RtAuctionServiceImpl implements RtAuctionService{

	@Inject
	private RtAuctionDAO dao;
	
	@Override
	public RtAuctionInfoVO rtauction_info(String rt_auction_no) throws Exception {
		return dao.rtauction_info(rt_auction_no);
	}

}
