package kokofarm.product.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.product.domain.ReplyVO;
import kokofarm.mypage.domain.graphVO;
import kokofarm.product.domain.PagingMaker;
import kokofarm.product.domain.ProductListForm;
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
	public List<ProductVO> list_Pro(PagingMaker ProductForm) throws Exception {
	return session.selectList(namespace+".listProduct", ProductForm);
	}
	
	
	@Override
	public int Count_Pro(PagingMaker PagingMaker) throws Exception {
		return session.selectOne(namespace+".countProduct", PagingMaker);
	}

	@Override
	public ProductVO detail_pro(String product_no) throws Exception {
		return session.selectOne(namespace+".detailProduct", product_no);
	}

	@Override
	public void delete_pro(String product_no) throws Exception {
		session.update(namespace+".deleteProduct", product_no);

	}

	@Override
	public void view_count(String product_no) throws Exception {
		session.update(namespace+".viewProduct", product_no);
	}

	@Override
	public int countReply(String product_no) throws Exception {
		return session.selectOne(namespace+".countReply", product_no);
	}

	@Override
	public void update_reply_count(String product_no, int amount) throws Exception {
		Map<String, Object>map = new HashMap<>();
		map.put("product_no", product_no);
		map.put("amount", amount);
		session.update(namespace+".update_reply_count", map);
	}

	@Override
	public List<ProductVO> product_register_list(String member_id, PagingMaker PagingMaker) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("PagingMaker", PagingMaker);
		return session.selectList(namespace+".product_register_list", map);
	}

	@Override
	public int countProduct_list(String member_id) throws Exception {
		return session.selectOne(namespace+".countProduct_list", member_id);
	}
	

}
