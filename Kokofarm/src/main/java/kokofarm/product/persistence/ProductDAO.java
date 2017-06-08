package kokofarm.product.persistence;

import java.util.List;
import java.util.Map;

import kokofarm.product.domain.ProductVO;

public interface ProductDAO {
	
	public void insert_Pro(ProductVO vo)throws Exception;
	
	//전체출력
	public List<ProductVO> list_Pro(Map<String, String>map)throws Exception;
	
	public int Count_Pro()throws Exception;
	
	public ProductVO detail_pro(String product_no)throws Exception;
	
    public void delete_pro(String product_no)throws Exception;
    
	
	
}
