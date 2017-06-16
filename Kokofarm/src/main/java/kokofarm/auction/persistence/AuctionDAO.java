package kokofarm.auction.persistence;

import java.util.List;

import kokofarm.auction.domain.AuctionCri;
import kokofarm.auction.domain.AuctionRegisterVO;
import kokofarm.auction.domain.RT_AuctionCri;
import kokofarm.auction.domain.RT_AuctionRegisterVO;


public interface AuctionDAO {
	/*일반 경매*/
	public void register(AuctionRegisterVO vo) throws Exception;
	public List<AuctionRegisterVO> list() throws Exception;
	public List<AuctionRegisterVO> listPage(int page) throws Exception;
	public List<AuctionRegisterVO> listCri(AuctionCri cri) throws Exception;
	public int countPage(AuctionCri cri) throws Exception;
	public AuctionRegisterVO detail(int auction_no) throws Exception;
	public void updateAuctionHits(int auction_no) throws Exception;
	
	/*실시간 경매*/
	public void rt_register(RT_AuctionRegisterVO vo) throws Exception;
	public List<RT_AuctionRegisterVO> rt_list() throws Exception;
	public List<RT_AuctionRegisterVO> rt_listPage(int page) throws Exception;
	public List<RT_AuctionRegisterVO> rt_listCri(RT_AuctionCri cri) throws Exception;
	public RT_AuctionRegisterVO rt_detail(String rt_auction_no) throws Exception;
	/*public int rt_count(RT_AuctionRegisterVO vo) throws Exception;*/
}
