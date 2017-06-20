package kokofarm.center.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.center.domain.CenterVO;

@Repository
public class CenterDAOImpl implements CenterDAO {
	
	@Inject
	private SqlSession session; 
	
	private static final String namespace = "kokofarm.center.mapper.centerMapper";

	@Override
	public void create(CenterVO vo) throws Exception {
		session.insert(namespace+".create", vo);

	}

	@Override
	public List<CenterVO> list() throws Exception {
		return session.selectList(namespace+".list");
	}

}
