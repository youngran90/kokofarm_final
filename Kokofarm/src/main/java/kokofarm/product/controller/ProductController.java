package kokofarm.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kokofarm.basic.domain.FileBean;
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

	@RequestMapping(value="/list_product", method= RequestMethod.GET)
	public void listProduct(@Param("ca1") String ca1, 
			@Param("ca2") String ca2, @Param("ca3") String ca3,  Model model)throws Exception{

		logger.info("product..list...");

		Map<String, String> map = new HashMap<String, String>();
		map.put("ca1", ca1);
		map.put("ca2", ca2);
		map.put("ca3", ca3);
		model.addAttribute("list", service.list_product(map));
	}
	
	
	@RequestMapping(value="/detail_product", method= RequestMethod.GET)
	public void detail_product(Model model,@RequestParam("product_no") String product_no)throws Exception{

		logger.info("product..detail_product...");
	
		List<ReplyVO> replylist = null;
		ProductVO productVo = service.detail_product(product_no);
		model.addAttribute("product", productVo);
		
		replylist = re_service.list_Post(product_no);
		System.out.println("---------------------------");
		System.out.println("list"+replylist.toString());
		model.addAttribute("replylist", replylist);
		//return "/product/detail_product";
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
	 

}
