package kokofarm.cart.persistence;

import java.util.List;
import kokofarm.cart.domain.CartDTO;
import kokofarm.cart.domain.CartListDTO;

public interface CartDAO {
	//public void cart_insert(CartDTO cart) throws Exception;
	public List<CartListDTO> cart_list(String member_id) throws Exception;
	/*public void cart_delete(CartDTO cart_delete) throws Exception;
	public void cart_delte_all(CartDTO cart_delte_all) throws Exception;
	public void cart_update(CartDTO cart) throws Exception;*/
}
