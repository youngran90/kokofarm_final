package kokofarm.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

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
			
			response.sendRedirect("/member/login");
			
			return false;
			
		}
		return true;
	}
	
	

}
