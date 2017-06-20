package kokofarm.tender.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kokofarm.tender.domain.AuctionVO;
import kokofarm.tender.domain.PayVO;
import kokofarm.tender.domain.SuccessPayVO;
import kokofarm.tender.domain.SuccessVO;
import kokofarm.tender.domain.TenderVO;
import kokofarm.tender.persistence.TenderDAO;

@Service
public class TenderServiceImpl implements TenderService {
	
	@Inject
	private TenderDAO dao;

	@Override
	public void insertTender(TenderVO tender) throws Exception {
		
		dao.insertTender(tender);
		
	}

	@Transactional
	@Override
	public AuctionVO selectAuctionProduct(int auction_no) throws Exception {
		dao.updateAuctionHit(auction_no);
		return dao.selectAuctionProduct(auction_no);
	}

	@Override
	public Integer selectCurrentPrice(int auction_no) throws Exception {
		return dao.selectCurrentPrice(auction_no);
	}

	@Override
	public List<TenderVO> AllTender(int auctioin_no) throws Exception {
		return dao.AllTender(auctioin_no);
	}

	@Override
	public void insertSuccess(int tender_no) throws Exception {
		dao.insertSuccess(tender_no);
		
	}

	@Override
	public void updateAuctionResult(int auction_no) throws Exception {
		dao.updateAuctionResult(auction_no);
		
	}

	@Override
	public List<SuccessVO> selectSuccess() throws Exception {
		return dao.selectSuccess();
	}

	@Override
	public SuccessPayVO selectSuccessPay(TenderVO tender) throws Exception {
		return dao.selectSuccessPay(tender);
	}

	@Override
	public TenderVO selectTender(int tender_no) throws Exception {
		return dao.selectTender(tender_no);
	}

	//@Transactional
	@Override
	public void insertPayInfo(PayVO payvo) throws Exception {
		dao.insertPayInfo(payvo);
		//dao.updateSuccess(payvo);
		//System.out.println("service에서의 출력"+payvo.getPay_no());
		
	}


	@Override
	public List<PayVO> selectPayInfo() throws Exception {
		return dao.selectPayInfo();
	}

	@Override
	public void updateSuccess(PayVO payvo) throws Exception {
		dao.updateSuccess(payvo);
		
	}

	@Override
	public void updateAuctionSuccess(int auction_no) throws Exception {
		dao.updateAuctionSuccess(auction_no);
	}
	
	
	
	
	
	
	
	

}
