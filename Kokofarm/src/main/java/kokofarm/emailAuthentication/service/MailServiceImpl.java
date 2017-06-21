package kokofarm.emailAuthentication.service;

import java.io.File;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kokofarm.emailAuthentication.persistence.EmailDao;

@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	private JavaMailSender javaMailSender ;
	
	@Inject
	private EmailDao dao;
		
	
	

	@Override
	public boolean send(String subject, String text, String from, String to, String filePath) {
		
		MimeMessage message = javaMailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setSubject(subject);
			helper.setText(text,true);
			helper.setFrom(from);
			helper.setTo(to);
			
			if (filePath != null){
				File file = new File(filePath);
				if(file.exists()){
					helper.addAttachment(file.getName(), new File(filePath));
				}
			}
			
			javaMailSender.send(message);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return false;
	}

	@Override
	public String userInfo(String member_email) throws Exception {
		
		return dao.userInfo(member_email);
	}

	@Transactional
	@Override
	public void changePw(Map<String, String> map) throws Exception {
		dao.changePw(map);
		
	}

	@Override
	public Integer passInfo(Map<String, String> map) throws Exception {
		return dao.passInfo(map);
	}

}
