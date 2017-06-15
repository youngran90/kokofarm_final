package kokofarm.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kokofarm.basic.domain.Criteria;
import kokofarm.basic.domain.FileBean;
import kokofarm.basic.domain.PageMaker;
import kokofarm.mypage.domain.InquiryVO;
import kokofarm.product.domain.ProductListForm;
import kokofarm.product.domain.ProductVO;
import kokofarm.product.domain.ReplyVO;
import kokofarm.product.service.ProductService;
import kokofarm.product.service.ReplyService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Inject
	private ProductService service;
	
	@Inject
	private ReplyService re_service;
	
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class); 
	
	@RequestMapping(value="/Insert_product", method=RequestMethod.GET)
	public void productGET(ProductVO product, Model model)throws Exception{
		logger.info("insert form....");
		
	}

	@RequestMapping(value="/Insert_product", method=RequestMethod.POST)
	public String productPost(ProductVO product, HttpServletRequest request )throws Exception{
		System.out.println("in------------------------");
		logger.info("insert Product....");
		String uuid = UUID.randomUUID().toString().replace("-", "");
		String product_no = "p-"+uuid;
		product.setProduct_no(product_no);
		
		String originalName1 = product.getFile1().getOriginalFilename();
		String originalName2 = product.getFile2().getOriginalFilename();
		

		byte[] fileData1 = product.getFile1().getBytes();
		byte[] fileData2 = product.getFile2().getBytes();
		
		HttpSession session = request.getSession(); 
		String root_path = session.getServletContext().getRealPath("/"); // 웹서비스 root 경로 
		String attach_path = "resources/files/attach/";
		//String uploadPath = "C:\\upload\\";
		UUID uid = UUID.randomUUID();
		String mainimage = uid.toString() + originalName1;
		String sellerimage = uid.toString() + originalName2;
		
		product.setProduct_mainimage(mainimage);
		product.setProduct_sellerimage(sellerimage);
		service.insert_product(product);
		
		File target1 = new File(root_path + attach_path, mainimage);
		File target2 = new File(root_path + attach_path, sellerimage);
		FileCopyUtils.copy(fileData1, target1);
		FileCopyUtils.copy(fileData2, target2);

		//return "redirect:/product/detail_product?product_no="+product_no;
		return "redirect:/product/list_product";
	}

	@RequestMapping(value="/list_product", method= {RequestMethod.GET, RequestMethod.POST})
	public void listProduct(@Param("ca1") String ca1, 
		@Param("ca2") String ca2, @Param("ca3") String ca3,  HttpServletRequest request,
		 InquiryVO inquiry, @ModelAttribute("cri") Criteria cri, @Param("input_sort") String input_sort,
		 Model model)throws Exception{

		logger.info("in");
		ProductListForm ProductForm = new ProductListForm();
		ProductForm.setCa1(ca1);
		ProductForm.setCa2(ca2);
		ProductForm.setCa3(ca3);
		ProductForm.setInput_sort(input_sort);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.Count_Product(),cri.getPage());
		ProductForm.setPageMaker(pageMaker);
		List<ProductVO>list = service.list_product(ProductForm);
		model.addAttribute("count_product", service.Count_Product());
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", pageMaker);
		
		
	}
	
	
	@RequestMapping(value="/detail_product", method= RequestMethod.GET)
	public void detail_product(Model model,@RequestParam("product_no") String product_no)throws Exception{

		logger.info("product..detail_product...");
		
		List<ReplyVO> replylist = null;
		ProductVO productVo = service.detail_product(product_no);
		model.addAttribute("product", productVo);
		
		int reply_count = re_service.countReply(product_no);
		model.addAttribute("reply_count", reply_count);
		
		int reply_avg = re_service.avgReply(product_no);
		model.addAttribute("reply_avg", reply_avg);
		
		replylist = re_service.list_Post(product_no);
		
		
		model.addAttribute("replylist", replylist);
	}
		
	//게시판 
	@RequestMapping(value = "/file_upload", method = RequestMethod.POST) 
	public String procFileUpload(FileBean fileBean,HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession(); 
		String root_path = session.getServletContext().getRealPath("/"); // 웹서비스 root 경로 
		String attach_path = "resources/files/attach/";
		MultipartFile upload = fileBean.getUpload(); 
		String filename = ""; 
		String CKEditorFuncNum = ""; 

		String uuid = UUID.randomUUID().toString().replace("-", "");
		
		if (upload != null) { 
			filename = uuid + upload.getOriginalFilename(); 
			fileBean.setFilename(filename); 
			CKEditorFuncNum = fileBean.getCKEditorFuncNum();
			try { 
				File file = new File(root_path + attach_path + filename); 
				logger.info(root_path + attach_path + filename); 
				upload.transferTo(file); } 
			catch (IOException e) {
					e.printStackTrace(); 
					} 
			} 
		String file_path = "/"+attach_path + filename; 
		
		model.addAttribute("file_path", file_path); 
		model.addAttribute("CKEditorFuncNum", CKEditorFuncNum); 

		return "product/Insert_product"; 
		}
	 
	@RequestMapping(value ="/product_delete", method = RequestMethod.GET)
	public String product_delete(@Param("product_no")String product_no)throws Exception {
		 System.out.println(product_no);
		service.delete_product(product_no);
		
		return "redirect:/product/list_product";
	}
	
}
