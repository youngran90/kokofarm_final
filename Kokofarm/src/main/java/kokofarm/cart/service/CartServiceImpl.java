package kokofarm.cart.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.cart.domain.CartListVO;
import kokofarm.cart.domain.CartVO;
import kokofarm.cart.persistence.CartDAO;
import kokofarm.orderproduct.domain.OrderProductListVO;

@Service
public class CartServiceImpl implements CartService{

	@Inject
	private CartDAO dao;

	@Override
	public void cart_insert(CartVO vo) throws Exception {
		List<CartListVO> list = dao.cart_list(vo.getMember_id()); // 저장 정보
		
		int count=0;
		
		if( list.size() == 0 ){
			dao.cart_insert(vo);
		}else{
			Loop: for(int i=0; i<list.size(); i++){
				if(list.get(i).getProduct_no().contains(vo.getProduct_no())){
					count++;
					break Loop;
				}
			}
			if(count != 0){
				cart_update(vo);
				count = 0;
			}else if(count == 0){//아닐시
				dao.cart_insert(vo);
			}
		}
		
		
	}
	

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


	@Override
	public void cart_update(CartVO vo) throws Exception {
		dao.cart_update(vo);
	}
	
	
}
