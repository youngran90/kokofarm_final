package kokofarm.mypage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kokofarm.member.domain.MemberVO;
import kokofarm.mypage.domain.AuctionViewVO;
import kokofarm.mypage.domain.SuccessViewDetailVO;
import kokofarm.mypage.domain.SuccessViewVO;
import kokofarm.mypage.domain.TenderViewVO;
import kokofarm.mypage.service.AuctionViewService;
import kokofarm.rtauction.domain.RtAuctionFinishListVO;
import kokofarm.rtauction.service.RtAuctionService;


@Controller
@RequestMapping("/mypage/*")
public class AuctionViewController {
	private static final Logger logger = LoggerFactory.getLogger(AuctionViewController.class);
	
	@Inject
	private AuctionViewService service;
	
	@Inject
	private RtAuctionService rt_service;
	
	@RequestMapping("auction_view")
	public void auction_view(HttpServletRequest request, Model model) throws Exception{
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		String member_id = member.getMember_id();
		String seller_no = member.getSeller_no();
		
		
		
		/*System.out.println("tender_no: "+tender_no);
		System.out.println("member_id: "+member_id);
		System.out.println("auction_title_img: "+auction_title_img);
		
		model.addAttribute("tender_no",tender_no);
		model.addAttribute("member_id",member_id);
		model.addAttribute("auction_title_img",auction_title_img);*/
		
		model.addAttribute("member_id",member_id);
		
		if(seller_no !=null){
		
			//tenderlist => tender테이블의 모든 데이터 추출
			List<TenderViewVO> tenderlist = service.selectTenderAll();
		System.out.println("tenderlist"+tenderlist);
		

		//success => success테이블의 모든 데이터 추출
		List<SuccessViewVO> success = service.selectSuccessView();
		SuccessViewDetailVO successdetail;
		List<SuccessViewDetailVO> successViewList=new ArrayList<SuccessViewDetailVO>();
		
		for(int i=0;i<success.size();i++){
			
			for(int j=0;j<tenderlist.size();j++){
				System.out.println("tender======"+tenderlist.get(j).getTender_no());
				System.out.println("success====="+success.get(i).getTender_no());
				System.out.println("tender_member_id====="+ tenderlist.get(j).getMember_id());
				System.out.println("member_id======"+member_id);
				if(tenderlist.get(j).getTender_no()==success.get(i).getTender_no()){
					if(tenderlist.get(j).getMember_id().equals(member_id)){
						//auctionViewList.add(tenderlist.get(j).getAuction_no());
						System.out.println("넘어오니");
						int success_no = success.get(i).getSuccess_no();
						int tender_no2 = success.get(i).getTender_no();
						String pay_state = success.get(i).getPay_state();
						System.out.println("=================경매번호"+tenderlist.get(j).getAuction_no());
						int auction_no2 = tenderlist.get(j).getAuction_no();
						String auction_title_img2 = service.selectAuctionAll(tenderlist.get(j).getAuction_no()).getAuction_title_img();
						System.out.println("================이미지"+auction_title_img2);
						String auction_name2 = service.selectAuctionAll(tenderlist.get(j).getAuction_no()).getAuction_name();
						int tender_price2 = tenderlist.get(j).getTender_price();
						
						successdetail = new SuccessViewDetailVO(success_no, tender_no2, pay_state, auction_name2, tender_price2, auction_no2, auction_title_img2);
						
						successViewList.add(successdetail);
						System.out.println("for문안successViewList1111111 "+successViewList);
					}
				}
			}
			
			System.out.println("for문안successViewList "+successViewList);
		}
		
		System.out.println(successViewList);
		
		model.addAttribute("successViewList",successViewList);
		
		//입찰내역
		List<TenderViewVO> tenderViewList = service.selectTenderView(member_id);
		model.addAttribute("tenderViewList",tenderViewList);
		
		//seller_no 이 null 이 아닐경우
			List<AuctionViewVO> sellerlist = service.selectAuctionSeller(seller_no);
			model.addAttribute("sellerlist",sellerlist);
			System.out.println("들어오니");
			
		}else{
			List<TenderViewVO> tenderlist = service.selectTenderAll();
			System.out.println("tenderlist"+tenderlist);
			

			List<SuccessViewVO> success = service.selectSuccessView();
			SuccessViewDetailVO successdetail;
			List<SuccessViewDetailVO> successViewList=new ArrayList<SuccessViewDetailVO>();
			
			for(int i=0;i<success.size();i++){
				
				for(int j=0;j<tenderlist.size();j++){
					System.out.println("tender======"+tenderlist.get(j).getTender_no());
					System.out.println("success====="+success.get(i).getTender_no());
					System.out.println("tender_member_id====="+ tenderlist.get(j).getMember_id());
					System.out.println("member_id======"+member_id);
					if(tenderlist.get(j).getTender_no()==success.get(i).getTender_no()){
						if(tenderlist.get(j).getMember_id().equals(member_id)){
							//auctionViewList.add(tenderlist.get(j).getAuction_no());
							System.out.println("넘어오니");
							int success_no = success.get(i).getSuccess_no();
							int tender_no2 = success.get(i).getTender_no();
							String pay_state = success.get(i).getPay_state();
							System.out.println("=================경매번호"+tenderlist.get(j).getAuction_no());
							int auction_no2 = tenderlist.get(j).getAuction_no();
							String auction_title_img2 = service.selectAuctionAll(tenderlist.get(j).getAuction_no()).getAuction_title_img();
							System.out.println("================이미지"+auction_title_img2);
							String auction_name2 = service.selectAuctionAll(tenderlist.get(j).getAuction_no()).getAuction_name();
							int tender_price2 = tenderlist.get(j).getTender_price();
							
							successdetail = new SuccessViewDetailVO(success_no, tender_no2, pay_state, auction_name2, tender_price2, auction_no2, auction_title_img2);
							
							successViewList.add(successdetail);
							System.out.println("for문안successViewList1111111 "+successViewList);
						}
					}
				}
				
				System.out.println("for문안successViewList "+successViewList);
			}
			
			System.out.println(successViewList);
			
			model.addAttribute("successViewList",successViewList);
			
			List<TenderViewVO> tenderViewList = service.selectTenderView(member_id);
			model.addAttribute("tenderViewList",tenderViewList);
			System.out.println("이리로는넘어오니");
		}
		
		
		
		//여기서 부터 실시간 경매 출력
		List<RtAuctionFinishListVO> rt_list = rt_service.rt_auction_finish_list(member_id);
		model.addAttribute("rt_list",rt_list);
	}
	

}
