package kokofarm.cart.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.cart.domain.CartListVO;
import kokofarm.cart.domain.CartVO;

@Repository
public class CartDAOImpl implements CartDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "kokofarm.cart.mapper.CartMapper";


	@Override
	public void cart_insert(CartVO vo) throws Exception {
		session.insert(namespace+".cart_insert",vo);
	}

	@Override //장바구니 출력
	public List<CartListVO> cart_list(String member_id) throws Exception {
		return session.selectList(namespace+".cart_list", member_id);
	}

	@Override // 제품 하나 삭제
	public void delete(String product_no) throws Exception {
		session.delete(namespace+".delete",product_no);
	}

	@Override
	public void cart_delte_all(HashMap<String, String> product_no) throws Exception {
		session.delete(namespace+".cart_delte_all",product_no);
	}

	@Override
	public void cart_update(CartVO vo) throws Exception {
		session.update(namespace+".cart_update", vo);
	}
	
	

}
