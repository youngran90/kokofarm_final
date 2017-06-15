package kokofarm.main.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.basic.domain.Criteria;
import kokofarm.basic.domain.SearchCriteria;
import kokofarm.main.persistence.MainProductRegDao;
import kokofarm.product.domain.ProductVO;

@Service
public class MainRegServiceImpl implements MainRegService {

	@Inject
	private MainProductRegDao dao;
	
	@Override
	public List<ProductVO> list_ProService(Map<String, String> map) throws Exception {
		return dao.list_main(map);
		
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
	
		return dao.countPaging(cri);
	}

	@Override
	public List<ProductVO> listSearchCriteria(SearchCriteria cri) throws Exception {
	
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
	
		return dao.listSearchCount(cri);
	}

	@Override
	public ProductVO proD_Info(String pNo) throws Exception {
	
		return dao.proD_Info(pNo);
	}

	@Override
	public List<ProductVO> main_listService() throws Exception {
		return dao.main_list();
	}

}
