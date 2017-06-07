package kokofarm.orderproduct.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.orderproduct.domain.OrderProductData;
import kokofarm.orderproduct.persistence.OrderProductDAO;


@Service
public class OrderProductServiceImpl implements OrderProductService {

	@Inject
	private OrderProductDAO dao;

	@Override
	public void order_insert(OrderProductData data) throws Exception {
		dao.order_insert(data);
	}

	@Override
	public List<OrderProductData> order_list(String member_id) throws Exception {
		return dao.order_list(member_id);
	}
	
	
	
	
}
