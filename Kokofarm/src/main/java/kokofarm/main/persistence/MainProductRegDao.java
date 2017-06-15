package kokofarm.main.persistence;

import java.util.List;
import java.util.Map;

import kokofarm.basic.domain.Criteria;
import kokofarm.basic.domain.SearchCriteria;
import kokofarm.product.domain.ProductVO;

public interface MainProductRegDao {
	public List<ProductVO> list_main(Map<String, String> map) throws Exception;
	public int countPaging(Criteria cri) throws Exception;
	public List<ProductVO> listSearch(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	public ProductVO proD_Info(String pNo) throws Exception;
	public List<ProductVO> main_list()throws Exception;
	

}
