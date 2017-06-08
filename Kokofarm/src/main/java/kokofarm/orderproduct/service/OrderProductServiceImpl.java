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
		List<OrderProductData> list = dao.order_list(data.getMember_id()); // 저장 정보
		int count=0;
		
		if( list.size() == 0 ){
			dao.order_insert(data);
		}else{
			Loop: for(int i=0; i<list.size(); i++){
				if(list.get(i).getProduct_no().contains(data.getProduct_no())){
					count++;
					break Loop;
				}
			}
			if(count != 0){
				order_update(data);
				count = 0;
			}else if(count == 0){//아닐시
				dao.order_insert(data);
			}
		}
		
	}

	@Override
	public List<OrderProductData> order_list(String member_id) throws Exception {
		return dao.order_list(member_id);
	}

	@Override
	public void order_update(OrderProductData data) throws Exception {
		dao.order_update(data);
	}

	@Override
	public int member_point(String member_id) throws Exception {
		return dao.member_point(member_id);
	}
	
	
	
	
}
