package kokofarm.mypage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.mypage.domain.AuctionViewVO;
import kokofarm.mypage.domain.SuccessViewVO;
import kokofarm.mypage.domain.TenderViewVO;
import kokofarm.mypage.persistence.AuctionViewDAO;

@Service
public class AuctionViewServiceImpl implements AuctionViewService {
	
	@Inject
	private AuctionViewDAO dao;

	/*@Override
	public List<SuccessViewVO> selectSuccessView(TenderViewVO tender) throws Exception {
		return dao.selectSuccessView(tender);
	}*/
	
	@Override
	public List<SuccessViewVO> selectSuccessView() throws Exception {
		return dao.selectSuccessView();
	}

	@Override
	public List<TenderViewVO> selectTenderView(String member_id) throws Exception {
		return dao.selectTenderView(member_id);
	}

	@Override
	public List<TenderViewVO> selectTenderAll() throws Exception {
		return dao.selectTenderAll();
	}

	@Override
	public AuctionViewVO selectAuctionAll(int auction_no) throws Exception {
		return dao.selectAuctionAll(auction_no);
	}
	
	
	
	

}
