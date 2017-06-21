package kokofarm.emailAuthentication.persistence;

import java.util.Map;

public interface EmailDao {
	public String userInfo(String email) throws Exception;
	public void changePw(Map<String, String> map) throws Exception; 
	public Integer passInfo(Map<String, String> map) throws Exception;
	
	
}
