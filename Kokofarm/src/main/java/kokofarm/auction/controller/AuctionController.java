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
	         
	         
	    String auction_title_img = "A_"+originalName;
	    auction.setAuction_title_img(auction_title_img);
	    //logger.info("auction_title_img : "+auction.getAuction_title_img());
	         
	    service.regist(auction);
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
			
			//String uuid = UUID.randomUUID().toString().replace("-", "");
			
			if(upload != null){
				filename = "A_detail_" + upload.getOriginalFilename();
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
			
			return "auction/auction_list";
			
		}
	
		
		
	@RequestMapping(value="/auction_list", method=RequestMethod.GET)
	public void auctionListGET(AuctionRegisterVO auction, Model model)throws Exception{
		model.addAttribute("list", service.list());
		
		logger.info("일반 경매 리스트_get");
	}
	
	@RequestMapping(value="/auction_detail", method=RequestMethod.GET)
	public void detail(@RequestParam(value="auction_no") int auction_no, Model model)throws Exception{
		model.addAttribute(service.detail(auction_no));
		System.out.println(auction_no);
	}
	
	/*@RequestMapping(value="/tender")*/
	
	
	@RequestMapping(value="/RT_auction_register", method=RequestMethod.GET)
	public void RT_auctionRegisterGET(RT_AuctionRegisterVO auction_rt, Model model)throws Exception{
		logger.info("실시간 경매 등록폼_get");
	}

}
