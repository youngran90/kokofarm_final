package kokofarm.orderproduct.domain;

public class OrderFinish_Member_Homenum {
	private String phoneReceiver1;
	private String phoneReceiver2;
	private String phoneReceiver3;
	
	public OrderFinish_Member_Homenum() {}

	public OrderFinish_Member_Homenum(String phoneReceiver1, String phoneReceiver2, String phoneReceiver3) {
		this.phoneReceiver1 = phoneReceiver1;
		this.phoneReceiver2 = phoneReceiver2;
		this.phoneReceiver3 = phoneReceiver3;
	}

	public String getPhoneReceiver1() {
		return phoneReceiver1;
	}

	public void setPhoneReceiver1(String phoneReceiver1) {
		this.phoneReceiver1 = phoneReceiver1;
	}

	public String getPhoneReceiver2() {
		return phoneReceiver2;
	}

	public void setPhoneReceiver2(String phoneReceiver2) {
		this.phoneReceiver2 = phoneReceiver2;
	}

	public String getPhoneReceiver3() {
		return phoneReceiver3;
	}

	public void setPhoneReceiver3(String phoneReceiver3) {
		this.phoneReceiver3 = phoneReceiver3;
	}

	@Override
	public String toString() {
		return "OrderFinish_Member_Homenum [phoneReceiver1=" + phoneReceiver1 + ", phoneReceiver2=" + phoneReceiver2
				+ ", phoneReceiver3=" + phoneReceiver3 + "]";
	}

	
}
