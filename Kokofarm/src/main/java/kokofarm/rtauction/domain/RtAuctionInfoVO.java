package kokofarm.rtauction.domain;

import java.io.Serializable;

public class RtAuctionInfoVO implements Serializable {
	private String rt_action_name;
	private String rt_action_down; // 시작가
	private String rt_action_unit; // 수량
	private String rt_action_title_img; // 사진

	public RtAuctionInfoVO() {}

	public RtAuctionInfoVO(String rt_action_name, String rt_action_down, String rt_action_unit,
			String rt_action_title_img) {
		super();
		this.rt_action_name = rt_action_name;
		this.rt_action_down = rt_action_down;
		this.rt_action_unit = rt_action_unit;
		this.rt_action_title_img = rt_action_title_img;
	}

	public String getRt_action_name() {
		return rt_action_name;
	}

	public void setRt_action_name(String rt_action_name) {
		this.rt_action_name = rt_action_name;
	}

	public String getRt_action_down() {
		return rt_action_down;
	}

	public void setRt_action_down(String rt_action_down) {
		this.rt_action_down = rt_action_down;
	}

	public String getRt_action_unit() {
		return rt_action_unit;
	}

	public void setRt_action_unit(String rt_action_unit) {
		this.rt_action_unit = rt_action_unit;
	}

	public String getRt_action_title_img() {
		return rt_action_title_img;
	}

	public void setRt_action_title_img(String rt_action_title_img) {
		this.rt_action_title_img = rt_action_title_img;
	}

	@Override
	public String toString() {
		return "RtActionInfoVO [rt_action_name=" + rt_action_name + ", rt_action_down=" + rt_action_down
				+ ", rt_action_unit=" + rt_action_unit + ", rt_action_title_img=" + rt_action_title_img + "]";
	}

}
