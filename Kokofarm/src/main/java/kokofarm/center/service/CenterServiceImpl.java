package kokofarm.center.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
	public List<CenterVO> list() throws Exception {
		return dao.list();
	}

}
