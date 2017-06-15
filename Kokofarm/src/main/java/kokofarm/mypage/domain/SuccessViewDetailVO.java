package kokofarm.mypage.domain;

import java.io.Serializable;

public class SuccessViewDetailVO implements Serializable{
	private int success_no;
	private int tender_no;
	private String pay_state;
	private String auction_name;
	private int tender_price;
	private int auction_no;
	private String auction_title_img;
	
	public SuccessViewDetailVO() {}
	
	
	public SuccessViewDetailVO(int success_no, int tender_no, String pay_state, String auction_name, int tender_price,
			int auction_no, String auction_title_img) {
		super();
		this.success_no = success_no;
		this.tender_no = tender_no;
		this.pay_state = pay_state;
		this.auction_name = auction_name;
		this.tender_price = tender_price;
		this.auction_no = auction_no;
		this.auction_title_img = auction_title_img;
	}





	public String getAuction_name() {
		return auction_name;
	}


	public void setAuction_name(String auction_name) {
		this.auction_name = auction_name;
	}


	public int getTender_price() {
		return tender_price;
	}

	public void setTender_price(int tender_price) {
		this.tender_price = tender_price;
	}

	public int getAuction_no() {
		return auction_no;
	}


	public void setAuction_no(int auction_no) {
		this.auction_no = auction_no;
	}


	public int getSuccess_no() {
		return success_no;
	}

	public void setSuccess_no(int success_no) {
		this.success_no = success_no;
	}

	public int getTender_no() {
		return tender_no;
	}

	public void setTender_no(int tender_no) {
		this.tender_no = tender_no;
	}

	public String getPay_state() {
		return pay_state;
	}

	public void setPay_state(String pay_state) {
		this.pay_state = pay_state;
	}

	public String getAuction_title_img() {
		return auction_title_img;
	}

	public void setAuction_title_img(String auction_title_img) {
		this.auction_title_img = auction_title_img;
	}


	@Override
	public String toString() {
		return "SuccessViewDetailVO [success_no=" + success_no + ", tender_no=" + tender_no + ", pay_state=" + pay_state
				+ ", auction_name=" + auction_name + ", tender_price=" + tender_price + ", auction_no=" + auction_no
				+ ", auction_title_img=" + auction_title_img + "]";
	}

	

	

	

}
