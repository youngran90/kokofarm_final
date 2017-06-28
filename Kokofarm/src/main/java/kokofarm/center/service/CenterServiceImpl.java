package kokofarm.center.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kokofarm.center.domain.CenterVO;
import kokofarm.center.persistence.CenterDAO;

@Service
public class CenterServiceImpl implements CenterService {
	
	@Inject
	private CenterDAO dao;

	@Override
	public void create(CenterVO vo) throws Exception {
		dao.create(vo);

	}

	@Override
	public List<CenterVO> list_notice() throws Exception {
		return dao.list_notice();
	}

	@Override
	public List<CenterVO> list_faq() throws Exception {
		return dao.list_faq();
	}

	
	@Override
	public CenterVO detail_notice(int cno) throws Exception {
		return dao.detail_notice(cno);
	}

	
	@Override
	public CenterVO detail_faq(int cno) throws Exception {
		return dao.detail_faq(cno);
	}
	
	@Override
	public void delete_notice(int cno) throws Exception {
		dao.delete_notice(cno);
	}

	@Override
	public void delete_faq(int cno) throws Exception {
		dao.delete_faq(cno);
	}

	@Override
	public void update_viewcnt(int cno) throws Exception {
		dao.update_viewcnt(cno);
		
	}



	

}
