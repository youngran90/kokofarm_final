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
	public void Insert_Post(ReplyVO reply) throws Exception {
		dao.Insert_Po(reply);
	}

	@Override
	public List<ReplyVO> list_Post(String product_no) throws Exception {
		return dao.list_Po(product_no);
	}

	@Override
	public void delete_Post(String reply_no) throws Exception {
		dao.delete_Po(reply_no);
	}

	@Override
	public void update_Post(ReplyVO reply) throws Exception {
		dao.update_Po(reply);
	}

	
	
	
}
