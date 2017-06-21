package kokofarm.product.service;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kokofarm.mypage.domain.graphVO;
import kokofarm.product.domain.PagingMaker;
import kokofarm.product.domain.ProductListForm;
import kokofarm.product.domain.ProductVO;
import kokofarm.product.persistence.ProductDAO;
import kokofarm.product.persistence.ReplyDAO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	private ProductDAO dao;
	
	@Inject
	private ReplyDAO replyDao;
	
	@Override
	public void insert_product(ProductVO product) throws Exception {
		dao.insert_Pro(product);
	}

	//전체출력
	@Override
	public List<ProductVO> list_product(PagingMaker ProductForm) throws Exception {
		return dao.list_Pro(ProductForm);
	}
	
	
	@Override
	public int Count_Product() throws Exception {
		return dao.Count_Pro();
	}
	
	@Transactional
	@Override
	public ProductVO detail_product(String product_no) throws Exception {
		dao.view_count(product_no); //클릭수
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
