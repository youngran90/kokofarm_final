package kokofarm.auction.domain;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class AuctionRegisterVO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	
	private int auction_no;
	private String auction_name;
	private String auction_group;
	private String start_date;
	private String end_date;
	private int auction_up;
	private int auction_down;
	private String auction_unit;
	private String auction_area;
	private String auction_content;
	private String auction_regdate;
	private int auction_hits;
	private String auction_title_img;
	private MultipartFile file;
	private String seller_no; 
	
	
	public int getAuction_no() {
		return auction_no;
	}
	public void setAuction_no(int auction_no) {
		this.auction_no = auction_no;
	}
	public String getAuction_name() {
		return auction_name;
	}
	public void setAuction_name(String auction_name) {
		this.auction_name = auction_name;
	}
	public String getAuction_group() {
		return auction_group;
	}
	public void setAuction_group(String auction_group) {
		this.auction_group = auction_group;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getAuction_up() {
		return auction_up;
	}
	public void setAuction_up(int auction_up) {
		this.auction_up = auction_up;
	}
	public int getAuction_down() {
		return auction_down;
	}
	public void setAuction_down(int auction_down) {
		this.auction_down = auction_down;
	}
	public String getAuction_unit() {
		return auction_unit;
	}
	public void setAuction_unit(String auction_unit) {
		this.auction_unit = auction_unit;
	}
	public String getAuction_area() {
		return auction_area;
	}
	public void setAuction_area(String auction_area) {
		this.auction_area = auction_area;
	}
	public String getAuction_content() {
		return auction_content;
	}
	public void setAuction_content(String auction_content) {
		this.auction_content = auction_content;
	}
	public String getAuction_regdate() {
		return auction_regdate;
	}
	public void setAuction_regdate(String auction_regdate) {
		this.auction_regdate = auction_regdate;
	}
	public int getAuction_hits() {
		return auction_hits;
	}
	public void setAuction_hits(int auction_hits) {
		this.auction_hits = auction_hits;
	}
	public String getAuction_title_img() {
		return auction_title_img;
	}
	public void setAuction_title_img(String auction_title_img) {
		this.auction_title_img = auction_title_img;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	public String getSeller_no() {
		return seller_no;
	}
	public void setSeller_no(String seller_no) {
		this.seller_no = seller_no;
	}
	@Override
	public String toString() {
		return "AuctionRegisterVO [auction_no=" + auction_no + ", auction_name=" + auction_name + ", auction_group="
				+ auction_group + ", start_date=" + start_date + ", end_date=" + end_date + ", auction_up=" + auction_up
				+ ", auction_down=" + auction_down + ", auction_unit=" + auction_unit + ", auction_area=" + auction_area
				+ ", auction_content=" + auction_content + ", auction_regdate=" + auction_regdate + ", auction_hits="
				+ auction_hits + ", auction_title_img=" + auction_title_img + ", file=" + file + ", seller_no="
				+ seller_no + "]";
	}
	
	
	
	
	
}
