package kokofarm.orderproduct.persistence;

import java.util.List;

import kokofarm.orderproduct.domain.OrderProductData;

public interface OrderProductDAO {
	public void order_insert(OrderProductData data) throws Exception;
	public List<OrderProductData> order_list(String member_id) throws Exception;
}
