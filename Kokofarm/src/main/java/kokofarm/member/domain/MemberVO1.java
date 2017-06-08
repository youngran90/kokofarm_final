package kokofarm.member.domain;

import java.io.Serializable;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberVO1 implements Serializable{

	private static final long serialVersionUID = 1L;


	public MemberVO1(){
	}
	
	
	//@Pattern(regexp ="^[a-z0-9A-Z_]{6,15}$", message= "6~15자 특수문자 사용금지")
	private String member_id;
	
	
	//@Pattern(regexp = "^(?=.*[a-zA-Z])((?=.*\\d)|(?=.*\\W)).{5,20}$",message = "6~15자 영어,숫자포함")
	private String member_password;
	

	//@Pattern(regexp="^[가-힣]{2,8}$", message="한글 외 사용금지")
		private String member_name;
	
	
	/*@Pattern(regexp = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i", message ="이메일 형식이 옳바르지 않습니다.")*/
	//@Email(message="올바른 이메일 형식이 아닙니다.")
	private String member_email;
	
	//@Pattern(regexp = "^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$", message = "핸드폰 번호를 다시 입력해 주세요")
	private String member_phoneNum;
	private String member_phoneNum1;
	private String member_phoneNum2;
	private String member_phoneNum3;
	
	


	private String member_tel1;
	private String member_tel2;
	private String member_tel3;
	
				
	private String member_zipcode;
	private String member_address1;
	private String member_address2;
	private String member_account;
	private String join_date;
	private String member_point;
	
		
	private String member_tele;
	public String getMember_phoneNum() {
		return member_phoneNum;
	}

	public void setMember_phoneNum(String member_phoneNum) {
		this.member_phoneNum = member_phoneNum;
	}

	public String getMember_tele() {
		return member_tele;
	}

	public void setMember_tele(String member_tele) {
		this.member_tele = member_tele;
	}
				
	public String getMember_point() {
		return member_point;
	}

	public void setMember_point(String member_point) {
		this.member_point = member_point;
	}

	public String getMember_phoneNum2() {
		return member_phoneNum2;
	}

	public void setMember_phoneNum2(String member_phoneNum2) {
		this.member_phoneNum2 = member_phoneNum2;
	}

	public String getMember_phoneNum3() {
		return member_phoneNum3;
	}

	public void setMember_phoneNum3(String member_phoneNum3) {
		this.member_phoneNum3 = member_phoneNum3;
	}

	public String getMember_tel1() {
		return member_tel1;
	}

	public void setMember_tel1(String member_tel1) {
		this.member_tel1 = member_tel1;
	}

	public String getMember_tel2() {
		return member_tel2;
	}

	public void setMember_tel2(String member_tel2) {
		this.member_tel2 = member_tel2;
	}

	public String getMember_tel3() {
		return member_tel3;
	}

	public void setMember_tel3(String member_tel3) {
		this.member_tel3 = member_tel3;
	}

	
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
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
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_phoneNum1() {
		return member_phoneNum1;
	}
	public void setMember_phoneNum1(String member_phoneNum1) {
		this.member_phoneNum1 = member_phoneNum1;
	}
	public String getMember_zipcode() {
		return member_zipcode;
	}
	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}
	public String getMember_address1() {
		return member_address1;
	}
	public void setMember_address1(String member_address1) {
		this.member_address1 = member_address1;
	}
	public String getMember_address2() {
		return member_address2;
	}
	public void setMember_address2(String member_address2) {
		this.member_address2 = member_address2;
	}
	public String getMember_account() {
		return member_account;
	}
	public void setMember_account(String member_account) {
		this.member_account = member_account;
	}

	@Override
	public String toString() {
		return "MemberVO1 [member_id=" + member_id + ", member_password=" + member_password + ", member_name="
				+ member_name + ", member_email=" + member_email + ", member_phoneNum1=" + member_phoneNum1
				+ ", member_phoneNum2=" + member_phoneNum2 + ", member_phoneNum3=" + member_phoneNum3 + ", member_tel1="
				+ member_tel1 + ", member_tel2=" + member_tel2 + ", member_tel3=" + member_tel3 + ", member_zipcode="
				+ member_zipcode + ", member_address1=" + member_address1 + ", member_address2=" + member_address2
				+ ", member_account=" + member_account + ", join_date=" + join_date + ", member_point=" + member_point
				+ "]";
	}

	
	
	
	
	
}
