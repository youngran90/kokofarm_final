package kokofarm.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kokofarm.product.domain.PagingMaker;
import kokofarm.product.domain.ReplyVO;
import kokofarm.product.persistence.ProductDAO;
import kokofarm.product.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO dao;
	
	@Inject
	private ProductDAO product_dao;

	@Transactional
	@Override
	public void Insert_Post(ReplyVO reply) throws Exception {
		dao.Insert_Po(reply);
		product_dao.update_reply_count(reply.getProduct_no(), 1);
	}

	@Override
	public List<ReplyVO> list_Post(String product_no, PagingMaker pagingMaker) throws Exception {
		return dao.list_Po(product_no, pagingMaker);
	}

	@Transactional
	@Override
	public void delete_Post(String reply_no, String product_no) throws Exception {
		dao.delete_Po(reply_no);
		product_dao.update_reply_count(product_no, -1);
	}

	@Override
	public void update_Post(ReplyVO reply) throws Exception {
		dao.update_Po(reply);
	}

	@Override
	public int countReply(String product_no) throws Exception {
		return dao.countReply(product_no);
	}

	@Override
	public int avgReply(String product_no) throws Exception {
		return dao.avgReply(product_no);
	}

	
	
	
}
