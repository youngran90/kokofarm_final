package kokofarm.product.domain;

import java.io.Serializable;
import java.util.Date;

import com.sun.jmx.snmp.Timestamp;

public class ReplyVO implements Serializable{
	
	private String product_no;
	private String reply_no;
	private String member_id;
	private String reply_content;
	private int reply_rating;
	private Date reply_date;
	
	public ReplyVO(){}

	public ReplyVO(String product_no, String reply_no, String member_id, String reply_content, int reply_rating,
			Date reply_date) {
		super();
		this.product_no = product_no;
		this.reply_no = reply_no;
		this.member_id = member_id;
		this.reply_content = reply_content;
		this.reply_rating = reply_rating;
		this.reply_date = reply_date;
	}

	public String getProduct_no() {
		return product_no;
	}

	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}

	public String getReply_no() {
		return reply_no;
	}

	public void setReply_no(String reply_no) {
		this.reply_no = reply_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public int getReply_rating() {
		return reply_rating;
	}

	public void setReply_rating(int reply_rating) {
		this.reply_rating = reply_rating;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

	@Override
	public String toString() {
		return "ReplyVO [product_no=" + product_no + ", reply_no=" + reply_no + ", member_id=" + member_id
				+ ", reply_content=" + reply_content + ", reply_rating=" + reply_rating + ", reply_date=" + reply_date
				+ "]";
	}

	
	
	

}
