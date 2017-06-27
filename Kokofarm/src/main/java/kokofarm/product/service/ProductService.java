package kokofarm.product.service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import kokofarm.mypage.domain.graphVO;
import kokofarm.product.domain.PagingMaker;
import kokofarm.product.domain.ProductListForm;
import kokofarm.product.domain.ProductVO;

public interface ProductService {

	public void insert_product(ProductVO product)throws Exception;
	
	public List<ProductVO> list_product(PagingMaker ProductForm)throws Exception;
		
	public int Count_Product(PagingMaker PagingMaker)throws Exception;
	
	public ProductVO detail_product(String product_no)throws Exception;
	
    public void delete_product(String product_no)throws Exception;
    
    public String create_UUID() throws Exception;
    
    //public void view_count(String product_no)throws Exception;

    public List<ProductVO>product_register_list(String member_id, PagingMaker PagingMaker)throws Exception;

    public int countProduct_list(String member_id)throws Exception;
}
