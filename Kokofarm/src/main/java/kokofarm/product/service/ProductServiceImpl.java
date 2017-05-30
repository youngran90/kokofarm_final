package kokofarm.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.product.domain.ReplyVO;
import kokofarm.product.domain.ProductVO;
import kokofarm.product.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	private ProductDAO dao;

	@Override
	public void insert_product(ProductVO product) throws Exception {
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


}
