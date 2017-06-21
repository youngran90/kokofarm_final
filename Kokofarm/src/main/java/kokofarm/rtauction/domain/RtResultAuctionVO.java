package kokofarm.rtauction.domain;

import java.sql.Timestamp;

public class RtResultAuctionVO {
	private String rt_tender_no;
	private String member_id;
	private int rt_tender_price;
	private Timestamp rt_tender_date;
	private String rt_auction_no;

	public RtResultAuctionVO() {}

	public RtResultAuctionVO(String rt_tender_no, String member_id, int rt_tender_price, Timestamp rt_tender_date,
			String rt_auction_no) {
		super();
		this.rt_tender_no = rt_tender_no;
		this.member_id = member_id;
		this.rt_tender_price = rt_tender_price;
		this.rt_tender_date = rt_tender_date;
		this.rt_auction_no = rt_auction_no;
	}

	public String getRt_tender_no() {
		return rt_tender_no;
	}

	public void setRt_tender_no(String rt_tender_no) {
		this.rt_tender_no = rt_tender_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getRt_tender_price() {
		return rt_tender_price;
	}

	public void setRt_tender_price(int rt_tender_price) {
		this.rt_tender_price = rt_tender_price;
	}

	public Timestamp getRt_tender_date() {
		return rt_tender_date;
	}

	public void setRt_tender_date(Timestamp rt_tender_date) {
		this.rt_tender_date = rt_tender_date;
	}

	public String getRt_auction_no() {
		return rt_auction_no;
	}

	public void setRt_auction_no(String rt_auction_no) {
		this.rt_auction_no = rt_auction_no;
	}

	@Override
	public String toString() {
		return "result_rt_auction [rt_tender_no=" + rt_tender_no + ", member_id=" + member_id + ", rt_tender_price="
				+ rt_tender_price + ", rt_tender_date=" + rt_tender_date + ", rt_auction_no=" + rt_auction_no + "]";
	}

}
