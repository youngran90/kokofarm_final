package kokofarm.product.domain;

import java.util.Date;

import com.sun.jmx.snmp.Timestamp;

public class ReplyVO {
	
	private String product_no;
	private String reply_no;
	private String member_id;
	private String reply_content;
	private Date reply_date;
	
	public ReplyVO(){}

	public ReplyVO(String product_no, String reply_no, String member_id, String reply_content, Date reply_date) {
		super();
		this.product_no = product_no;
		this.reply_no = reply_no;
		this.member_id = member_id;
		this.reply_content = reply_content;
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

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

	@Override
	public String toString() {
		return "ReplyVO [product_no=" + product_no + ", reply_no=" + reply_no + ", member_id=" + member_id
				+ ", reply_content=" + reply_content + ", reply_date=" + reply_date + "]";
	}

	
	
	
	

}
