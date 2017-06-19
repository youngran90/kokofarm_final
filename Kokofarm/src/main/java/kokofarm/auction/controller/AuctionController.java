package kokofarm.auction.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kokofarm.auction.domain.AuctionCri;
import kokofarm.auction.domain.AuctionPage;
import kokofarm.auction.domain.AuctionRegisterVO;
import kokofarm.auction.domain.AuctionSort;
import kokofarm.auction.domain.RT_AuctionCri;
import kokofarm.auction.domain.RT_AuctionRegisterVO;
import kokofarm.auction.service.AuctionService;
import kokofarm.basic.domain.FileBean;
import kokofarm.member.domain.MemberVO;


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
	    
	    String select_time = request.getParameter("selectedTime");
	    logger.info(select_time);
	    
	    String auction_unit = request.getParameter("auction_unit");
	    String auction_units = request.getParameter("auction_units");
	    String unit = auction_unit+auction_units;
	    auction.setAuction_unit(unit);
	    
	    String auction_location = request.getParameter("auction_location");
	    String auction_area = request.getParameter("auction_area");
	    String area = auction_location+" "+auction_area;
	    auction.setAuction_area(area);
	    
	    MemberVO member = (MemberVO)session.getAttribute("login");
	    String seller_no = member.getSeller_no();
	    auction.setSeller_no(seller_no);
	    
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
	public void auctionList(@ModelAttribute("cri")AuctionCri cri, AuctionRegisterVO auction,
			MemberVO member, Model model) throws Exception{
		logger.info(cri.toString());

		model.addAttribute("list", service.listCri(cri));
	
		AuctionPage auctionPage = new AuctionPage();
		auctionPage.setCri(cri);
		auctionPage.setTotalCount(service.CountPage(cri));
		
		model.addAttribute("auctionPage", auctionPage);
		logger.info("페이징 + 일반경매리스트_GET");
		
		auction.setSeller_no(member.getSeller_no()); //사업자번호 받아오기
	}
	
	@RequestMapping(value="/tender_form", method=RequestMethod.GET)
	public void detail(@RequestParam(value="auction_no") int auction_no, HttpSession session, Model model)throws Exception{
		
		model.addAttribute(service.detail(auction_no));
		System.out.println(auction_no);
	}
	
	
	
	
	
	/*실시간 경매*/
	@RequestMapping(value="/rt_auction_register", method=RequestMethod.GET)
	public void RT_auctionRegisterGET(RT_AuctionRegisterVO rt_auction, Model model)throws Exception{
		logger.info("실시간 경매 등록폼_get");
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String vistiTime = format.format(calendar.getTime());
		System.out.println("현재시간 : "+vistiTime);
		
		int hour = Integer.parseInt(vistiTime.substring(11,13));
		int minute = Integer.parseInt(vistiTime.substring(14,16));
		model.addAttribute("set_time", hour);
		model.addAttribute("set_min", minute);
		
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
		
		String unit = request.getParameter("rt_auction_unit");
		String units = request.getParameter("rt_auction_units");
		rt_auction.setRt_auction_unit(unit+units);
		
		String location = request.getParameter("rt_auction_location");
		String area = request.getParameter("rt_auction_area");
		rt_auction.setRt_auction_area(location+" "+area);
		
		System.out.println(auction_no);
		System.out.println(setDate);
		
		
		logger.info(rt_auction.toString());
		String originalName = rt_auction.getRt_file().getOriginalFilename();
		String originalName01 = rt_auction.getRt_file2().getOriginalFilename();
		String originalName02 = rt_auction.getRt_file3().getOriginalFilename();
	    byte[] fileData = rt_auction.getRt_file().getBytes();
	    byte[] fileData2 = rt_auction.getRt_file2().getBytes();
	    byte[] fileData3 = rt_auction.getRt_file3().getBytes();
	         
	    HttpSession session = request.getSession();
	    String root_path = session.getServletContext().getRealPath("/");
	    String attach_path = "resources/files/attach/";
	               
	    String rt_auction_title_img = "RT_Auction_"+originalName;
	    String rt_auction_title_img01 = "RT_Auction_2"+originalName01;
	    String rt_auction_title_img02 = "RT_Auction_3"+originalName02;
	    
	    rt_auction.setRt_auction_title_img(rt_auction_title_img);
	    rt_auction.setRt_auction_title_img01(rt_auction_title_img01);
	    rt_auction.setRt_auction_title_img02(rt_auction_title_img02);
	    //logger.info("auction_title_img : "+auction.getAuction_title_img());
	    
	    MemberVO member = (MemberVO)session.getAttribute("login");
	    String seller_no = member.getSeller_no();
	    rt_auction.setSeller_no(seller_no);
	         
	    service.rt_register(rt_auction);
	    logger.info("auction_title_img : "+rt_auction.getRt_auction_title_img());
	    logger.info("auction_title_img01 : "+rt_auction.getRt_auction_title_img01());
	    logger.info("auction_title_img02 : "+rt_auction.getRt_auction_title_img02());
	    logger.info("seller_no : " + rt_auction.getSeller_no());
	    
	         
	    File auction_file = new File(root_path + attach_path, rt_auction_title_img);
	    File auction_file2 = new File(root_path + attach_path, rt_auction_title_img01);
	    File auction_file3 = new File(root_path + attach_path, rt_auction_title_img02);
	    FileCopyUtils.copy(fileData, auction_file);
	    FileCopyUtils.copy(fileData2, auction_file2);
	    FileCopyUtils.copy(fileData3, auction_file3);
	      
		return "redirect:/auction/rt_auction_list";
	}

	@RequestMapping(value="/rt_auction_list", method=RequestMethod.GET)
	public void RT_auctionList(@ModelAttribute("cri")RT_AuctionCri cri, RT_AuctionRegisterVO vo, Model model)throws Exception{
		logger.info(cri.toString());
		model.addAttribute("list", service.rt_listCri(cri));
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String vistiTime = format.format(calendar.getTime());
		System.out.println("현재시간 : "+vistiTime);
		
		int hour = Integer.parseInt(vistiTime.substring(11,13));
		int minute = Integer.parseInt(vistiTime.substring(14,16));
		model.addAttribute("set_time", hour);
		model.addAttribute("set_min", minute);
		
		logger.info("실시간 경매 리스트_get");
	}
	
	
	@RequestMapping(value="/rt_auction/rt_auction", method=RequestMethod.GET)
	public void RT_detail(@RequestParam(value="rt_auction_no") String rt_auction_no, Model model)throws Exception{
		model.addAttribute(service.rt_detail(rt_auction_no));
	}
}
