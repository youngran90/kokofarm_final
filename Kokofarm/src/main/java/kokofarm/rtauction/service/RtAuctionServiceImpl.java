package kokofarm.rtauction.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.member.domain.MemberVO;
import kokofarm.rtauction.domain.RtAcutionFinishVO;
import kokofarm.rtauction.domain.RtAuctionFinishListVO;
import kokofarm.rtauction.domain.RtAuctionInfoVO;
import kokofarm.rtauction.domain.RtResultAuctionListVO;
import kokofarm.rtauction.domain.RtResultAuctionVO;
import kokofarm.rtauction.persistence.RtAuctionDAO;

@Service
public class RtAuctionServiceImpl implements RtAuctionService{

	@Inject
	private RtAuctionDAO dao;
	
	@Override
	public RtAuctionInfoVO rtauction_info(String rt_auction_no) throws Exception {
		return dao.rtauction_info(rt_auction_no);
	}

	@Override
	public void rtresultauction(RtResultAuctionVO vo) throws Exception {
		dao.rtresultauction(vo);
	}

	@Override
	public RtResultAuctionListVO resultList(String rt_auction_no) throws Exception {
		return dao.resultList(rt_auction_no);
	}

	@Override
	public MemberVO member_info(String member_id) throws Exception {
		return dao.member_info(member_id);
	}

	@Override
	public void rt_auction_finish(RtAcutionFinishVO vo) throws Exception {
		dao.rt_auction_finish(vo);
	}

	@Override
	public List<RtAuctionFinishListVO> rt_auction_finish_list(String member_id) throws Exception {
		return dao.rt_auction_finish_list(member_id);
	}

	
}
