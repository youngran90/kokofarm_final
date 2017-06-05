package kokofarm.product.service;

import java.util.List;
import java.util.UUID;

import kokofarm.product.domain.ProductVO;

public interface ProductService {

	public void insert_product(ProductVO product)throws Exception;
	
	public List<ProductVO>list_product()throws Exception;
	
	public int Count_Product()throws Exception;
	
	public ProductVO detail_product(String product_no)throws Exception;
	
    public void delete_product(String product_no)throws Exception;
    
    public String create_UUID() throws Exception;

}
