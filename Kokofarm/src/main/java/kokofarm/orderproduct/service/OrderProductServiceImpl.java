package kokofarm.orderproduct.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kokofarm.member.domain.MemberVO;
import kokofarm.orderproduct.domain.OrderFinishVO;
import kokofarm.orderproduct.domain.OrderFinish_Payment_Info;
import kokofarm.orderproduct.domain.OrderProductListVO;
import kokofarm.orderproduct.domain.OrderProductVO;
import kokofarm.orderproduct.persistence.OrderProductDAO;

@Service
public class OrderProductServiceImpl implements OrderProductService {

	@Inject
	private OrderProductDAO dao;

	@Override
	public void order_insert(OrderProductVO data) throws Exception {
		
		List<OrderProductListVO> list = dao.order_list(data.getMember_id()); // 저장
		
		int count = 0;
		if (list.size() == 0) {
			dao.order_insert(data);
		} else {
			Loop: for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getProduct_no().contains(data.getProduct_no())) {
					count++;
					break Loop;
				}
			}
			if (count != 0) {
				order_update(data);
				count = 0;
			} else if (count == 0) {// 아닐시
				dao.order_insert(data);
			}
		}

	}

	@Override
	public List<OrderProductListVO> order_list(String member_id) throws Exception {
		return dao.order_list(member_id);
	}

	@Override
	public void order_update(OrderProductVO data) throws Exception {
		
		List<OrderProductListVO> list = dao.order_list(data.getMember_id()); //결제 테이블 리스트
		
		int total_price = Integer.parseInt(data.getOrder_total_price()); // 최종금액
		int delivery_price = Integer.parseInt(data.getOrder_delivery_price()); // 배달금액

		
		for (int i = 0; i < list.size(); i++) {

			String product_no = list.get(i).getProduct_no();
			
			if (list.get(i).getProduct_no().contains(data.getProduct_no())) {
				
				if ((total_price + Integer.parseInt(list.get(i).getOrder_total_price())) >= 50000) {
					data.setOrder_delivery_price("0");
					System.out.println("2");
					dao.order_update(data);
				} else {
					System.out.println("3");
					dao.order_update(data);
				}
			}
		}

	}

	@Override
	public MemberVO member_info(String member_id) throws Exception {
		return dao.member_info(member_id);
	}
	
	@Override
	public void payment_insert(OrderFinish_Payment_Info info) throws Exception {
		dao.payment_insert(info);
	}
	
	@Transactional
	@Override
	public void orderfinish_insert(OrderFinishVO vo) throws Exception {
		dao.orderfinish_insert(vo);
		dao.cart_delete(vo.getOrderfinish_member_id());
		dao.orderproduct_delete(vo.getOrderfinish_member_id());
	}

	@Override
	public void product_update(int orderfinish_product_amount, String orderfinish_product_no) throws Exception {
		dao.product_update(orderfinish_product_amount, orderfinish_product_no);
	}

	@Override
	public List<String> orderfinish_no(String orderfinish_no) throws Exception {
		return dao.orderfinish_no(orderfinish_no);
	}

	@Override
	public void delete(String product_no) throws Exception {
		dao.delete(product_no);
	}

	
	
	
}
