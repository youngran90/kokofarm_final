package kokofarm.orderproduct.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.orderproduct.domain.MileageListVO;
import kokofarm.orderproduct.domain.MileageVO;
import kokofarm.orderproduct.domain.OrderFinish_DetailVO;
import kokofarm.product.domain.PagingMaker;

@Repository
public class MileageDAOImpl implements MileageDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "kokofarm.mileage.mapper.MileageMapper";

	@Override
	public void insert_mileage(MileageVO vo) throws Exception {
		session.insert(namespace + ".insert_mileage", vo);
	}

	@Override
	public int mileage_current(String member_id) throws Exception {
		return session.selectOne(namespace+".mileage_current", member_id);
	}

	@Override
	public void milage_update(int mileage_total, String member_id) throws Exception {
		System.out.println(mileage_total);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_point", mileage_total);
		map.put("member_id", member_id);
		
		session.update(namespace+".milage_update",map);
	}

	/*@Override
	public void update(int mileage_current, String member_id) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mileage_current", mileage_current);
		map.put("mileage_member_id", member_id);
		
		session.update(namespace+".update",map);
	}*/

	
	
	// 마일리지 내역 
	@Override
	public List<MileageListVO> mileage_view(String member_id,PagingMaker pagingMaker) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("PagingMaker", pagingMaker);
		return session.selectList(namespace+".mileage_view", map);
	}

	@Override
	public int mileagecount(String member_id) throws Exception {
		return session.selectOne(namespace+".mileagecount", member_id);
	}

	@Override
	public List<MileageListVO> mileage_search_view(String member_id, PagingMaker pagingMaker, String start, String end) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("PagingMaker", pagingMaker);
		map.put("start_time", start);
		map.put("end_time", end);
		return session.selectList(namespace+".mileage_search_view",map);
	}

	@Override
	public int mileage_search_count(String member_id, String start, String end) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("start_time", start);
		map.put("end_time", end);
		return session.selectOne(namespace+".mileage_search_count", map);
	}

	@Override
	public List<OrderFinish_DetailVO> orderproduct_detail(String orderfinish_no) throws Exception {
		return session.selectList(namespace+".orderproduct_detail", orderfinish_no);
	}

	@Override
	public List<String> detail_payment(String orderfinish_no) throws Exception {
		return session.selectList(namespace+".detail_payment",orderfinish_no);
	}

	@Override
	public int detail_mileage(String orderfinish_no) throws Exception {
		return session.selectOne(namespace+".detail_mileage",orderfinish_no);
	}

	
}
