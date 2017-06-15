package kokofarm.auction.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kokofarm.auction.domain.AuctionCri;
import kokofarm.auction.domain.AuctionRegisterVO;
import kokofarm.auction.domain.RT_AuctionCri;
import kokofarm.auction.domain.RT_AuctionRegisterVO;
import kokofarm.auction.persistence.AuctionDAO;

@Service
public class AuctionServiceImpl implements AuctionService{
	
	@Inject
	private AuctionDAO dao;
	
	/*일반 경매*/
	@Override
	public void register(AuctionRegisterVO auction) throws Exception {
		dao.register(auction);
	}
	@Override
	public List<AuctionRegisterVO> list() throws Exception {
		return dao.list();
	}
	@Override
	public List<AuctionRegisterVO> listCri(AuctionCri cri) throws Exception {
		return dao.listCri(cri);
	}
	@Override
	public int CountPage(AuctionCri cri) throws Exception {
		return dao.countPage(cri);
	}
	@Override
	public AuctionRegisterVO detail(int auction_no) throws Exception {
		return dao.detail(auction_no);
	}
	@Override
	public void updateAuctionHits(int auction_no, HttpSession session) throws Exception {
		long update_time = 0;
		if(session.getAttribute("update_time"+auction_no)!=null){
			update_time = (long)session.getAttribute("update_time"+auction_no);
		}
		long current_time = System.currentTimeMillis();
		if(current_time - update_time > 5*1000){
			dao.updateAuctionHits(auction_no);
			session.setAttribute("update_time"+auction_no, current_time);
		}
	}
	
	/*실시간 경매*/
	@Override
	public void rt_register(RT_AuctionRegisterVO rt_auction) throws Exception {
		dao.rt_register(rt_auction);
	}
	@Override
	public List<RT_AuctionRegisterVO> rt_list() throws Exception {
		return dao.rt_list();
	}
	@Override
	public RT_AuctionRegisterVO rt_detail(String rt_auction_no) throws Exception {
		return dao.rt_detail(rt_auction_no);
	}
	@Override
	public List<RT_AuctionRegisterVO> rt_listCri(RT_AuctionCri cri) throws Exception {
		return dao.rt_listCri(cri);
	}
	
	
	
	

}
