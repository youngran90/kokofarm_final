package kokofarm.mypage.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.mypage.domain.graphVO;

@Repository
public class GraphDAOImpl implements GraphDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace 
		="kokofarm.mappers.graphMapper";
	
	@Override
	public List<graphVO> v_product_no() throws Exception {
		return session.selectList(namespace+".v_product_no") ;
	}

	@Override
	public List<graphVO> sum_graph(String member_id) throws Exception {
		return session.selectList(namespace+".sum_graph", member_id);
	}
}
