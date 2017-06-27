package kokofarm.cart.persistence;

import java.util.HashMap;
import java.util.List;

import kokofarm.cart.domain.CartListVO;
import kokofarm.cart.domain.CartVO;

public interface CartDAO {
	public void cart_insert(CartVO vo) throws Exception;
	public List<CartListVO> cart_list(String member_id) throws Exception;
	public void delete(String product_no) throws Exception;
	public void cart_delete_all(HashMap<String, String> product_no) throws Exception;
	public void cart_update(CartVO vo) throws Exception;
}
