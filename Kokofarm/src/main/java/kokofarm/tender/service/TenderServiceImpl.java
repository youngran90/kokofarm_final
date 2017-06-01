package kokofarm.tender.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
	

}
