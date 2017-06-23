package kokofarm.rtauction.domain;

import java.io.Serializable;

public class Rt_Auction_Address implements Serializable{
	private String recipientpost;
	private String address;
	private String address_sub;
	
	public Rt_Auction_Address() {
	}

	public Rt_Auction_Address(String recipientpost, String address, String address_sub) {
		super();
		this.recipientpost = recipientpost;
		this.address = address;
		this.address_sub = address_sub;
	}

	public String getRecipientpost() {
		return recipientpost;
	}

	public void setRecipientpost(String recipientpost) {
		this.recipientpost = recipientpost;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress_sub() {
		return address_sub;
	}

	public void setAddress_sub(String address_sub) {
		this.address_sub = address_sub;
	}

	@Override
	public String toString() {
		return "OrderFinish_Member_Address [recipientpost=" + recipientpost + ", address=" + address + ", address_sub="
				+ address_sub + "]";
	}
	
	
}
