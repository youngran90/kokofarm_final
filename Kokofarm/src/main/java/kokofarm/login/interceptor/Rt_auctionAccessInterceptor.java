package kokofarm.login.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kokofarm.member.domain.MemberVO;

public class Rt_auctionAccessInterceptor extends HandlerInterceptorAdapter {
	private static List<String> list = new ArrayList<String>();
	String m_id;
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		
	}



	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		
		if (session.getAttribute("login") != null) {
			
			MemberVO vo = (MemberVO) session.getAttribute("login");
				
			m_id = vo.getMember_id();
			
			System.out.println("누구아이디 :"+m_id);		
			for (int i = 0; i < list.size(); i++) {
				if (m_id.equals(list.get(i))) {
					System.out.println("여기로?");
					response.sendRedirect("/");
					return false;
					
				}
			}
			list.add(m_id);
			System.out.println(list.get(0));
					
		
		}

		return true;
	}

}
