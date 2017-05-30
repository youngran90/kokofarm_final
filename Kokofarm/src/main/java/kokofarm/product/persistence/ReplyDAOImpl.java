package kokofarm.product.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.product.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace 
		="kokofarm.mapper.ReplyMapper";

	@Override
	public void Insert_Po(ReplyVO vo) throws Exception {
		session.insert(namespace+".InsertPost", vo);

	}

	@Override
	public List<ReplyVO> list_Po(String product_no) throws Exception {
		return session.selectList(namespace+".listPost", product_no);
	}

	@Override
	public void delete_Po(String post_no) throws Exception {
		session.delete(namespace+".deletePost", post_no);
	}

	@Override
	public void update_Po(ReplyVO vo) throws Exception {
		session.update(namespace+".updatePost", vo);
	}

}
