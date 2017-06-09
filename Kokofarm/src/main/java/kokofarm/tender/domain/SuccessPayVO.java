package kokofarm.tender.domain;

import java.io.Serializable;

public class SuccessPayVO implements Serializable{
	private int success_no;
	private String auction_group;
	//private String auction_title_img;
	private String auction_name;
	private String auction_unit;
	private int tender_price;
	private int auction_no;
	private String member_id;
	
	public int getSuccess_no() {
		return success_no;
	}
	public void setSuccess_no(int success_no) {
		this.success_no = success_no;
	}
	/*public String getAuction_title_img() {
		return auction_title_img;
	}
	public void setAuction_title_img(String auction_title_img) {
		this.auction_title_img = auction_title_img;
	}*/
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
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getAuction_group() {
		return auction_group;
	}
	public void setAuction_group(String auction_group) {
		this.auction_group = auction_group;
	}
	public String getAuction_unit() {
		return auction_unit;
	}
	public void setAuction_unit(String auction_unit) {
		this.auction_unit = auction_unit;
	}
	/*@Override
	public String toString() {
		return "SuccessPayVO [success_no=" + success_no + ", auction_group=" + auction_group + ", auction_title_img="
				+ auction_title_img + ", auction_name=" + auction_name + ", auction_unit=" + auction_unit
				+ ", tender_price=" + tender_price + ", auction_no=" + auction_no + ", member_id=" + member_id + "]";
	}*/
	@Override
	public String toString() {
		return "SuccessPayVO [success_no=" + success_no + ", auction_group=" + auction_group + ", auction_name="
				+ auction_name + ", auction_unit=" + auction_unit + ", tender_price=" + tender_price + ", auction_no="
				+ auction_no + ", member_id=" + member_id + "]";
	}
	
	
	


	

}
