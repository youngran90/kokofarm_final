package kokofarm.product.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.product.domain.ReplyVO;
import kokofarm.product.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace 
		="kokofarm.mapper.ProductMapper";
	
	@Override
	public void insert_Pro(ProductVO vo) throws Exception {
		session.insert(namespace+".insertProdcut", vo);

	}

	//전체출력
	@Override
	public List<ProductVO> list_Pro(Map<String, String>map) throws Exception {
	return session.selectList(namespace+".listProduct", map);
	}
	
	
	@Override
	public int Count_Pro() throws Exception {
		return session.selectOne(namespace+".countProduct");
	}

	@Override
	public ProductVO detail_pro(String product_no) throws Exception {
		return session.selectOne(namespace+".detailProduct", product_no);
	}

	@Override
	public void delete_pro(String product_no) throws Exception {
		session.delete(namespace+".deleteProduct", product_no);

	}

	

}
