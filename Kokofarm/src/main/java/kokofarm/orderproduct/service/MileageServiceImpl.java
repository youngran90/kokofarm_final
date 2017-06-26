package kokofarm.orderproduct.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.orderproduct.domain.MileageListVO;
import kokofarm.orderproduct.domain.MileageVO;
import kokofarm.orderproduct.domain.OrderFinish_DetailVO;
import kokofarm.orderproduct.persistence.MileageDAO;
import kokofarm.orderproduct.persistence.OrderProductDAO;
import kokofarm.product.domain.PagingMaker;

@Service
public class MileageServiceImpl implements MileageService {

	@Inject
	private MileageDAO dao;

	@Inject
	private OrderProductDAO op_dao;

	@Override
	public void insert_mileage(MileageVO vo) throws Exception {
		String orderfinish_no = vo.getOrderfinish_no();
		List<Integer> list = total_price(orderfinish_no); // 해당하는 주문내역의 최종금액을 가져온다.
		
		if(vo.getMileage_use() == 0){ //사용하는 마일리지가 없다면 적립되게
			//현재 마일리지에서 최종금액의 0.1 마일리지를 더한다 그리고... 다시 업데이트 시킨다.
			int current = mileage_current(vo.getMember_id()); //현재 마일리지 
			
			for(int i=0; i<list.size(); i++){
				int total = list.get(i);
				int mileage = (int) Math.ceil(total * 0.01); // 전체 금액에서  0.01 적립
				int mileage_total = mileage+current;  // 수정된 현재 + 마일리지
				vo.setMileage_saving(mileage); // 적립 내역
				vo.setMileage_total(mileage_total); // 수정후 총 마일리지
				
				dao.insert_mileage(vo); //마일리지 테이블에 더한다.
				
				milage_update(mileage_total, vo.getMember_id()); // 회원 마일리지에 변동사항을 업데이트 해준다.
				update(mileage_total, vo.getMember_id()); // 마일리지테이블 현재 마일리지 컬럼도 업에트 해준다. 
			}
		}else{ // 사용하는 마일리지가 있다면.. 적립 안됨.
			int current = mileage_current(vo.getMember_id()); //현재 마일리지 
			
			int c_mileage = current - vo.getMileage_use(); //현재에서 사용되는거 차감
			
			vo.setMileage_total(c_mileage); // 수정후 총 마일리지
			
			dao.insert_mileage(vo); //마일리지 테이블에 더한다.
			
			milage_update(c_mileage, vo.getMember_id()); // 회원 마일리지에 변동사항을 업데이트 해준다.
			update(c_mileage, vo.getMember_id()); // 마일리지테이블 현재 마일리지 컬럼도 업에트 해준다. 
			
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

	@Override
	public List<MileageListVO> mileage_view(String member_id,PagingMaker pagingMaker) throws Exception {
		return dao.mileage_view(member_id,pagingMaker);
	}

	@Override
	public int mileagecount(String member_id) throws Exception {
		return dao.mileagecount(member_id);
	}

	@Override
	public List<MileageListVO> mileage_search_view(String member_id, PagingMaker pagingMaker, String start, String end) throws Exception {
		return dao.mileage_search_view(member_id, pagingMaker, start, end);
	}

	@Override
	public int mileage_search_count(String member_id, String start, String end) throws Exception {
		return dao.mileage_search_count(member_id, start, end);
	}

	@Override
	public List<OrderFinish_DetailVO> orderproduct_detail(String orderfinish_no) throws Exception {
		return dao.orderproduct_detail(orderfinish_no);
	}

	@Override
	public List<String> detail_payment(String orderfinish_no) throws Exception {
		return dao.detail_payment(orderfinish_no);
	}

	@Override
	public int detail_mileage(String orderfinish_no) throws Exception {
		return dao.detail_mileage(orderfinish_no);
	}


	
	
	
	

}
