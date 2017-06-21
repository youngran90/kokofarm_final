package kokofarm.emailAuthentication.service;

import java.util.Map;

public interface MailService {
	public boolean send(String subject, String text, String from,String to,String filePath);
	//subject 제목	//text 내용	//from 보내는 메일 주소	// to 받는 메일주소
	//filePath 첨부파일 경로 ; 없을시 null
	
	public String userInfo(String member_email) throws Exception;
	public void changePw(Map<String, String> map) throws Exception;
	public Integer passInfo(Map<String, String>map) throws Exception;
	
}
