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
	public List<CenterVO> list_notice() throws Exception {
		return session.selectList(namespace+".list_notice");
	}

	@Override
	public List<CenterVO> list_faq() throws Exception {
		return session.selectList(namespace+".list_faq");
	}

	@Override
	public CenterVO detail_notice(int cno) throws Exception {
		return session.selectOne(namespace+".detail_notice", cno);
	}

	@Override
	public CenterVO detail_faq(int cno) throws Exception {
		return session.selectOne(namespace+".detail_faq", cno);
	}
	
	@Override
	public void delete_notice(int cno) throws Exception {
		session.delete(namespace+".delete_notice", cno);
	}

	@Override
	public void delete_faq(int cno) throws Exception {
		session.delete(namespace+".delete_faq", cno);
	}

	@Override
	public void update_viewcnt(int cno) throws Exception {
		session.update(namespace+".update_viewcnt", cno);
		
	}



}
