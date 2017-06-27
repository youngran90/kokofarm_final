package kokofarm.orderproduct.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.member.domain.MemberVO;
import kokofarm.orderproduct.domain.OrderFinishVO;
import kokofarm.orderproduct.domain.OrderFinish_Payment_Info;
import kokofarm.orderproduct.domain.OrderProductListVO;
import kokofarm.orderproduct.domain.OrderProductVO;

@Repository
public class OrderProductImpl implements OrderProductDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "kokofarm.orderproduct.mapper.OrderProductMapper";

	@Override
	public void order_insert(OrderProductVO data) throws Exception {
		session.insert(namespace + ".order_insert", data);
	}

	@Override
	public List<OrderProductListVO> order_list(String member_id) throws Exception {
		return session.selectList(namespace + ".order_list", member_id);
	}

	@Override
	public void order_update(OrderProductVO data) throws Exception {
		session.update(namespace + ".order_update", data);
	}

	@Override
	public MemberVO member_info(String member_id) throws Exception {
		return session.selectOne(namespace + ".member_info", member_id);
	}

	@Override
	public void orderfinish_insert(OrderFinishVO vo) throws Exception {
		session.insert(namespace + ".orderfinish_insert", vo);
	}

	@Override
	public void payment_insert(OrderFinish_Payment_Info info) throws Exception {
		session.insert(namespace + ".payment_insert", info);
	}

	@Override
	public List<Integer> total_price(String orderfinish_no) throws Exception {
		return session.selectList(namespace + ".total_price", orderfinish_no);
	}

	@Override
	public void product_update(int orderfinish_product_amount, String orderfinish_product_no) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orderfinish_product_amount", orderfinish_product_amount);
		map.put("orderfinish_product_no", orderfinish_product_no);

		session.update(namespace + ".product_update", map);
	}

	@Override
	public List<String> orderfinish_no(String orderfinish_no) throws Exception {
		return session.selectList(namespace+".orderfinish_no", orderfinish_no);
	}

	@Override
	public void cart_delete(String member_id) throws Exception {
		session.delete(namespace+".cart_delete",member_id);
	}

	@Override
	public void orderproduct_delete(String member_id) throws Exception {
		session.delete(namespace+".orderproduct_delete",member_id);
	}

	@Override
	public void orderproduct_delete_all(HashMap<String, String> product_no) throws Exception {
		session.delete(namespace+".orderproduct_delete_all", product_no);
	}

	@Override
	public void delete(String product_no) throws Exception {
		session.delete(namespace+".delete",product_no);
		
	}


	
}
