package kokofarm.rtauction.domain;

import java.io.Serializable;

public class RtAuctionInfoVO implements Serializable {
	private String rt_auction_name;
	private String rt_auction_down; // 시작가
	private String rt_auction_unit; // 수량
	private String rt_auction_title_img; // 사진

	public RtAuctionInfoVO() {}

	public RtAuctionInfoVO(String rt_auction_name, String rt_auction_down, String rt_auction_unit,
			String rt_auction_title_img) {
		super();
		this.rt_auction_name = rt_auction_name;
		this.rt_auction_down = rt_auction_down;
		this.rt_auction_unit = rt_auction_unit;
		this.rt_auction_title_img = rt_auction_title_img;
	}

	public String getRt_auction_name() {
		return rt_auction_name;
	}

	public void setRt_auction_name(String rt_auction_name) {
		this.rt_auction_name = rt_auction_name;
	}

	public String getRt_auction_down() {
		return rt_auction_down;
	}

	public void setRt_auction_down(String rt_auction_down) {
		this.rt_auction_down = rt_auction_down;
	}

	public String getRt_auction_unit() {
		return rt_auction_unit;
	}

	public void setRt_auction_unit(String rt_auction_unit) {
		this.rt_auction_unit = rt_auction_unit;
	}

	public String getRt_auction_title_img() {
		return rt_auction_title_img;
	}

	public void setRt_auction_title_img(String rt_auction_title_img) {
		this.rt_auction_title_img = rt_auction_title_img;
	}

	@Override
	public String toString() {
		return "RtAuctionInfoVO [rt_auction_name=" + rt_auction_name + ", rt_auction_down=" + rt_auction_down
				+ ", rt_auction_unit=" + rt_auction_unit + ", rt_auction_title_img=" + rt_auction_title_img + "]";
	}

	

}
