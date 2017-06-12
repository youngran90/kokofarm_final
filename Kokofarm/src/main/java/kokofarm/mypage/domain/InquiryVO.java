package kokofarm.mypage.domain;

import java.io.Serializable;
import java.util.Date;

public class InquiryVO implements Serializable{
	private String inquiry_no;
	private String product_no;
	private String product_name;
	private String member_id	;
	private String seller_no;
	private String inquiry_content;
	private Date inquiry_date;
	private String inquiry_reply;
	private Date inquiry_replydate;

	public InquiryVO(){}

	public InquiryVO(String inquiry_no, String product_no, String product_name, String member_id, String seller_no,
			String inquiry_content, Date inquiry_date, String inquiry_reply, Date inquiry_replydate) {
		super();
		this.inquiry_no = inquiry_no;
		this.product_no = product_no;
		this.product_name = product_name;
		this.member_id = member_id;
		this.seller_no = seller_no;
		this.inquiry_content = inquiry_content;
		this.inquiry_date = inquiry_date;
		this.inquiry_reply = inquiry_reply;
		this.inquiry_replydate = inquiry_replydate;
	}

	public String getInquiry_no() {
		return inquiry_no;
	}

	public void setInquiry_no(String inquiry_no) {
		this.inquiry_no = inquiry_no;
	}

	public String getProduct_no() {
		return product_no;
	}

	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getSeller_no() {
		return seller_no;
	}

	public void setSeller_no(String seller_no) {
		this.seller_no = seller_no;
	}

	public String getInquiry_content() {
		return inquiry_content;
	}

	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}

	public Date getInquiry_date() {
		return inquiry_date;
	}

	public void setInquiry_date(Date inquiry_date) {
		this.inquiry_date = inquiry_date;
	}

	public String getInquiry_reply() {
		return inquiry_reply;
	}

	public void setInquiry_reply(String inquiry_reply) {
		this.inquiry_reply = inquiry_reply;
	}

	public Date getInquiry_replydate() {
		return inquiry_replydate;
	}

	public void setInquiry_replydate(Date inquiry_replydate) {
		this.inquiry_replydate = inquiry_replydate;
	}

	@Override
	public String toString() {
		return "InquiryDTO [inquiry_no=" + inquiry_no + ", product_no=" + product_no + ", product_name=" + product_name
				+ ", member_id=" + member_id + ", seller_no=" + seller_no + ", inquiry_content=" + inquiry_content
				+ ", inquiry_date=" + inquiry_date + ", inquiry_reply=" + inquiry_reply + ", inquiry_replydate="
				+ inquiry_replydate + "]";
	}

	
	
	
}
