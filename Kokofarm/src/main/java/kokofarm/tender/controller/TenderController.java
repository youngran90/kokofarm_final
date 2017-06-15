package kokofarm.tender.controller;

import java.lang.reflect.Member;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kokofarm.member.domain.MemberVO;
import kokofarm.tender.domain.AuctionVO;
import kokofarm.tender.domain.PayVO;
import kokofarm.tender.domain.SuccessPayVO;
import kokofarm.tender.domain.SuccessVO;
import kokofarm.tender.domain.TenderVO;
import kokofarm.tender.service.TenderService;

@Controller
@RequestMapping("/tender/*")
public class TenderController {
	private static final Logger logger = LoggerFactory.getLogger(TenderController.class);
		
		@Inject
		private TenderService service;
		
		@RequestMapping(value="tenderform", method=RequestMethod.GET)
		public void tenderformGET(TenderVO tender, Model model, @RequestParam("auction_no") int auction_no) throws Exception{
			//HttpServletRequest request = null;
			//System.out.println("넘어오나요 "+auction_no);
			
			/*HttpSession session = request.getSession();
			MemberVO member = (MemberVO)session.getAttribute("login");
			if(member!=null){
				String id= member.getMember_id();
				System.out.println("세션아이디:::::::::::::::"+id);
				model.addAttribute("id",id);
			}*/
			
			//상품이 뜨도록 로드
			AuctionVO auction= service.selectAuctionProduct(auction_no);
			model.addAttribute("auction",auction);
			
			int current_price;
			
			if(service.selectCurrentPrice(auction_no)!=null){
				current_price=service.selectCurrentPrice(auction_no);
			}else{
				current_price=0;
			}
			model.addAttribute("current_price", current_price);
			
			
			
			//입찰내역 list
			List<TenderVO> list= service.AllTender(auction_no);
			//List<TenderVO> copy_list=new ArrayList<TenderVO>();
			//@SuppressWarnings("unchecked")
			//List<TenderVO> s_list=(List<TenderVO>)list.clone();
 			List<TenderVO> s_list = new ArrayList<TenderVO>();
			
			System.out.println("s_list "+ s_list);
			//List<TenderVO> s_list = new ArrayList<TenderVO>();
			//List<TenderVO> s_list;
			
			//System.out.println("=======================s_list==========="+s_list);
			String m_id=null;
			
			if(list!=null){
				
				for(int i=0;i<list.size();i++){
					int tender_no= list.get(i).getTender_no();
					String member_id = list.get(i).getMember_id();
					int tender_price = list.get(i).getTender_price();
					Timestamp tender_date = list.get(i).getTender_date();
					int auction_no2 = list.get(i).getAuction_no();
					
					TenderVO tender1 = new TenderVO(tender_no, member_id, tender_price, tender_date, auction_no2);
					s_list.add(tender1);
					System.out.println("s_list"+s_list);
				}
				
				for(int i=0;i<list.size();i++){
					
					System.out.println("==========s_list에 들어가는 내용:========="+s_list);
					
					m_id =s_list.get(i).getMember_id();
					//copy_list.get(i).setMember_id(m_id);
					// list에 있는 아이디를 얻어  m_id에 넣고, replace하여 list의 아이디도 바껴있다. 
					String s_id=m_id.replace(m_id.substring(m_id.length()-3, m_id.length()),"***");
					
					
					System.out.println("================밑의 m_id======="+m_id);
					System.out.println(s_id);
				
					s_list.get(i).setMember_id(s_id);
					//list.get(i).setMember_id(m_id);
				}
				int tender_number = list.size();
				System.out.println(tender_number);
				model.addAttribute("tender_number",tender_number);
				//System.out.println(copy_list);
				model.addAttribute("s_list",s_list);
				
				System.out.println(s_list);
			}
			
			/*for(int i=0;i<list.size();i++){
				list.get(i).setMember_id(m_id);
			}*/
			
			System.out.println(list);
			//System.out.println(copy_list);
			//System.out.println("밖의 s_list"+s_list);
			
			
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
			String member_id =null;
			List<SuccessVO> successList=service.selectSuccess();
			System.out.println("=========================successlist 테스트======================="+successList);
			
			if(visitingTime==0){  
				if(current_price!=0){
					for(int i=0;i<list.size();i++){
						if(list.get(i).getTender_price()==current_price){
							 tender_no =list.get(i).getTender_no();
							 member_id =list.get(i).getMember_id();
							 System.out.println("안의 member_id "+member_id);
						}
					}
					
					System.out.println("멤버아이디: "+member_id);
					model.addAttribute("member_id",member_id);
					
					//List<SuccessVO> successList=service.selectSuccess();
					int same_count=0;
					if(successList.size()==0){
						service.insertSuccess(tender_no);
						service.updateAuctionSuccess(auction_no);
					}else{
						for(int i=0;i<successList.size();i++){
							if(tender_no!=0){
								if(tender_no==successList.get(i).getTender_no()){
									same_count++;
								}
							}
						}
						System.out.println("======================if문 위 same_count================="+same_count);
						if(same_count==0){
							service.insertSuccess(tender_no);
							service.updateAuctionSuccess(auction_no);
						}
					}	
				}else{ //시간은 다됐는데 현재가=0  ==> 유찰 
					service.updateAuctionResult(auction_no);  
				}
			}else{
				if(auction.getAuction_up()==current_price){
					visitingTime=0;
					model.addAttribute("visitingTime", visitingTime);
					for(int i=0;i<list.size();i++){
						//copy_list.get(i).setMember_id(m_id);
						if(list.get(i).getTender_price()==current_price){
							
							 tender_no = list.get(i).getTender_no();
							 member_id = list.get(i).getMember_id();
							 System.out.println("안의 member_id "+member_id);
						}
					}
					System.out.println("멤버아이디: "+member_id);
					model.addAttribute("member_id",member_id);
					
					//List<SuccessVO> successList=service.selectSuccess();
					int same_count=0;
					if(successList.size()==0){
						service.insertSuccess(tender_no);
						service.updateAuctionSuccess(auction_no);
						
					}else{
						for(int i=0;i<successList.size();i++){
							if(tender_no!=0){
								if(tender_no==successList.get(i).getTender_no()){
									same_count++;
									
								}
							}
						}
						if(same_count==0){
							service.insertSuccess(tender_no);
							service.updateAuctionSuccess(auction_no);
						}
					}	
				}
			}
			model.addAttribute("tender_no",tender_no);
		}
		
		@RequestMapping(value="tenderform", method=RequestMethod.POST)
		public String tenderformPOST(HttpServletRequest request,TenderVO tender, Model model, @RequestParam("auction_no") int auction_no) throws Exception{
			HttpSession session = request.getSession();
			MemberVO member= (MemberVO)session.getAttribute("login");
			
			tender.setMember_id(member.getMember_id());
			//tender.setMember_id("asdf123");
			System.out.println("==============post옥션번호: ============="+auction_no);
			
			tender.setAuction_no(auction_no);
			AuctionVO auction = service.selectAuctionProduct(auction_no);
			int current_price;
			
			if(service.selectCurrentPrice(auction_no)!=null){
				current_price=service.selectCurrentPrice(auction_no);
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
		
		@RequestMapping("tenderpay")
		public void tenderpay(@RequestParam(value="tender_no") Integer tender_no, @RequestParam(value="member_id") String member_id, @RequestParam("auction_title_img") String auction_title_img, Model model) throws Exception{
			System.out.println("=============이미지 받아오기================"+auction_title_img);
			model.addAttribute("auction_title_img",auction_title_img);
			System.out.println("장바구니로 넘어오는가");
			List<SuccessVO> successlist= service.selectSuccess();
			System.out.println("낙찰리스트: "+successlist);
			System.out.println("넘어온 입찰자 번호: "+tender_no);
			TenderVO tender = service.selectTender(tender_no);
			System.out.println("낙찰자 정보: "+tender);
			
			SuccessPayVO successPay=null;
			
			for(int i=0;i<successlist.size();i++){
				if(tender_no==successlist.get(i).getTender_no()){
					System.out.println("for문 안 tender: "+tender);
					successPay= service.selectSuccessPay(tender);
					System.out.println("장바구니: "+successPay);
				  }
			}
			
			System.out.println("for문밖 successPay"+successPay);
			model.addAttribute("successPay",successPay);
					
		}
		
		@RequestMapping(value="paycomplete", method=RequestMethod.POST)
		public void paycomplete(PayVO payvo, Model model, @RequestParam("address_sub") String address_sub, @RequestParam("recipientpost") String recipientpost,
					    @RequestParam("mobileReceiver2") String mobileReceiver2, @RequestParam("mobileReceiver3") String mobileReceiver3,
					    @RequestParam("phoneReceiver2") String phoneReceiver2, @RequestParam("phoneReceiver3") String phoneReceiver3) throws Exception{
			
			String ship_area = "우편번호: "+recipientpost+", 상세주소: "+payvo.getShip_area()+", "+address_sub;
			System.out.println("주소: "+ship_area);
			payvo.setShip_area(ship_area);
		
		
			String phone_no = payvo.getPhone_no()+"-"+mobileReceiver2+"-"+mobileReceiver3;
			System.out.println("휴대폰번호: "+phone_no);
			payvo.setPhone_no(phone_no);
			
			String tel_no= payvo.getTel_no()+"-"+phoneReceiver2+"-"+phoneReceiver3;
			System.out.println("전화번호 앞자리: "+payvo.getTel_no());
			System.out.println("전화번호: "+tel_no);
			payvo.setTel_no(tel_no);
			
			/*if(payvo.getPay_sort()=="신용카드"){
				payvo.setAccount("null");
				payvo.setDeposit_name("null");
			}else if(payvo.getPay_sort()=="무통장입금"){
				payvo.setCard_sort("null");
				payvo.setPeriod("null");
			}else{
				payvo.setAccount("null");
				payvo.setDeposit_name("null");
				payvo.setCard_sort("null");
				payvo.setPeriod("null");
			}*/
		
				
			System.out.println(payvo);
			
			service.insertPayInfo(payvo);
			//service.updateSuccess(payvo.getPay_no());
			
			List<PayVO> payinfolist =service.selectPayInfo();
			/*if(payinfolist==null){
				
			}*/
			for(int i=0;i<payinfolist.size();i++){
				if(payinfolist.get(i).getSuccess_no()==payvo.getSuccess_no()){
					payvo=payinfolist.get(i);  //pay_no이 seq이므로 insert할떄의 payvo는 pay_no을 null로 표시하기 때문에 전체적으로 뽑아 리스트에 담아 payvo에 저장해 데이터를 뷰로 넘긴다.
					service.updateSuccess(payvo);
					model.addAttribute("payvo",payvo);
				}
			}
			
		}
		/*@RequestMapping("payend")
		public String payend() throws Exception{
			return "../mypage/auction_view";
		}*/
}
