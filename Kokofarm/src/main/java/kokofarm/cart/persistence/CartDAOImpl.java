package kokofarm.cart.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.cart.domain.CartVO;
import kokofarm.cart.domain.CartListVO;

@Repository
public class CartDAOImpl implements CartDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "kokofarm.cart.mapper.CartMapper";

/*
	@Override
	public void cart_insert(CartDTO cart) throws Exception {
		session.insert(namespace+".cart_insert",cart);
	}
*/
/*	@Override
	public List<CartListDTO> cart_list(String member_id) throws Exception {
		return session.selectList(namespace+".cart_list", member_id);
	}*/

	/*@Override
	public void cart_delete(CartDTO cart_delete) throws Exception {
		session.delete(namespace+".cart_delete",cart_delete);
	}

	@Override
	public void cart_delte_all(CartDTO cart_delte_all) throws Exception {
		session.delete(namespace+".cart_delte_all",cart_delte_all);
	}

	@Override
	public void cart_update(CartDTO cart) throws Exception {
		session.update(namespace+".cart_update", cart);
	}*/
	
	

}
