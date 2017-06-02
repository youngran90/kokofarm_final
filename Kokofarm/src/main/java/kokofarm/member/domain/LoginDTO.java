package kokofarm.member.domain;

import java.io.Serializable;

public class LoginDTO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String member_id;
	private String member_password;
	private boolean useCookie;
	
	public LoginDTO(){
		
	}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	@Override
	public String toString() {
		return "LoginDTO [member_id=" + member_id + ", member_password=" + member_password + ", useCookie=" + useCookie
				+ "]";
	}
	
	
}
