package kokofarm.auction.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kokofarm.auction.domain.AuctionRegisterVO;
import kokofarm.auction.domain.RT_AuctionRegisterVO;
import kokofarm.auction.service.AuctionService;
import kokofarm.basic.domain.FileBean;

import kokofarm.basic.util.MediaUtils;
import kokofarm.basic.util.UploadFileUtils;

@Controller
@RequestMapping("/auction/*")
public class AuctionController {
	private static final Logger logger = LoggerFactory.getLogger(AuctionController.class);
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Inject
	private AuctionService service;
	
	@RequestMapping(value="/auction_register", method=RequestMethod.GET)
	public void auctionRegisterGET(AuctionRegisterVO auction, Model model)throws Exception{
		logger.info("일반 경매 등록폼_get");
		
	}
	
	@RequestMapping(value="/auction_register", method=RequestMethod.POST)
	public String auctionRegsterPOST(AuctionRegisterVO auction, HttpServletRequest request) throws Exception{
		
		logger.info("넘어오냐");
		logger.info(auction.toString());
		String originalName = auction.getFile().getOriginalFilename();
	    byte[] fileData = auction.getFile().getBytes();
	         
	    HttpSession session = request.getSession();
	    String root_path = session.getServletContext().getRealPath("/");
	    String attach_path = "resources/files/attach/";
	         
	         
	    String auction_title_img = "Auction_"+originalName;
	    auction.setAuction_title_img(auction_title_img);
	    //logger.info("auction_title_img : "+auction.getAuction_title_img());
	    
	    String auction_unit = request.getParameter("auction_unit");
	    String auction_units = request.getParameter("auction_units");
	    String unit = auction_unit+auction_units;
	    auction.setAuction_unit(unit);
	    
	    String auction_location = request.getParameter("auction_location");
	    String auction_area = request.getParameter("auction_area");
	    String area = auction_location+" "+auction_area;
	    auction.setAuction_area(area);
	         
	    service.register(auction);
	    logger.info("auction_title_img : "+auction.getAuction_title_img());
	         
	    File auction_file = new File(root_path + attach_path, auction_title_img);
	    FileCopyUtils.copy(fileData, auction_file);
	      
		return "redirect:/auction/auction_list";
		
	}
	
		//CKEditor//
		@RequestMapping(value="/file_upload", method=RequestMethod.POST)
		public String FileUpload(FileBean fileBean, HttpServletRequest request, Model model){
			HttpSession session = request.getSession();
			String root_path = session.getServletContext().getRealPath("/");
			String attach_path = "resources/files/attach/";
			MultipartFile upload = fileBean.getUpload();
			String filename = "";
			String CKEditorFuncNum = "";
			
			
			if(upload != null){
				filename = "Auction_detail_" + upload.getOriginalFilename();
				logger.info(filename);
				fileBean.setFilename(filename);
				CKEditorFuncNum = fileBean.getCKEditorFuncNum();
				try{
					File file = new File(root_path + attach_path + filename);
					logger.info(root_path+attach_path+filename);
					upload.transferTo(file);
				} catch(IOException e){
					e.printStackTrace();
				}
			}
			
			String file_path = "/"+attach_path+filename;
			
			model.addAttribute("file_path", file_path);
			model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
			
			return "auction/auction_register";
			
		}
	
	@RequestMapping(value="/auction_list", method=RequestMethod.GET)
	public void auctionListGET(AuctionRegisterVO auction, Model model)throws Exception{
		model.addAttribute("list", service.list());
		
		logger.info("일반 경매 리스트_get");
	}
	
	@RequestMapping(value="/tender_form", method=RequestMethod.GET)
	public void detail(@RequestParam(value="auction_no") int auction_no, Model model)throws Exception{
		model.addAttribute(service.detail(auction_no));
		System.out.println(auction_no);
	}
	
	
	
	
	/*실시간 경매*/
	@RequestMapping(value="/rt_auction_register", method=RequestMethod.GET)
	public void RT_auctionRegisterGET(RT_AuctionRegisterVO rt_auction, Model model)throws Exception{
		logger.info("실시간 경매 등록폼_get");
	}
	
	@RequestMapping(value="/rt_auction_register", method=RequestMethod.POST)
	public String RT_auctionRegisterPOST(RT_AuctionRegisterVO rt_auction, HttpServletRequest request)throws Exception{
		logger.info("넘어오냐");
		
		
		UUID uid = UUID.randomUUID();
		String auction_no = "RT_Auction_"+uid.toString().replace("-", "");
		rt_auction.setRt_auction_no(auction_no);
		String set_d = request.getParameter("rt_auction_date");
		String set_t = request.getParameter("rt_auction_time");
		String setDate = set_d+" "+set_t;
		rt_auction.setRt_auction_date(setDate);
		System.out.println(auction_no);
		System.out.println(setDate);
		
		logger.info(rt_auction.toString());
		String originalName = rt_auction.getRt_file().getOriginalFilename();
	    byte[] fileData = rt_auction.getRt_file().getBytes();
	         
	    HttpSession session = request.getSession();
	    String root_path = session.getServletContext().getRealPath("/");
	    String attach_path = "resources/files/attach/";
	               
	    String rt_auction_title_img = "RT_Auction_"+originalName;
	    rt_auction.setRt_auction_title_img(rt_auction_title_img);
	    //logger.info("auction_title_img : "+auction.getAuction_title_img());
	         
	    service.rt_register(rt_auction);
	    logger.info("auction_title_img : "+rt_auction.getRt_auction_title_img());
	         
	    File auction_file = new File(root_path + attach_path, rt_auction_title_img);
	    FileCopyUtils.copy(fileData, auction_file);
	      
		return "redirect:/auction/rt_auction_list";
	}

	@RequestMapping(value="/rt_auction_list", method=RequestMethod.GET)
	public void RT_auctionListGET(RT_AuctionRegisterVO rt_auction, Model model)throws Exception{
		model.addAttribute("list", service.rt_list());
		
		logger.info("실시간 경매 리스트_get");
	}
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public void RT_detail(@RequestParam(value="rt_auction_no") String rt_auction_no, Model model)throws Exception{
		model.addAttribute(service.rt_detail(rt_auction_no));
	}
}
