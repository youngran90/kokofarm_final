package kokofarm.product.service;

import java.util.List;

import kokofarm.product.domain.ReplyVO;

public interface ReplyService {

	
	//post
	public void Insert_Post(ReplyVO vo)throws Exception;
	
	public List<ReplyVO> list_Post(String product_no)throws Exception;
	
	public void delete_Post(String reply_no)throws Exception;
	
	public void update_Post(ReplyVO vo)throws Exception;
}
