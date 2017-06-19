package kokofarm.orderproduct.service;

import java.util.HashMap;
import java.util.List;

import kokofarm.orderproduct.domain.MileageListVO;
import kokofarm.orderproduct.domain.MileageVO;

public interface MileageService {
	public void insert_mileage(MileageVO vo) throws Exception;
	
	public List<Integer> total_price(String orderfinish_no) throws Exception;
	
	public int mileage_current(String member_id) throws Exception;
	
	public void milage_update(int mileage_total, String member_id) throws Exception;
	
	public void update(int mileage_current, String member_id) throws Exception;
	
	public List<MileageListVO> mileage_view(String member_id) throws Exception;
}
