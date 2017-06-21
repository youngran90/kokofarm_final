package kokofarm.product.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kokofarm.basic.domain.Criteria;
import kokofarm.basic.domain.FileBean;
import kokofarm.basic.domain.PageMaker;
import kokofarm.mypage.domain.InquiryVO;
import kokofarm.mypage.domain.graphVO;
import kokofarm.product.domain.PagingMaker;
import kokofarm.product.domain.ProductListForm;
import kokofarm.product.domain.ProductVO;
import kokofarm.product.domain.ReplyVO;
import kokofarm.product.domain.dailyPrice;
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
	public void listProduct(HttpServletRequest request, Model model, @ModelAttribute("ProductForm") PagingMaker ProductForm)throws Exception{

		System.out.println("Here is listController");
		String text = "%"+ProductForm.getSearchText()+"%";
		ProductForm.setSearchText(text);
		System.out.println(ProductForm.toString());
		
		ProductForm.setTotalCount(service.Count_Product());
		
		ProductForm.calcData();
		List<ProductVO>list = service.list_product(ProductForm);
		
		System.out.println(list.toString());
		model.addAttribute("count_product", service.Count_Product());
		model.addAttribute("list",list);
		model.addAttribute("ProductForm", ProductForm);
     		
	}
	
	
	@RequestMapping(value="/detail_product", method= RequestMethod.GET)
	public void detail_product(Model model,@RequestParam("product_no") String product_no)throws Exception{

		logger.info("product..detail_product...");
		
		List<ReplyVO> replylist = null;
		ProductVO productVo = service.detail_product(product_no);
		model.addAttribute("product", productVo);
		
		//댓글 갯수
		int reply_count = re_service.countReply(product_no);
		model.addAttribute("reply_count", reply_count);
		
		//댓글 평점 평균
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
	
	@RequestMapping(value ="/getdate", method = RequestMethod.GET)
	public String getdate(HttpServletResponse response, Model model)throws Exception {
		System.out.println("insert getdate");
		GregorianCalendar today = new GregorianCalendar ( ); 
		int year = today.get ( today.YEAR ); 
		int month = today.get ( today.MONTH ) + 1; 
		int date = today.get ( today.DATE );
		
		 String page = "http://www.kamis.or.kr/service/price/xml.do?action=dailyPriceByCategoryList&p_cert_key=11b8b641-7c0f-4303-a422-7af6301b8ab4&p_cert_id=youngran90&p_convert_kg_yn=Y&p_returntype=json";
		//구분
		 String buyer_do = "&p_product_cls_code=01"; //도매
		 String buyer_so = "&p_product_cls_code=02"; //소매
		
		//부류코드
		 String vege = "&p_item_category_code=200"; //채소류
		 String fruit = "&p_item_category_code=400"; //과일류
		 
		//지역
		 String seoul = "&p_country_code=1101";
		 
		 //조회날짜
		// String today_date = "&p_regday="+year +"-"+ month + "-" + date; //당일날짜
		 String t_date = "16";
		 String today_date = "&p_regday="+year +"-"+ month + "-" + t_date; //당일날짜
		 
		 //소매 채소
		 String urlstr = page+ buyer_so + vege + seoul + today_date;
         
         URL url = new URL(urlstr);
         BufferedReader bf;
         String line;
         String result="";

         //날씨 정보를 받아온다.
         bf = new BufferedReader(new InputStreamReader(url.openStream()));

         //버퍼에 있는 정보를 문자열로 변환.
         while((line=bf.readLine())!=null){
             result=result.concat(line);
         }

		 JSONParser jsonparser = new JSONParser();
         JSONObject jsonobject = (JSONObject)jsonparser.parse(result);
         JSONObject json =  (JSONObject) jsonobject.get("data");
         JSONArray array = (JSONArray)json.get("item");
         
         List<dailyPrice> price_list = new ArrayList<dailyPrice>();
         for(int i = 0 ; i < array.size(); i++){
        	 dailyPrice price = new dailyPrice();
             JSONObject entity = (JSONObject)array.get(i);
             String item_name = (String) entity.get("item_name");
             price.setItem_name(item_name);
             
             String kind_name = (String) entity.get("kind_name");
             price.setKind_name(kind_name);
             
             String rank = (String)entity.get("rank");
             price.setRank(rank);
             
             String dpr1 = (String) entity.get("dpr1")+"원";
             price.setDpr1(dpr1);
             
             String dpr2 = (String) entity.get("dpr2")+"원";
             price.setDpr2(dpr2);
             
             String dpr3 = (String) entity.get("dpr3")+"원";
             price.setDpr3(dpr3);
             price_list.add(price);
		 }
         model.addAttribute("today", month+"/" +t_date);
         model.addAttribute("price_list", price_list);
         
     	return "/main/dailyPrice";
    	
	}
	
	@RequestMapping(value ="/getdate1", method = RequestMethod.GET)
	public String getdate1(HttpServletResponse response, Model model)throws Exception {
		System.out.println("insert getdate");
		GregorianCalendar today = new GregorianCalendar ( ); 
		int year = today.get ( today.YEAR ); 
		int month = today.get ( today.MONTH ) + 1; 
		int date = today.get ( today.DATE );
		
		 String page = "http://www.kamis.or.kr/service/price/xml.do?action=dailyPriceByCategoryList&p_cert_key=11b8b641-7c0f-4303-a422-7af6301b8ab4&p_cert_id=youngran90&p_convert_kg_yn=Y&p_returntype=json";
		//구분
		 String buyer_do = "&p_product_cls_code=01"; //도매
		 String buyer_so = "&p_product_cls_code=02"; //소매
		
		//부류코드
		 String fruit = "&p_item_category_code=400"; //과일류
		 
		//지역
		 String seoul = "&p_country_code=1101";
		 
		 //조회날짜
		// String today_date = "&p_regday="+year +"-"+ month + "-" + date; //당일날짜
		 String t_date = "16";
		 String today_date = "&p_regday="+year +"-"+ month + "-" + t_date; //당일날짜
		 
		 //소매 채소
		 String urlstr = page+ buyer_so + fruit + seoul + today_date;
         
         URL url = new URL(urlstr);
         BufferedReader bf;
         String line;
         String result="";

         //날씨 정보를 받아온다.
         bf = new BufferedReader(new InputStreamReader(url.openStream()));

         //버퍼에 있는 정보를 문자열로 변환.
         while((line=bf.readLine())!=null){
             result=result.concat(line);
         }

		 JSONParser jsonparser = new JSONParser();
         JSONObject jsonobject = (JSONObject)jsonparser.parse(result);
         JSONObject json =  (JSONObject) jsonobject.get("data");
         JSONArray array = (JSONArray)json.get("item");
         
         List<dailyPrice> price_list = new ArrayList<dailyPrice>();
         for(int i = 0 ; i < array.size(); i++){
        	 dailyPrice price = new dailyPrice();
             JSONObject entity = (JSONObject)array.get(i);
             String item_name = (String) entity.get("item_name");
             price.setItem_name(item_name);
             
             String kind_name = (String) entity.get("kind_name");
             price.setKind_name(kind_name);
             
             String rank = (String)entity.get("rank");
             price.setRank(rank);
             
             String dpr1 = (String) entity.get("dpr1")+"원";
             price.setDpr1(dpr1);
             
             String dpr2 = (String) entity.get("dpr2")+"원";
             price.setDpr2(dpr2);
             
             String dpr3 = (String) entity.get("dpr3")+"원";
             price.setDpr3(dpr3);
             price_list.add(price);
		 }
         model.addAttribute("today", month+"/" +t_date);
         model.addAttribute("price_list", price_list);
         
     	return "/main/dailyPrice1";
    	
	}
	
	

}
