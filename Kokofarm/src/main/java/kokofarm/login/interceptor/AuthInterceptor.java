package kokofarm.login.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kokofarm.member.domain.MemberVO;
import kokofarm.member.service.MemberService;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Inject
	private MemberService service;
	
private void saveDest(HttpServletRequest request){
		
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		
		System.out.println("uri :" +uri);
		System.out.println("query :" +uri);
		
		if(query ==null || query.equals("null")){
			query = "";
		}else{
			query = "?" +query;
		}
		
		if (request.getMethod().equals("GET")){
			
			request.getSession().setAttribute("dest", uri+query);
		}
	}	
	

		
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login")== null){
			saveDest(request);
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie !=null){
				MemberVO memberVO = service.checkLoginBefore(loginCookie.getValue());
				
				if(memberVO !=null){
					session.setAttribute("login", memberVO);
					return true;
				}
			}
			
			response.sendRedirect("/member/login");
			
			return false;
			
		}
		return true;
	}
	
	

}
