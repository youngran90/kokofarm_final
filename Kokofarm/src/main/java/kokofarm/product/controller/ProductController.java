package kokofarm.product.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kokofarm.product.domain.ProductVO;
import kokofarm.product.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Inject
	private ProductService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class); 
	
	@RequestMapping(value="/Insert_product", method=RequestMethod.GET)
	public void productGET(ProductVO product, Model model)throws Exception{
		logger.info("insert form....");
		
	}

	@RequestMapping(value="Insert_product", method=RequestMethod.POST)
	public String productPost(ProductVO product, Model model)throws Exception{
		logger.info("insert Product....");
		service.insert_product(product);
		//model.addAttribute();
		return null;
	}
}
