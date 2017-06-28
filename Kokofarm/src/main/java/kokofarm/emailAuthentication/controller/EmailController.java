package kokofarm.emailAuthentication.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kokofarm.emailAuthentication.service.MailService;

@Controller
public class EmailController {

	@Inject
	private MailService service;
	private int ran;
		
	
	//회원가입 이메일 인증
	public boolean sendMailAuth(HttpSession session, @RequestParam String email){
		int ran = new Random().nextInt(100000) +10000; // 10000~ 99999
		
		return true;
	}
	
	//아이디 찾기
	@RequestMapping(value ="/sendMail/id", method=RequestMethod.POST)
	public String sendMailId(HttpSession session, @RequestParam String member_email, RedirectAttributes ra) throws Exception{
		
		String member_id = service.userInfo(member_email);
		
				
		if(member_id !=null ){
			String subject = "아이디 찾기 안내 입니다.  회신불가";
			StringBuilder sb = new StringBuilder();
			
			sb.append("귀하의 아이디는 " + member_id + "입니다. ");
			service.send(subject, sb.toString(),"kokofarm@gmail.com", member_email, null);
			ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 가입된 아이디를 보내 드렸습니다. ");
		}else{
			ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 가입된 회원이 존재 하지 않습니다.");
		}
		return "redirect:/find/id";
	}
	
	@RequestMapping(value = "/sendMail/password", method = RequestMethod.POST)
	public String sendMailPassword(HttpSession session,@RequestParam String member_email,@RequestParam String member_id, RedirectAttributes ra,
													Model model ) throws Exception{
		ran = new Random().nextInt(100000) +10000; // 10000~ 99999
		String email = member_email;
		String id = member_id;
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("member_id", id);
		map.put("member_email", email);
		
		int userInfo = service.passInfo(map);
			
		if (userInfo !=0){
			String subject = "비밀 번호 찾기 인증번호 입니다.  회신불가";
			StringBuilder sb = new StringBuilder();
			
			sb.append("인증 번호 : [" + ran + "] 를 입력 해 주세요 ");
			service.send(subject, sb.toString(),"KokoFarm@kosta.com", member_email, null);
			ra.addFlashAttribute("resultMsg", "이메일로 보내드린 인증번호를 아래 입력하세요. ");
			ra.addFlashAttribute("authNum",ran);
			ra.addFlashAttribute("member_id",id);
			}else{
			ra.addFlashAttribute("resultMsg", "귀하의 정보로 가입된 회원이 존재 하지 않습니다.");
		}
		return "redirect:/find/password";
	}
		
	
	
	@RequestMapping("/find/id")
	public void findId() throws Exception{
		
			
	}
	
	@RequestMapping("/find/password")
	public void authpassword() throws Exception{
				
	}
	
	@RequestMapping(value="/update/passwordForm", method = RequestMethod.POST)
	public String updatePw(@RequestParam("member_id")String member_id, RedirectAttributes ra) throws Exception{
		String m_id = member_id;
		ra.addAttribute("member_id",m_id);
		
		return "/find/updatePw";
	}
	
	
	@RequestMapping(value="/update/password", method=RequestMethod.POST)
	@ResponseBody
	public void updatePw(@RequestParam("member_id")String member_id, @RequestParam("member_password") String member_password) throws Exception{
		String pw = member_password;
		Map<String, String> map = new HashMap<String,String>();
		map.put("member_id", member_id);
		map.put("member_password", pw);
		service.changePw(map);
		
		
	}
	
	@RequestMapping(value = "/find/authPw", method = RequestMethod.GET)
	@ResponseBody
	public int authNum(@RequestParam("authNum") int authNum) throws Exception{
		
		int num = authNum;
		if(num == ran){
			return 1;
		}else {
			return 0;
		}
	}
	
	
}
