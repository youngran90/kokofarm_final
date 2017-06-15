package kokofarm.main.service;

import java.util.List;
import java.util.Map;

import kokofarm.basic.domain.Criteria;
import kokofarm.basic.domain.SearchCriteria;
import kokofarm.product.domain.ProductVO;

public interface MainRegService {
	
	public List<ProductVO> list_ProService(Map<String, String> map) throws Exception;
	public int listCountCriteria(Criteria cri) throws Exception;
	public List<ProductVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	public ProductVO proD_Info(String pNo) throws Exception;
	public List<ProductVO> main_listService() throws Exception;
	
}
