package kokofarm.orderproduct.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.orderproduct.domain.MileageListVO;
import kokofarm.orderproduct.domain.MileageVO;

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
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_point", mileage_total);
		map.put("member_id", member_id);
		
		session.update(namespace+".milage_update",map);
	}

	@Override
	public void update(int mileage_current, String member_id) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mileage_current", mileage_current);
		map.put("mileage_member_id", member_id);
		
		session.update(namespace+".update",map);
	}

	@Override
	public List<MileageListVO> mileage_view(String member_id) throws Exception {
		return session.selectList(namespace+".mileage_view", member_id);
	}

	
	
}
