package kokofarm.orderproduct.service;

import java.util.List;

import kokofarm.orderproduct.domain.MileageListVO;
import kokofarm.orderproduct.domain.MileageVO;
import kokofarm.orderproduct.domain.OrderFinish_DetailVO;
import kokofarm.product.domain.PagingMaker;

public interface MileageService {
	public void insert_mileage(MileageVO vo) throws Exception;
	
	public List<Integer> total_price(String orderfinish_no) throws Exception;
	
	public int mileage_current(String member_id) throws Exception;
	
	public void milage_update(int mileage_total, String member_id) throws Exception;
	
	public void update(int mileage_current, String member_id) throws Exception;
	
	public List<MileageListVO> mileage_view(String member_id, PagingMaker pagingMaker) throws Exception;
	
	public int mileagecount(String member_id) throws Exception;
	
	public List<MileageListVO> mileage_search_view(String member_id, PagingMaker pagingMaker, String start, String end) throws Exception;
	
	public int mileage_search_count(String member_id, String start, String end) throws Exception;
	
	public List<OrderFinish_DetailVO> orderproduct_detail(String orderfinish_no) throws Exception;
	
	public List<String> detail_payment(String orderfinish_no) throws Exception;
	
	public int detail_mileage(String orderfinish_no) throws Exception;
	
}
