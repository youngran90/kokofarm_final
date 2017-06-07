package kokofarm.cart.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.cart.domain.CartListVO;
import kokofarm.cart.persistence.CartDAO;

@Service
public class CartServiceImpl implements CartService{

	@Inject
	private CartDAO dao;

	/*@Override
	public void cart_insert(CartDTO cart) throws Exception {
		dao.cart_insert(cart);
	}*/

	@Override
	public List<CartListVO> cart_list(String member_id) throws Exception {
		return dao.cart_list(member_id);
	}

	@Override
	public void cart_delete(String product_no) throws Exception {
		dao.delete(product_no);
	}
	
	@Override
	public void cart_delte_all(HashMap<String, String> product_no) throws Exception {
		dao.cart_delte_all(product_no);
	}


/*@Override
	public void cart_update(CartDTO cart) throws Exception {
		dao.cart_update(cart);
	}*/
	
	
}
