package kokofarm.auction.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kokofarm.auction.domain.AuctionCri;
import kokofarm.auction.domain.AuctionRegisterVO;
import kokofarm.auction.domain.RT_AuctionCri;
import kokofarm.auction.domain.RT_AuctionRegisterVO;

public interface AuctionService {
	/*일반 경매*/
	public void register(AuctionRegisterVO auction) throws Exception;
	public List<AuctionRegisterVO> list() throws Exception;
	public List<AuctionRegisterVO> listCri(AuctionCri cri) throws Exception;
	public List<AuctionRegisterVO> list_Fruit(AuctionCri cri) throws Exception;
	public List<AuctionRegisterVO> list_Vege(AuctionCri cri) throws Exception;
	public List<AuctionRegisterVO> list_New(AuctionCri cri) throws Exception;
	public List<AuctionRegisterVO> list_End(AuctionCri cri) throws Exception;
	public int CountPage(AuctionCri cri)throws Exception;
	public AuctionRegisterVO detail(int auction_no) throws Exception;
	public List<AuctionRegisterVO> new_auction()throws Exception;
	public List<AuctionRegisterVO> pop_auction()throws Exception;
	
	/*실시간 경매*/
	public void rt_register(RT_AuctionRegisterVO rt_auction) throws Exception;
	public List<RT_AuctionRegisterVO> rt_list() throws Exception;
	/*public List<RT_AuctionRegisterVO> rt_listCri(RT_AuctionCri cri) throws Exception;*/
	public List<RT_AuctionRegisterVO> rt_listAM(RT_AuctionCri cri) throws Exception;
	public List<RT_AuctionRegisterVO> rt_listPM(RT_AuctionCri cri) throws Exception;
	public RT_AuctionRegisterVO rt_detail(String rt_auction_no) throws Exception;
	public int rt_count() throws Exception;
	
	
}
