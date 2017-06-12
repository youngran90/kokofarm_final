package kokofarm.product.persistence;

import java.util.List;

import kokofarm.product.domain.ReplyVO;

public interface ReplyDAO {

	//post
		public void Insert_Po(ReplyVO vo)throws Exception;
		
		public List<ReplyVO> list_Po(String product_no)throws Exception;
		
		public void delete_Po(String reply_no)throws Exception;
		
		public void update_Po(ReplyVO vo)throws Exception;
		
		public int countReply(String product_no)throws Exception;
		
		public String get_product_no(String reply_no)throws Exception;
}
