package kokofarm.orderproduct.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.orderproduct.domain.MileageVO;
import kokofarm.orderproduct.persistence.MileageDAO;
import kokofarm.orderproduct.persistence.OrderProductDAO;
import kokofarm.orderproduct.persistence.OrderProductImpl;

@Service
public class MileageServiceImpl implements MileageService {

	@Inject
	private MileageDAO dao;

	@Inject
	private OrderProductDAO op_dao;

	@Override
	public void insert_mileage(MileageVO vo) throws Exception {
		String orderfinish_no = vo.getOrderfinish_no();
		List<Integer> list = total_price(orderfinish_no);
		
		int current = mileage_current(vo.getMember_id());
		int c_mileage = current - vo.getMileage_use(); //현재에서 사용되는거 차감
		
		for(int i=0; i<list.size(); i++){
			int total = list.get(i);
			int mileage = (int) Math.ceil(total * 0.1); // 전체 금액에서  0.1 적립
			int mileage_total = mileage+c_mileage;  // 수정된 현재 + 마일리지
			vo.setMileage_saving(mileage); // 적립 내역
			vo.setMileage_total(mileage_total); // 수정후
			System.out.println(vo.toString()+" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			dao.insert_mileage(vo);
			
			milage_update(mileage_total, vo.getMember_id());
			update(mileage_total, vo.getMember_id());
		}
	}

	@Override
	public List<Integer> total_price(String orderfinish_no) throws Exception {
		return op_dao.total_price(orderfinish_no);
	}

	@Override
	public int mileage_current(String member_id) throws Exception {
		return dao.mileage_current(member_id);
	}

	@Override
	public void milage_update(int mileage_total, String member_id) throws Exception {
		dao.milage_update(mileage_total, member_id);
	}

	@Override
	public void update(int mileage_current, String member_id) throws Exception {
		dao.update(mileage_current, member_id);
	}
	
	

}
