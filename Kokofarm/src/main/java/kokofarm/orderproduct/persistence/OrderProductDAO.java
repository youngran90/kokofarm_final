package kokofarm.orderproduct.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kokofarm.member.domain.MemberVO;
import kokofarm.orderproduct.domain.OrderFinishVO;
import kokofarm.orderproduct.domain.OrderFinish_Payment_Info;
import kokofarm.orderproduct.domain.OrderProductListVO;
import kokofarm.orderproduct.domain.OrderProductVO;

public interface OrderProductDAO {
	public void order_insert(OrderProductVO data) throws Exception;

	public List<OrderProductListVO> order_list(String member_id) throws Exception;

	public void order_update(OrderProductVO data) throws Exception;

	public MemberVO member_info(String member_id) throws Exception;

	public void orderfinish_insert(OrderFinishVO vo) throws Exception;

	public void payment_insert(OrderFinish_Payment_Info info) throws Exception;
	
	public List<Integer> total_price(String orderfinish_no) throws Exception;
	
	public void product_update(int orderfinish_product_amount, String orderfinish_product_no) throws Exception;
	
	public List<String> orderfinish_no(String orderfinish_no) throws Exception;
	
	public void cart_delete(String member_id) throws Exception;
	
	public void orderproduct_delete(String member_id) throws Exception;
	
	public void delete(String product_no) throws Exception;
	
}
