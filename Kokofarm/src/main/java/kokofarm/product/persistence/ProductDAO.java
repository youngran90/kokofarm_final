package kokofarm.product.persistence;

import java.util.List;
import java.util.Map;

import kokofarm.basic.domain.Criteria;
import kokofarm.mypage.domain.graphVO;
import kokofarm.product.domain.PagingMaker;
import kokofarm.product.domain.ProductListForm;
import kokofarm.product.domain.ProductVO;

public interface ProductDAO {
	
	public void insert_Pro(ProductVO vo)throws Exception;
	
	//전체출력
	public List<ProductVO> list_Pro(PagingMaker ProductForm)throws Exception;
	
	public int Count_Pro(PagingMaker PagingMaker)throws Exception;
	
	public ProductVO detail_pro(String product_no)throws Exception;
	
    public void delete_pro(String product_no)throws Exception;

    //조회수
    public void view_count(String product_no)throws Exception;
    
    //댓글수 조회
	public int countReply(String product_no)throws Exception;

	//댓글수 수정
	public void update_reply_count(String product_no, int amount)throws Exception;
	
	
}
