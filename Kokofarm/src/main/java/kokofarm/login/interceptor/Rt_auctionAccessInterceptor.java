package kokofarm.login.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kokofarm.member.domain.MemberVO;

public class Rt_auctionAccessInterceptor extends HandlerInterceptorAdapter {
	private static List<String> list = new ArrayList<String>();

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		if (session.getAttribute("login") != null) {
			
			MemberVO vo = (MemberVO) session.getAttribute("login");
			System.out.println("ㅁ니ㅏㅇ럼ㄴ;ㅣㅏㅓㅇㄹ"+vo.toString());
		
			String m_id = vo.getMember_id();
			list.add("테스트");
			
			for (int i = 0; i < list.size(); i++) {
				if (m_id.equals(list.get(i))) {
					System.out.println("여기로?");
					response.sendRedirect("/");
					return false;
					
				}
			}
			list.add(m_id);
			
			
			for (int i =0; i<list.size();i++){
				System.out.println(list.get(i));
			}
		
		}

		return true;
	}

}
