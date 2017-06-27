package kokofarm.orderproduct.service;

import java.util.HashMap;
import java.util.List;

import kokofarm.member.domain.MemberVO;
import kokofarm.orderproduct.domain.OrderFinishVO;
import kokofarm.orderproduct.domain.OrderFinish_Payment_Info;
import kokofarm.orderproduct.domain.OrderProductListVO;
import kokofarm.orderproduct.domain.OrderProductVO;

public interface OrderProductService {
	public void order_insert(OrderProductVO data) throws Exception;

	public List<OrderProductListVO> order_list(String member_id) throws Exception;

	public void order_update(OrderProductVO data) throws Exception;

	public MemberVO member_info(String member_id) throws Exception;

	public void orderfinish_insert(OrderFinishVO vo) throws Exception;

	public void payment_insert(OrderFinish_Payment_Info info) throws Exception;

	public void product_update(int orderfinish_product_amount, String orderfinish_product_no) throws Exception;

	public List<String> orderfinish_no(String orderfinish_no) throws Exception;
	
	public void delete(String product_no) throws Exception;
	
	public void orderproduct_delete_all(HashMap<String, String> product_no) throws Exception;

}
