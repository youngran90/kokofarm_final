package kokofarm.rtauction.domain;

public class RtResultAuctionListVO {
	private String rt_tender_no;
	private String rt_auction_group;
	private String rt_auction_title_img;
	private String rt_auction_name;
	private String rt_auction_unit;
	private int rt_tender_price;
	private String rt_auction_no;

	public RtResultAuctionListVO() {
	}

	public RtResultAuctionListVO(String rt_tender_no, String rt_auction_group, String rt_auction_title_img,
			String rt_auction_name, String rt_auction_unit, int rt_tender_price, String rt_auction_no) {
		super();
		this.rt_tender_no = rt_tender_no;
		this.rt_auction_group = rt_auction_group;
		this.rt_auction_title_img = rt_auction_title_img;
		this.rt_auction_name = rt_auction_name;
		this.rt_auction_unit = rt_auction_unit;
		this.rt_tender_price = rt_tender_price;
		this.rt_auction_no = rt_auction_no;
	}

	public String getRt_tender_no() {
		return rt_tender_no;
	}

	public void setRt_tender_no(String rt_tender_no) {
		this.rt_tender_no = rt_tender_no;
	}

	public String getRt_auction_group() {
		return rt_auction_group;
	}

	public void setRt_auction_group(String rt_auction_group) {
		this.rt_auction_group = rt_auction_group;
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

	public String getRt_auction_unit() {
		return rt_auction_unit;
	}

	public void setRt_auction_unit(String rt_auction_unit) {
		this.rt_auction_unit = rt_auction_unit;
	}

	public int getRt_tender_price() {
		return rt_tender_price;
	}

	public void setRt_tender_price(int rt_tender_price) {
		this.rt_tender_price = rt_tender_price;
	}

	public String getRt_auction_no() {
		return rt_auction_no;
	}

	public void setRt_auction_no(String rt_auction_no) {
		this.rt_auction_no = rt_auction_no;
	}

	@Override
	public String toString() {
		return "RtResultAuctionListVO [rt_tender_no=" + rt_tender_no + ", rt_auction_group=" + rt_auction_group
				+ ", rt_auction_title_img=" + rt_auction_title_img + ", rt_auction_name=" + rt_auction_name
				+ ", rt_auction_unit=" + rt_auction_unit + ", rt_tender_price=" + rt_tender_price + ", rt_auction_no="
				+ rt_auction_no + "]";
	}

}
