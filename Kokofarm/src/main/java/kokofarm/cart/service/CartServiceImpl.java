package kokofarm.cart.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.cart.domain.CartVO;
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
/*
	@Override
	public List<CartListDTO> cart_list(String member_id) throws Exception {
		return dao.cart_list(member_id);
	}*/

	/*@Override
	public void cart_delete(CartDTO cart_delete) throws Exception {
		dao.cart_delete(cart_delete);
	}

	@Override
	public void cart_delte_all(CartDTO cart_delte_all) throws Exception {
		dao.cart_delte_all(cart_delte_all);
	}

	@Override
	public void cart_update(CartDTO cart) throws Exception {
		dao.cart_update(cart);
	}*/
	
	
}
