package kokofarm.auction.domain;

public class RT_AuctionRegisterVO {
	private String rt_auction_no;
	private String rt_auction_name;
	private String rt_auction_group;
	private String rt_auction_date;
	private int rt_auction_down;
	private String rt_auction_unit;
	private String rt_auction_area;
	private String rt_auction_content;
	
	
	public String getRt_auction_no() {
		return rt_auction_no;
	}
	public void setRt_auction_no(String rt_auction_no) {
		this.rt_auction_no = rt_auction_no;
	}
	public String getRt_auction_name() {
		return rt_auction_name;
	}
	public void setRt_auction_name(String rt_auction_name) {
		this.rt_auction_name = rt_auction_name;
	}
	public String getRt_auction_group() {
		return rt_auction_group;
	}
	public void setRt_auction_group(String rt_auction_group) {
		this.rt_auction_group = rt_auction_group;
	}
	public String getRt_auction_date() {
		return rt_auction_date;
	}
	public void setRt_auction_date(String rt_auction_date) {
		this.rt_auction_date = rt_auction_date;
	}
	public int getRt_auction_down() {
		return rt_auction_down;
	}
	public void setRt_auction_down(int rt_auction_down) {
		this.rt_auction_down = rt_auction_down;
	}
	public String getRt_auction_unit() {
		return rt_auction_unit;
	}
	public void setRt_auction_unit(String rt_auction_unit) {
		this.rt_auction_unit = rt_auction_unit;
	}
	public String getRt_auction_area() {
		return rt_auction_area;
	}
	public void setRt_auction_area(String rt_auction_area) {
		this.rt_auction_area = rt_auction_area;
	}
	public String getRt_auction_content() {
		return rt_auction_content;
	}
	public void setRt_auction_content(String rt_auction_content) {
		this.rt_auction_content = rt_auction_content;
	}
	@Override
	public String toString() {
		return "RT_AuctionRegisterVO [rt_auction_no=" + rt_auction_no + ", rt_auction_name=" + rt_auction_name
				+ ", rt_auction_group=" + rt_auction_group + ", rt_auction_date=" + rt_auction_date
				+ ", rt_auction_down=" + rt_auction_down + ", rt_auction_unit=" + rt_auction_unit + ", rt_auction_area="
				+ rt_auction_area + ", rt_auction_content=" + rt_auction_content + "]";
	}
	
}