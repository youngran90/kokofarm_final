package kokofarm.auction.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

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
		
		System.out.println("넘어오냐");
		System.out.println(auction.toString());
		String originalName = auction.getFile().getOriginalFilename();
	    byte[] fileData = auction.getFile().getBytes();
	         
	    HttpSession session = request.getSession();
	    String root_path = session.getServletContext().getRealPath("/");
	    String attach_path = "resources/files/attach/";
	         
	         
	    String auction_title_img = "Auction_"+originalName;
	    auction.setAuction_title_img(auction_title_img);
	    //logger.info("auction_title_img : "+auction.getAuction_title_img());
	    
	    //시간을 받아오자아,,,ㅇㅁㅇ!
	    String selected_day = request.getParameter("start_date");
	    System.out.println(selected_day);
	    String selected_day2 = request.getParameter("end_date");
	    System.out.println(selected_day2);
	    String select_Sec = "00"; //선택초
	    
	    //경매시작일
	    String selected_time = request.getParameter("selectedTime"); //AM or PM
	    System.out.println("시간:"+selected_time);
	    String select_Time = request.getParameter("select_Time"); //선택시간
	    System.out.println(select_Time);
	    String select_Min = request.getParameter("select_Min"); //선택분
	    System.out.println(select_Min);
	    
	    
	    if(selected_time.equals("pm")){
	    	String parse = String.valueOf(Integer.parseInt(select_Time)+12); //선택 시간에 12를 더해서 오후시간으로!
	    	auction.setStart_date(selected_day+" "+parse+":"+select_Min+":"+select_Sec);
	    }else if(selected_time.equals("am")){
	    	auction.setStart_date(selected_day+" "+select_Time+":"+select_Min+":"+select_Sec);
	    }
	    
	    
	    //경매종료일
	    String selected_time2 = request.getParameter("selectedTime2"); //AM or PM
	    System.out.println("종료일:"+selected_time2);
	    String select_Time2 = request.getParameter("select_Time2"); //선택시간
	    System.out.println("종료일 선택시간:"+select_Time2);
	    String select_Min2 = request.getParameter("select_Min2"); //선택분
	    System.out.println("종료일 선택분:"+select_Min2);
	    
	    if(selected_time2.equals("pm")){
	    	String parse2 = String.valueOf(Integer.parseInt(select_Time2)+12);
	    	System.out.println(selected_day2+" "+parse2+":"+select_Min2+":"+select_Sec);
	    	auction.setEnd_date(selected_day2+" "+parse2+":"+select_Min2+":"+select_Sec);
	    }else if(selected_time2.equals("am")){
	    	auction.setEnd_date(selected_day2+" "+select_Time2+":"+select_Min2+":"+select_Sec);
	    }
	    
	    System.out.println("시작일:"+auction.getStart_date());
	    System.out.println("종료일:"+auction.getEnd_date());
	    
	    
	    String auction_unit = request.getParameter("auction_unit");
	    String auction_units = request.getParameter("auction_units");
	    String unit = auction_unit+auction_units;
	    auction.setAuction_unit(unit);
	    System.out.println("단위"+auction.getAuction_unit());
	    
	    String auction_location = request.getParameter("auction_location");
	    String auction_area = request.getParameter("auction_area");
	    String area = auction_location+" "+auction_area;
	    auction.setAuction_area(area);
	    System.out.println("지역"+auction.getAuction_area());
	    
	    
	    MemberVO member = (MemberVO)session.getAttribute("login");
	    String seller_no = member.getSeller_no();
	    auction.setSeller_no(seller_no);
	    System.out.println("셀러넘버"+auction.getSeller_no());
	    
	    System.out.println("노어이"+auction.toString());
	    System.out.println("auction_title_img : "+auction.getAuction_title_img());
	    
	    
	         
	    File auction_file = new File(root_path + attach_path, auction_title_img);
	    FileCopyUtils.copy(fileData, auction_file);
	    
	    service.register(auction);
	    System.out.println(auction.toString());
	    
	    
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
	public void auctionList(@ModelAttribute("cri")AuctionCri cri, AuctionRegisterVO auction, HttpServletRequest request, 
			MemberVO member, Model model) throws Exception{
		
		List<AuctionRegisterVO> list = service.listCri(cri);
		
		System.out.println("선생님,,"+list);
		model.addAttribute("list", service.listCri(cri));
		
		System.out.println("신상품 리스트:"+service.new_auction());
		for(int i=0; i<5; i++){
			model.addAttribute("new_auction"+i, service.new_auction().get(i));
		}
		
		List<Integer> time_list = new ArrayList<Integer>();
		for(int i=0; i<list.size(); i++){
			String start_time = list.get(i).getStart_date();
		
	
		//타이머
		/*String start_time = list.get(0).getStart_date();*/
		System.out.println("시작시간 "+start_time);
		int s_year= Integer.parseInt(start_time.substring(0, 4));
		int s_month= Integer.parseInt(start_time.substring(5, 7));
		int s_day = Integer.parseInt(start_time.substring(8,10));
		int s_hour = Integer.parseInt(start_time.substring(11,13));
		int s_minute = Integer.parseInt(start_time.substring(14,16));
		int s_second = Integer.parseInt(start_time.substring(17,19));
		
		int startTime=s_hour*60*60+s_minute*60+s_second;
		System.out.println("시작시간(초) "+startTime);
		
		/*String end_time = auction.getEnd_date();
		System.out.println("끝나는시간 "+ end_time);
		int e_year = Integer.parseInt(end_time.substring(0,4));
		int e_month=Integer.parseInt(end_time.substring(5,7));
		int e_day=Integer.parseInt(end_time.substring(8,10));
		int e_hour=Integer.parseInt(end_time.substring(11,13));
		int e_minute= Integer.parseInt(end_time.substring(14,16));
		int e_second=Integer.parseInt(end_time.substring(17,19));
		
		int endTime=e_hour*60*60+e_minute*60+e_second;
		System.out.println("끝나는시간(초) "+endTime);*/
		
		Calendar cal= Calendar.getInstance();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String visitTime=sf.format(cal.getTime());
		System.out.println("현재시간 "+visitTime);
		
	
		int v_year = Integer.parseInt(visitTime.substring(0,4));
		int v_month=Integer.parseInt(visitTime.substring(5,7));
		int v_day=Integer.parseInt(visitTime.substring(8,10));
		int v_hour=Integer.parseInt(visitTime.substring(11,13));
		int v_minute= Integer.parseInt(visitTime.substring(14,16));
		int v_second=Integer.parseInt(visitTime.substring(17,19));
		
		int currentvisitTime=v_hour*60*60+v_minute*60+v_second;
		System.out.println("현재시간(초) "+currentvisitTime);
		
		int year1= s_year-v_year;
		int month1=s_month- v_month;
		int day1= s_day-v_day;
		int hour1=s_hour-v_hour;
		int minute1 = s_minute-v_minute;
		int second1= s_second-v_second;
				
		int visitingTime=0;
			
		if(year1==0 && month1==0 && day1>0){
			if(s_second<v_second){
				if(s_minute<1){
					s_hour= s_hour-1;
					s_minute = 59;
					s_second=s_second+60;
				}else{
					s_minute=s_minute-1;
					s_second=s_second+60;
				}
			}
			
			hour1=s_hour-v_hour;
			minute1 = s_minute-v_minute;
			second1= s_second-v_second;
	
			visitingTime= day1*24*60*60+ hour1*60*60+ minute1*60+ second1;
		}else if(year1==0 && month1==0 && day1==0){
			if(s_second<v_second){
				if(s_minute<1){
					s_hour= s_hour-1;
					s_minute = 59;
					s_second=s_second+60;
				}else{
					s_minute=s_minute-1;
					s_second=s_second+60;
				}
			}
			
			hour1=s_hour-v_hour;
			minute1 = s_minute-v_minute;
			second1= s_second-v_second;
			
			
			visitingTime= hour1*60*60+ minute1*60+ second1;
			
			if(visitingTime<=0){
				visitingTime=0;
			}				
		}
		
		time_list.add(visitingTime);
		}
		
		model.addAttribute("visitingTime", time_list);
		System.out.println(time_list);
		//System.out.println("방문시간: "+ visitingTime);
		//model.addAttribute("visitingTime", visitingTime);
		
		
		AuctionPage auctionPage = new AuctionPage();
		auctionPage.setCri(cri);
		auctionPage.setTotalCount(service.CountPage(cri));
		
		model.addAttribute("auctionPage", auctionPage);
		model.addAttribute("list_Fruit", service.list_Fruit(cri));
		model.addAttribute("list_Vege", service.list_Vege(cri));
		model.addAttribute("list_New", service.list_New(cri));
		model.addAttribute("list_End", service.list_End(cri));
		/*System.out.println("과일"+service.list_Fruit(cri));
		System.out.println("채소"+service.list_Vege(cri));
		System.out.println("채소"+service.list_New(cri));
		System.out.println("채소"+service.list_End(cri));*/
		logger.info("페이징 + 일반경매리스트_GET");
		
	}
	
	
	@RequestMapping(value="/tender_form", method=RequestMethod.GET)
	public void detail(@RequestParam(value="auction_no") int auction_no, HttpSession session, Model model)throws Exception{
		model.addAttribute(service.detail(auction_no));
		System.out.println(auction_no);
	}
	
	
	
	
	
	/*실시간 경매*/
	@RequestMapping(value="/rt_auction_register", method=RequestMethod.GET)
	public void RT_auctionRegisterGET(RT_AuctionRegisterVO rt_auction, @ModelAttribute("cri")RT_AuctionCri cri, 
			HttpServletRequest request, Model model)throws Exception{
		System.out.println("넘어옵니까?");
	
		model.addAttribute("count", service.rt_count());
		
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
		System.out.println("넘어오나");
		
		UUID uid = UUID.randomUUID();
		String auction_no = "RT_Auction_"+uid.toString().replace("-", "");
		rt_auction.setRt_auction_no(auction_no);
		
		String set_d = request.getParameter("rt_auction_date");
		String set_t = request.getParameter("rt_auction_time");
		String setDate = set_d+" "+set_t;
		rt_auction.setRt_auction_date(setDate);
		System.out.println(rt_auction.getRt_auction_date());
		
		String auction_time = request.getParameter("rt_auction_time");
 		System.out.println("시간대 : "+auction_time);
 		if(auction_time.equals("10:00:00")){
 			rt_auction.setRT_auction_time("am");
 		}else{
 			rt_auction.setRT_auction_time("pm");
 		}
		
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
	               
	    String rt_auction_title_img = "RT_Auction_"+uid+originalName;
	    String rt_auction_title_img01 = "RT_Auction_2"+uid+originalName01;
	    String rt_auction_title_img02 = "RT_Auction_3"+uid+originalName02;
	    
	    rt_auction.setRt_auction_title_img(rt_auction_title_img);
	    rt_auction.setRt_auction_title_img01(rt_auction_title_img01);
	    rt_auction.setRt_auction_title_img02(rt_auction_title_img02);
	    //logger.info("auction_title_img : "+auction.getAuction_title_img());
	    
	    MemberVO member = (MemberVO)session.getAttribute("login");
	    String seller_no = member.getSeller_no();
	    rt_auction.setSeller_no(seller_no);
	         
	    
	    logger.info("auction_title_img : "+rt_auction.getRt_auction_title_img());
	    logger.info("auction_title_img01 : "+rt_auction.getRt_auction_title_img01());
	    logger.info("auction_title_img02 : "+rt_auction.getRt_auction_title_img02());
	    logger.info("seller_no : " + rt_auction.getSeller_no());
	    
	    service.rt_register(rt_auction);     
	    File auction_file = new File(root_path + attach_path, rt_auction_title_img);
	    File auction_file2 = new File(root_path + attach_path, rt_auction_title_img01);
	    File auction_file3 = new File(root_path + attach_path, rt_auction_title_img02);
	    FileCopyUtils.copy(fileData, auction_file);
	    FileCopyUtils.copy(fileData2, auction_file2);
	    FileCopyUtils.copy(fileData3, auction_file3);
	    
	    System.out.println(rt_auction.toString());
	      
		return "redirect:/auction/rt_auction_list";
	}

	@RequestMapping(value="/rt_auction_list", method=RequestMethod.GET)
	public void RT_auctionList(@ModelAttribute("cri")RT_AuctionCri cri, RT_AuctionRegisterVO vo, Model model)throws Exception{
		//logger.info(cri.toString());
		
		model.addAttribute("count", service.rt_count());
		System.out.println("카운트:"+service.rt_count());
		model.addAttribute("list", service.rt_listAM(cri));
		//System.out.println("AM"+service.rt_listAM());
		model.addAttribute("list2", service.rt_listPM(cri));
		//System.out.println("PM"+service.rt_listPM());
		
		System.out.println("마감임박 리스트:"+service.pop_auction());
		for(int i=0; i<5; i++){
			model.addAttribute("pop_auction"+i, service.pop_auction().get(i));
		}
		
		List<RT_AuctionRegisterVO> a = service.rt_listAM(cri);
		List<RT_AuctionRegisterVO> p = service.rt_listPM(cri);
		System.out.println("오전경매날짜"+a);
		System.out.println("오후경매날짜"+p);
		
		
		//오후 타이머
		String start_time2 = null;
		if(p.size()>0){
			start_time2 = p.get(0).getRt_auction_date();
			System.out.println("나오냐"+start_time2);
		}
		System.out.println("========"+start_time2);
		if(start_time2!=null){
			start_time2 = p.get(0).getRt_auction_date();	
			System.out.println("시작시간 "+start_time2);
			int s_year2= Integer.parseInt(start_time2.substring(0, 4));
			int s_month2= Integer.parseInt(start_time2.substring(5, 7));
			int s_day2 = Integer.parseInt(start_time2.substring(8,10));
			int s_hour2 = Integer.parseInt(start_time2.substring(11,13));
			int s_minute2 = Integer.parseInt(start_time2.substring(14,16));
			int s_second2 = Integer.parseInt(start_time2.substring(17,19));
			
			int startTime2=s_hour2*60*60+s_minute2*60+s_second2;
			System.out.println("시작시간(초) "+startTime2);
			
			model.addAttribute("s_hour2", s_hour2);
			model.addAttribute("s_min2", s_minute2);
			/*String end_time = auction.getEnd_date();
			System.out.println("끝나는시간 "+ end_time);
			int e_year = Integer.parseInt(end_time.substring(0,4));
			int e_month=Integer.parseInt(end_time.substring(5,7));
			int e_day=Integer.parseInt(end_time.substring(8,10));
			int e_hour=Integer.parseInt(end_time.substring(11,13));
			int e_minute= Integer.parseInt(end_time.substring(14,16));
			int e_second=Integer.parseInt(end_time.substring(17,19));
			
			int endTime=e_hour*60*60+e_minute*60+e_second;
			System.out.println("끝나는시간(초) "+endTime);*/
			
			Calendar cal2= Calendar.getInstance();
			SimpleDateFormat sf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String visitTime2=sf2.format(cal2.getTime());
			System.out.println("현재시간 "+visitTime2);
			

			int v_year2 = Integer.parseInt(visitTime2.substring(0,4));
			int v_month2=Integer.parseInt(visitTime2.substring(5,7));
			int v_day2=Integer.parseInt(visitTime2.substring(8,10));
			int v_hour2=Integer.parseInt(visitTime2.substring(11,13));
			int v_minute2= Integer.parseInt(visitTime2.substring(14,16));
			int v_second2=Integer.parseInt(visitTime2.substring(17,19));
			
			int currentvisitTime2=v_hour2*60*60+v_minute2*60+v_second2;
			System.out.println("현재시간(초) "+currentvisitTime2);
			
			int year2= s_year2-v_year2;
			int month2=s_month2- v_month2;
			int day2= s_day2-v_day2;
			int hour2=s_hour2-v_hour2;
			int minute2 = s_minute2-v_minute2;
			int second2= s_second2-v_second2;
					
			int visitingTime2=0;
				
			if(year2==0 && month2==0 && day2>0){
				if(s_second2<v_second2){
					if(s_minute2<1){
						s_hour2= s_hour2-1;
						s_minute2 = 59;
						s_second2=s_second2+60;
					}else{
						s_minute2=s_minute2-1;
						s_second2=s_second2+60;
					}
				}
				
				hour2=s_hour2-v_hour2;
				minute2 = s_minute2-v_minute2;
				second2= s_second2-v_second2;

				visitingTime2= day2*24*60*60+ hour2*60*60+ minute2*60+ second2;
			}else if(year2==0 && month2==0 && day2==0){
				if(s_second2<v_second2){
					if(s_minute2<1){
						s_hour2= s_hour2-1;
						s_minute2 = 59;
						s_second2=s_second2+60;
					}else{
						s_minute2=s_minute2-1;
						s_second2=s_second2+60;
					}
				}
				
				hour2=s_hour2-v_hour2;
				minute2 = s_minute2-v_minute2;
				second2= s_second2-v_second2;
				
				
				visitingTime2= hour2*60*60+ minute2*60+ second2;
				
				if(visitingTime2<=0){
					visitingTime2=0;
				}				
			}
			model.addAttribute("vistingTime2", visitingTime2);
			System.out.println("오후방문시간: "+ visitingTime2);
		}
		
		//오전 타이머
			String start_time = null;
			if(a.size()>0){
				start_time = a.get(0).getRt_auction_date();
				System.out.println("나오냐"+start_time);
			}
			System.out.println("========"+start_time);
			if(start_time!=null){
			System.out.println("시작시간 "+start_time);
			int s_year= Integer.parseInt(start_time.substring(0, 4));
			int s_month= Integer.parseInt(start_time.substring(5, 7));
			int s_day = Integer.parseInt(start_time.substring(8,10));
			int s_hour = Integer.parseInt(start_time.substring(11,13));
			int s_minute = Integer.parseInt(start_time.substring(14,16));
			int s_second = Integer.parseInt(start_time.substring(17,19));
			
			int startTime=s_hour*60*60+s_minute*60+s_second;
			System.out.println("시작시간(초) "+startTime);
			
			model.addAttribute("s_hour", s_hour);
			model.addAttribute("s_min", s_minute);
			/*String end_time = auction.getEnd_date();
			System.out.println("끝나는시간 "+ end_time);
			int e_year = Integer.parseInt(end_time.substring(0,4));
			int e_month=Integer.parseInt(end_time.substring(5,7));
			int e_day=Integer.parseInt(end_time.substring(8,10));
			int e_hour=Integer.parseInt(end_time.substring(11,13));
			int e_minute= Integer.parseInt(end_time.substring(14,16));
			int e_second=Integer.parseInt(end_time.substring(17,19));
			
			int endTime=e_hour*60*60+e_minute*60+e_second;
			System.out.println("끝나는시간(초) "+endTime);*/
			
			Calendar cal= Calendar.getInstance();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String visitTime=sf.format(cal.getTime());
			System.out.println("현재시간 "+visitTime);
			

			int v_year = Integer.parseInt(visitTime.substring(0,4));
			int v_month=Integer.parseInt(visitTime.substring(5,7));
			int v_day=Integer.parseInt(visitTime.substring(8,10));
			int v_hour=Integer.parseInt(visitTime.substring(11,13));
			int v_minute= Integer.parseInt(visitTime.substring(14,16));
			int v_second=Integer.parseInt(visitTime.substring(17,19));
			
			int currentvisitTime=v_hour*60*60+v_minute*60+v_second;
			System.out.println("현재시간(초) "+currentvisitTime);
			
			int year1= s_year-v_year;
			int month1=s_month- v_month;
			int day1= s_day-v_day;
			int hour1=s_hour-v_hour;
			int minute1 = s_minute-v_minute;
			int second1= s_second-v_second;
					
			int visitingTime=0;
				
			if(year1==0 && month1==0 && day1>0){
				if(s_second<v_second){
					if(s_minute<1){
						s_hour= s_hour-1;
						s_minute = 59;
						s_second=s_second+60;
					}else{
						s_minute=s_minute-1;
						s_second=s_second+60;
					}
				}
				
				hour1=s_hour-v_hour;
				minute1 = s_minute-v_minute;
				second1= s_second-v_second;

				visitingTime= day1*24*60*60+ hour1*60*60+ minute1*60+ second1;
			}else if(year1==0 && month1==0 && day1==0){
				if(s_second<v_second){
					if(s_minute<1){
						s_hour= s_hour-1;
						s_minute = 59;
						s_second=s_second+60;
					}else{
						s_minute=s_minute-1;
						s_second=s_second+60;
					}
				}
				
				hour1=s_hour-v_hour;
				minute1 = s_minute-v_minute;
				second1= s_second-v_second;
				
				
				visitingTime= hour1*60*60+ minute1*60+ second1;
				
				if(visitingTime<=0){
					visitingTime=0;
				}				
			}
			
			model.addAttribute("visitingTime", visitingTime);
			System.out.println("오전방문시간: "+ visitingTime);
			}
		}
		
	
	
	@RequestMapping(value="/rt_auction/rt_auction", method=RequestMethod.GET)
	public void RT_detail(@RequestParam(value="rt_auction_no") String rt_auction_no, Model model)throws Exception{
		model.addAttribute(service.rt_detail(rt_auction_no));
	}
}
