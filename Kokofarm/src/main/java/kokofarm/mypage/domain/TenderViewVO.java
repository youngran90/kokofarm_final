package kokofarm.mypage.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class TenderViewVO implements Serializable{
	private int tender_no;
	private String member_id;
	private int tender_price;
	private Timestamp tender_date;
	private int auction_no;
	public int getTender_no() {
		return tender_no;
	}
	public void setTender_no(int tender_no) {
		this.tender_no = tender_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getTender_price() {
		return tender_price;
	}
	public void setTender_price(int tender_price) {
		this.tender_price = tender_price;
	}
	public Timestamp getTender_date() {
		return tender_date;
	}
	public void setTender_date(Timestamp tender_date) {
		this.tender_date = tender_date;
	}
	public int getAuction_no() {
		return auction_no;
	}
	public void setAuction_no(int auction_no) {
		this.auction_no = auction_no;
	}
	@Override
	public String toString() {
		return "TenderViewVO [tender_no=" + tender_no + ", member_id=" + member_id + ", tender_price=" + tender_price
				+ ", tender_date=" + tender_date + ", auction_no=" + auction_no + "]";
	}
	
	

}
