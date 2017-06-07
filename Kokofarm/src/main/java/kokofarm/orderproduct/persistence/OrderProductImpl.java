package kokofarm.orderproduct.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.orderproduct.domain.OrderProductData;

@Repository
public class OrderProductImpl implements OrderProductDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "kokofarm.orderproduct.mapper.OrderProductMapper";

	@Override
	public void order_insert(OrderProductData data) throws Exception {
		session.insert(namespace+".order_insert", data);
		
	}

	@Override
	public List<OrderProductData> order_list(String member_id) throws Exception {
		return session.selectList(namespace+".order_list", member_id);
	}
	
	
}
