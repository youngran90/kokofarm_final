package kokofarm.product.service;

import java.util.List;

import kokofarm.product.domain.PagingMaker;
import kokofarm.product.domain.ReplyVO;

public interface ReplyService {

	
	//post
	public void Insert_Post(ReplyVO vo)throws Exception;
	
	public List<ReplyVO> list_Post(String product_no, PagingMaker pagingMaker)throws Exception;
	
	public void delete_Post(String reply_no, String product_no)throws Exception;
	
	public void update_Post(ReplyVO vo)throws Exception;
	
	public int countReply(String product_no)throws Exception;
	
	public int avgReply(String product_no)throws Exception;
}
