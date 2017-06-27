package kokofarm.rtauction.domain;

import java.sql.Timestamp;

public class RtAuctionFinishListVO {
	private String rt_tender_finish_no;
	private String rt_auction_title_img;
	private String rt_auction_name;
	private int rt_tender_price;
	private String rt_tender_date;

	public RtAuctionFinishListVO() {
	}

	public RtAuctionFinishListVO(String rt_tender_finish_no, String rt_auction_title_img, String rt_auction_name,
			int rt_tender_price, String rt_tender_date) {
		super();
		this.rt_tender_finish_no = rt_tender_finish_no;
		this.rt_auction_title_img = rt_auction_title_img;
		this.rt_auction_name = rt_auction_name;
		this.rt_tender_price = rt_tender_price;
		this.rt_tender_date = rt_tender_date;
	}

	public String getRt_tender_finish_no() {
		return rt_tender_finish_no;
	}

	public void setRt_tender_finish_no(String rt_tender_finish_no) {
		this.rt_tender_finish_no = rt_tender_finish_no;
	}

	public String getRt_auction_title_img() {
		return rt_auction_title_img;
	}

	public void setRt_auction_title_img(String rt_auction_title_img) {
		this.rt_auction_title_img = rt_auction_title_img;
	}

	public String getRt_auction_name() {
		return rt_auction_name;
	}

	public void setRt_auction_name(String rt_auction_name) {
		this.rt_auction_name = rt_auction_name;
	}

	public int getRt_tender_price() {
		return rt_tender_price;
	}

	public void setRt_tender_price(int rt_tender_price) {
		this.rt_tender_price = rt_tender_price;
	}

	public String getRt_tender_date() {
		return rt_tender_date;
	}

	public void setRt_tender_date(String rt_tender_date) {
		this.rt_tender_date = rt_tender_date;
	}

	@Override
	public String toString() {
		return "RtAuctionFinishListVO [rt_tender_finish_no=" + rt_tender_finish_no + ", rt_auction_title_img="
				+ rt_auction_title_img + ", rt_auction_name=" + rt_auction_name + ", rt_tender_price=" + rt_tender_price
				+ ", rt_tender_date=" + rt_tender_date + "]";
	}

}
