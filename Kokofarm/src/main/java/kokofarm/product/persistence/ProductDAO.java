package kokofarm.product.persistence;

import java.util.List;

import kokofarm.product.domain.ProductVO;

public interface ProductDAO {
	
	public void insert_Pro(ProductVO vo)throws Exception;
	
	public List<ProductVO> list_Pro()throws Exception;
	
	public int Count_Pro()throws Exception;
	
	public ProductVO detail_pro(String product_no)throws Exception;
	
    public void delete_pro(String product_no)throws Exception;
    
	
	
}
