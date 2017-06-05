package kokofarm.product.service;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.product.domain.ProductVO;
import kokofarm.product.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	private ProductDAO dao;

	@Override
	public void insert_product(ProductVO product) throws Exception {
	/*	String uuid = create_UUID();
		product.setProduct_no("P-"+uuid);*/
		dao.insert_Pro(product);
	}

	@Override
	public List<ProductVO> list_product() throws Exception {
		return dao.list_Pro();
	}

	@Override
	public int Count_Product() throws Exception {
		return dao.Count_Pro();
	}

	@Override
	public ProductVO detail_product(String product_no) throws Exception {
		return dao.detail_pro(product_no);
	}

	@Override
	public void delete_product(String product_no) throws Exception {
		dao.delete_pro(product_no);
	}

	@Override
	public String create_UUID() throws Exception {
		      String uuid = UUID.randomUUID().toString().replace("-", "");
		  return uuid;		
	}


}
