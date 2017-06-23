package kokofarm.rtauction.domain;

import java.io.Serializable;

public class Rt_Auction_Phonenum implements Serializable{
	private String mobileReceiver1;
	private String mobileReceiver2;
	private String mobileReceiver3;
	
	public Rt_Auction_Phonenum() {}

	public Rt_Auction_Phonenum(String mobileReceiver1, String mobileReceiver2, String mobileReceiver3) {
		this.mobileReceiver1 = mobileReceiver1;
		this.mobileReceiver2 = mobileReceiver2;
		this.mobileReceiver3 = mobileReceiver3;
	}

	public String getMobileReceiver1() {
		return mobileReceiver1;
	}

	public void setMobileReceiver1(String mobileReceiver1) {
		this.mobileReceiver1 = mobileReceiver1;
	}

	public String getMobileReceiver2() {
		return mobileReceiver2;
	}

	public void setMobileReceiver2(String mobileReceiver2) {
		this.mobileReceiver2 = mobileReceiver2;
	}

	public String getMobileReceiver3() {
		return mobileReceiver3;
	}

	public void setMobileReceiver3(String mobileReceiver3) {
		this.mobileReceiver3 = mobileReceiver3;
	}

	@Override
	public String toString() {
		return "OrderFinish_Member_Phonenum [mobileReceiver1=" + mobileReceiver1 + ", mobileReceiver2="
				+ mobileReceiver2 + ", mobileReceiver3=" + mobileReceiver3 + "]";
	}
	
	
	
}
