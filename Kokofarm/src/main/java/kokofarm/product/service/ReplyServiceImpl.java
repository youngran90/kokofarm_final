package kokofarm.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.product.domain.ReplyVO;
import kokofarm.product.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO dao;

	@Override
	public void Insert_Post(ReplyVO post) throws Exception {
		dao.Insert_Po(post);
	}

	@Override
	public List<ReplyVO> list_Post(String product_no) throws Exception {
		return dao.list_Po(product_no);
	}

	@Override
	public void delete_Post(String post_no) throws Exception {
		dao.delete_Po(post_no);
	}

	@Override
	public void update_Post(ReplyVO post) throws Exception {
		dao.update_Po(post);
	}

	
	
	
}
