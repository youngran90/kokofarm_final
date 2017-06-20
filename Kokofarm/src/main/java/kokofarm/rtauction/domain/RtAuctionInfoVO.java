package kokofarm.rtauction.domain;

import java.io.Serializable;

public class RtAuctionInfoVO implements Serializable {
	private String rt_auction_no; // 경매 번호
	private String rt_auction_name; // 제품명
	private int rt_auction_down; // 시작가
	private String rt_auction_unit; // 수량
	private String rt_auction_title_img; // 사진
	private String rt_auction_title_img01; // 사진
	private String rt_auction_title_img02; // 사진
	private String rt_auction_content; //제품 설명
	private String rt_auction_area; // 생산지
	private String seller_no;

	public RtAuctionInfoVO() {}

	public RtAuctionInfoVO(String rt_auction_no, String rt_auction_name, int rt_auction_down, String rt_auction_unit,
			String rt_auction_title_img, String rt_auction_title_img01, String rt_auction_title_img02,
			String rt_auction_content, String rt_auction_area, String seller_no) {
		super();
		this.rt_auction_no = rt_auction_no;
		this.rt_auction_name = rt_auction_name;
		this.rt_auction_down = rt_auction_down;
		this.rt_auction_unit = rt_auction_unit;
		this.rt_auction_title_img = rt_auction_title_img;
		this.rt_auction_title_img01 = rt_auction_title_img01;
		this.rt_auction_title_img02 = rt_auction_title_img02;
		this.rt_auction_content = rt_auction_content;
		this.rt_auction_area = rt_auction_area;
		this.seller_no = seller_no;
	}

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

	public String getRt_auction_title_img() {
		return rt_auction_title_img;
	}

	public void setRt_auction_title_img(String rt_auction_title_img) {
		this.rt_auction_title_img = rt_auction_title_img;
	}

	public String getRt_auction_title_img01() {
		return rt_auction_title_img01;
	}

	public void setRt_auction_title_img01(String rt_auction_title_img01) {
		this.rt_auction_title_img01 = rt_auction_title_img01;
	}

	public String getRt_auction_title_img02() {
		return rt_auction_title_img02;
	}

	public void setRt_auction_title_img02(String rt_auction_title_img02) {
		this.rt_auction_title_img02 = rt_auction_title_img02;
	}

	public String getRt_auction_content() {
		return rt_auction_content;
	}

	public void setRt_auction_content(String rt_auction_content) {
		this.rt_auction_content = rt_auction_content;
	}

	public String getRt_auction_area() {
		return rt_auction_area;
	}

	public void setRt_auction_area(String rt_auction_area) {
		this.rt_auction_area = rt_auction_area;
	}

	public String getSeller_no() {
		return seller_no;
	}

	public void setSeller_no(String seller_no) {
		this.seller_no = seller_no;
	}

	@Override
	public String toString() {
		return "RtAuctionInfoVO [rt_auction_no=" + rt_auction_no + ", rt_auction_name=" + rt_auction_name
				+ ", rt_auction_down=" + rt_auction_down + ", rt_auction_unit=" + rt_auction_unit
				+ ", rt_auction_title_img=" + rt_auction_title_img + ", rt_auction_title_img01="
				+ rt_auction_title_img01 + ", rt_auction_title_img02=" + rt_auction_title_img02
				+ ", rt_auction_content=" + rt_auction_content + ", rt_auction_area=" + rt_auction_area + ", seller_no="
				+ seller_no + "]";
	}

	

	

}
