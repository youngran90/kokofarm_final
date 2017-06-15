package kokofarm.main.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.basic.domain.Criteria;
import kokofarm.basic.domain.SearchCriteria;
import kokofarm.product.domain.ProductVO;

@Repository
public class MainProductRegDaoImpl implements MainProductRegDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = 
				"kokofarm.main.mapper.MainMapper";
	
	@Override
	public List<ProductVO> list_main(Map<String, String> map) throws Exception {
		
		return session.selectList(namespace+".list_main", map);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
	
		return session.selectOne(namespace+".countPaging",cri);
	}

	@Override
	public List<ProductVO> listSearch(SearchCriteria cri) throws Exception {
		
		return session.selectList(namespace+".listSearch",cri, new RowBounds(cri.getPageStart(),cri.getPerPageNum()));
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace+".listSearchCount",cri);
	}

	@Override
	public ProductVO proD_Info(String pNo) throws Exception {
		
		return session.selectOne(namespace+".proD_Info",pNo);
	}

	@Override
	public List<ProductVO> main_list() throws Exception {
		
		return session.selectList(namespace+".main_list");
	}

}
