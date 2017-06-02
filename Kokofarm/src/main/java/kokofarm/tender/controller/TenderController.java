package kokofarm.tender.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kokofarm.tender.domain.AuctionVO;
import kokofarm.tender.domain.SuccessVO;
import kokofarm.tender.domain.TenderVO;
import kokofarm.tender.service.TenderService;

@Controller
@RequestMapping("/tender/*")
public class TenderController {
	private static final Logger logger = LoggerFactory.getLogger(TenderController.class);
		
		@Inject
		private TenderService service;
		
		@RequestMapping("tenderform")
		public void tenderformGET(TenderVO tender, Model model) throws Exception{
			//상품이 뜨도록 로드
			AuctionVO auction= service.selectAuctionProduct(9);
			model.addAttribute("auction",auction);
			
			int current_price;
			
			if(service.selectCurrentPrice(9)!=null){
				current_price=service.selectCurrentPrice(9);
			}else{
				current_price=0;
			}
			model.addAttribute("current_price", current_price);
			
			//입찰내역 list
			List<TenderVO> list=service.AllTender(9);
			int tender_number = list.size();
			System.out.println(tender_number);
			model.addAttribute("tender_number",tender_number);
			System.out.println(list);
			model.addAttribute("list",list);
			
			
			String start_time = auction.getStart_date();
			System.out.println("시작시간 "+start_time);
			int s_year= Integer.parseInt(start_time.substring(0, 4));
			int s_month= Integer.parseInt(start_time.substring(5, 7));
			int s_day = Integer.parseInt(start_time.substring(8,10));
			int s_hour = Integer.parseInt(start_time.substring(11,13));
			int s_minute = Integer.parseInt(start_time.substring(14,16));
			int s_second = Integer.parseInt(start_time.substring(17,19));
			
			int startTime=s_hour*60*60+s_minute*60+s_second;
			System.out.println("시작시간(초) "+startTime);
			
			String end_time = auction.getEnd_date();
			System.out.println("끝나는시간 "+ end_time);
			int e_year = Integer.parseInt(end_time.substring(0,4));
			int e_month=Integer.parseInt(end_time.substring(5,7));
			int e_day=Integer.parseInt(end_time.substring(8,10));
			int e_hour=Integer.parseInt(end_time.substring(11,13));
			int e_minute= Integer.parseInt(end_time.substring(14,16));
			int e_second=Integer.parseInt(end_time.substring(17,19));
			
			int endTime=e_hour*60*60+e_minute*60+e_second;
			System.out.println("끝나는시간(초) "+endTime);
			
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
			
			int year1= e_year-v_year;
			int month1=e_month- v_month;
			int day1= e_day-v_day;
			int hour1=e_hour-v_hour;
			int minute1 = e_minute-v_minute;
			int second1= e_second-v_second;
					
			int visitingTime=0;
				
			if(year1==0 && month1==0 && day1>0){
				if(e_second<v_second){
					if(e_minute<1){
						e_hour= e_hour-1;
						e_minute = 59;
						e_second=e_second+60;
					}else{
						e_minute=e_minute-1;
						e_second=e_second+60;
					}
				}
				
				hour1=e_hour-v_hour;
				minute1 = e_minute-v_minute;
				second1= e_second-v_second;
		
				visitingTime= day1*24*60*60+ hour1*60*60+ minute1*60+ second1;
			}else if(year1==0 && month1==0 && day1==0){
				if(e_second<v_second){
					if(e_minute<1){
						e_hour= e_hour-1;
						e_minute = 59;
						e_second=e_second+60;
					}else{
						e_minute=e_minute-1;
						e_second=e_second+60;
					}
				}
				
				hour1=e_hour-v_hour;
				minute1 = e_minute-v_minute;
				second1= e_second-v_second;
				
				
				visitingTime= hour1*60*60+ minute1*60+ second1;
				
				if(visitingTime<=0){
					visitingTime=0;
				}				
			}
			System.out.println("방문시간: "+ visitingTime);
			model.addAttribute("visitingTime", visitingTime);
					
			int tender_no = 0;
			if(visitingTime==0){  
				if(current_price!=0){
					for(int i=0;i<list.size();i++){
						if(list.get(i).getTender_price()==current_price){
							 tender_no = list.get(i).getTender_no();
						}
					}
					service.insertSuccess(tender_no);
				}else{ //시간은 다됐는데 현재가=0  ==> 유찰 
					service.updateAuctionResult(9);  
				}
			}else{
				if(auction.getAuction_up()==current_price){
					visitingTime=0;
					model.addAttribute("visitingTime", visitingTime);
					for(int i=0;i<list.size();i++){
						if(list.get(i).getTender_price()==current_price){
							 tender_no = list.get(i).getTender_no();
						}
					}
					service.insertSuccess(tender_no);
				}
			}
		}
		
		@RequestMapping(value="tenderform", method=RequestMethod.POST)
		public String tenderformPOST(TenderVO tender, Model model) throws Exception{
			tender.setMember_id("aa");
			tender.setAuction_no(9);
			AuctionVO auction = service.selectAuctionProduct(9);
			int current_price;
			
			if(service.selectCurrentPrice(9)!=null){
				current_price=service.selectCurrentPrice(9);
			}else{
				current_price=0;
			}
			
			if(tender.getTender_price() < auction.getAuction_down() || tender.getTender_price() <= current_price){
				return "redirect:/tender/tenderform";
				
			}else{
				service.insertTender(tender);
				model.addAttribute("tender",tender);
				return "/tender/tenderfinish";
			}						
		}
		
}
