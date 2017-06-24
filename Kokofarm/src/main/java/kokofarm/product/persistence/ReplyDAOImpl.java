package kokofarm.product.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.product.domain.PagingMaker;
import kokofarm.product.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace 
		="kokofarm.mapper.ReplyMapper";

	@Override
	public void Insert_Po(ReplyVO vo) throws Exception {
		session.insert(namespace+".InsertReply", vo);

	}

	@Override
	public List<ReplyVO> list_Po(String product_no, PagingMaker pagingMaker) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product_no", product_no);
		map.put("PagingMaker", pagingMaker);
		System.out.println("pno : "+ product_no);
		System.out.println("paging : "+ pagingMaker.toString());
		return session.selectList(namespace+".listReply", map);
	}

	@Override
	public void delete_Po(String reply_no) throws Exception {
		session.delete(namespace+".deleteReply", reply_no);
	}

	@Override
	public void update_Po(ReplyVO vo) throws Exception {
		session.update(namespace+".updateReply", vo);
	}

	@Override
	public int countReply(String product_no) throws Exception {
		return session.selectOne(namespace+".countReply", product_no);
	}

	@Override
	public String get_product_no(String reply_no) throws Exception {
		return session.selectOne(namespace+".getProduct_no", reply_no);
	}

	@Override
	public int avgReply(String product_no) throws Exception {
		return session.selectOne(namespace+".avgReply", product_no);
	}


}
