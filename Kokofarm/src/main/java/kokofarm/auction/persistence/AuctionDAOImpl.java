package kokofarm.auction.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.auction.domain.AuctionCri;
import kokofarm.auction.domain.AuctionRegisterVO;
import kokofarm.auction.domain.RT_AuctionCri;
import kokofarm.auction.domain.RT_AuctionRegisterVO;

@Repository
public class AuctionDAOImpl implements AuctionDAO{

	@Inject
	private SqlSession session;
	private static String namespace = "kokofarm.auction.mappers.auctionMapper";
	
	/*일반 경매*/
	@Override
	public void register(AuctionRegisterVO vo) throws Exception {
		session.insert(namespace+".register", vo);
	}
	@Override
	public List<AuctionRegisterVO> list() throws Exception {
		return session.selectList(namespace+".list");
	}
	@Override
	public List<AuctionRegisterVO> listPage(int page) throws Exception {
		if(page <= 0){
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList(namespace+".list", page);
	}
	@Override
	public List<AuctionRegisterVO> listCri(AuctionCri cri) throws Exception {
		return session.selectList(namespace+".listCri", cri, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}
	@Override
	public List<AuctionRegisterVO> list_Fruit(AuctionCri cri) throws Exception {
		return session.selectList(namespace+".list_Fruit", cri, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}
	@Override
	public List<AuctionRegisterVO> list_Vege(AuctionCri cri) throws Exception {
		return session.selectList(namespace+".list_Vege", cri, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}
	@Override
	public List<AuctionRegisterVO> list_New(AuctionCri cri) throws Exception {
		return session.selectList(namespace+".list_New", cri, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}
	@Override
	public List<AuctionRegisterVO> list_End(AuctionCri cri) throws Exception {
		return session.selectList(namespace+".list_End", cri, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}
	@Override
	public int countPage(AuctionCri cri) throws Exception {
		return session.selectOne(namespace+".countPage", cri);
	}
	@Override
	public AuctionRegisterVO detail(int auction_no) throws Exception {
		return session.selectOne(namespace+".detail", auction_no);
	}
	@Override
	public List<AuctionRegisterVO> new_auction() throws Exception {
		return session.selectList(namespace+".new_auction");
	}
	@Override
	public List<AuctionRegisterVO> pop_auction() throws Exception {
		return session.selectList(namespace+".pop_auction");
	}
	
	
	/*실시간 경매*/	
	@Override
	public void rt_register(RT_AuctionRegisterVO vo) throws Exception {
		session.insert(namespace+".rt_register", vo);
	}
	@Override
	public List<RT_AuctionRegisterVO> rt_list() throws Exception {
		return session.selectList(namespace+".rt_list");
	}
	@Override
	public List<RT_AuctionRegisterVO> rt_listPage(int page) throws Exception {
		if(page <= 0){
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList(namespace+".rt_list", page);
	}
	/*@Override
	public List<RT_AuctionRegisterVO> rt_listCri(RT_AuctionCri cri) throws Exception {
		return session.selectList(namespace+".rt_listCri", cri, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}*/
	@Override
	public List<RT_AuctionRegisterVO> rt_listAM(RT_AuctionCri cri) throws Exception {
		return session.selectList(namespace+".rt_listAM");
	}
	@Override
	public List<RT_AuctionRegisterVO> rt_listPM(RT_AuctionCri cri) throws Exception {
		return session.selectList(namespace+".rt_listPM");
	}
	@Override
	public RT_AuctionRegisterVO rt_detail(String rt_auction_no) throws Exception {
		return session.selectOne(namespace+".rt_detail", rt_auction_no);
	}
	@Override
	public int rt_count() throws Exception {
		return session.selectOne(namespace+".rt_count");
	}
	
	
	

}
