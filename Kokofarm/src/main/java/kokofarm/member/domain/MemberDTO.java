package kokofarm.member.domain;

public class MemberDTO{
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_email;
	private String member_phoneNum;
	private String member_zipcode;
	private String member_address1;
	private String member_address2;
	private String member_account;
	private String member_grade;
	private String join_date;
	private String member_point;
				
	public String getMember_point() {
		return member_point;
	}

	public void setMember_point(String member_point) {
		this.member_point = member_point;
	}

	public MemberDTO(){
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
	public String getMember_phoneNum() {
		return member_phoneNum;
	}
	public void setMember_phoneNum(String member_phoneNum) {
		this.member_phoneNum = member_phoneNum;
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
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [member_id=" + member_id + ", member_password=" + member_password + ", member_name="
				+ member_name + ", member_email=" + member_email + ", member_phoneNum=" + member_phoneNum
				+ ", member_zipcode=" + member_zipcode + ", member_address1=" + member_address1 + ", member_address2="
				+ member_address2 + ", member_account=" + member_account + ", member_grade=" + member_grade
				+ ", join_date=" + join_date + ", member_point=" + member_point + "]";
	}

	
	
	
}
