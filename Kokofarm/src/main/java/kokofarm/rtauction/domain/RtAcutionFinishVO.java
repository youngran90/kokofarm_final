package kokofarm.rtauction.domain;

import java.sql.Timestamp;

public class RtAcutionFinishVO {
	private String rt_tender_finish_no;
	private String rt_tender_no;
	private String recipient_name;
	private String recipient_phone;
	private String recipient_tel;
	private String recipient_address;
	private String delivery_message;
	private String pay;
	private String creditcard_name;
	private String pay_month;
	private String pay_bank;
	private String deposit_name;
	private int price;
	private Timestamp pay_date;

	public RtAcutionFinishVO() {}

	public RtAcutionFinishVO(String rt_tender_finish_no, String rt_tender_no, String recipient_name,
			String recipient_phone, String recipient_tel, String recipient_address, String delivery_message, String pay,
			String creditcard_name, String pay_month, String pay_bank, String deposit_name, int price,
			Timestamp pay_date) {
		super();
		this.rt_tender_finish_no = rt_tender_finish_no;
		this.rt_tender_no = rt_tender_no;
		this.recipient_name = recipient_name;
		this.recipient_phone = recipient_phone;
		this.recipient_tel = recipient_tel;
		this.recipient_address = recipient_address;
		this.delivery_message = delivery_message;
		this.pay = pay;
		this.creditcard_name = creditcard_name;
		this.pay_month = pay_month;
		this.pay_bank = pay_bank;
		this.deposit_name = deposit_name;
		this.price = price;
		this.pay_date = pay_date;
	}

	public String getRt_tender_finish_no() {
		return rt_tender_finish_no;
	}

	public void setRt_tender_finish_no(String rt_tender_finish_no) {
		this.rt_tender_finish_no = rt_tender_finish_no;
	}

	public String getRt_tender_no() {
		return rt_tender_no;
	}

	public void setRt_tender_no(String rt_tender_no) {
		this.rt_tender_no = rt_tender_no;
	}

	public String getRecipient_name() {
		return recipient_name;
	}

	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}

	public String getRecipient_phone() {
		return recipient_phone;
	}

	public void setRecipient_phone(String recipient_phone) {
		this.recipient_phone = recipient_phone;
	}

	public String getRecipient_tel() {
		return recipient_tel;
	}

	public void setRecipient_tel(String recipient_tel) {
		this.recipient_tel = recipient_tel;
	}

	public String getRecipient_address() {
		return recipient_address;
	}

	public void setRecipient_address(String recipient_address) {
		this.recipient_address = recipient_address;
	}

	public String getDelivery_message() {
		return delivery_message;
	}

	public void setDelivery_message(String delivery_message) {
		this.delivery_message = delivery_message;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getCreditcard_name() {
		return creditcard_name;
	}

	public void setCreditcard_name(String creditcard_name) {
		this.creditcard_name = creditcard_name;
	}

	public String getPay_month() {
		return pay_month;
	}

	public void setPay_month(String pay_month) {
		this.pay_month = pay_month;
	}

	public String getPay_bank() {
		return pay_bank;
	}

	public void setPay_bank(String pay_bank) {
		this.pay_bank = pay_bank;
	}

	public String getDeposit_name() {
		return deposit_name;
	}

	public void setDeposit_name(String deposit_name) {
		this.deposit_name = deposit_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Timestamp getPay_date() {
		return pay_date;
	}

	public void setPay_date(Timestamp pay_date) {
		this.pay_date = pay_date;
	}

	@Override
	public String toString() {
		return "RtAcutionFinish [rt_tender_finish_no=" + rt_tender_finish_no + ", rt_tender_no=" + rt_tender_no
				+ ", recipient_name=" + recipient_name + ", recipient_phone=" + recipient_phone + ", recipient_tel="
				+ recipient_tel + ", recipient_address=" + recipient_address + ", delivery_message=" + delivery_message
				+ ", pay=" + pay + ", creditcard_name=" + creditcard_name + ", pay_month=" + pay_month + ", pay_bank="
				+ pay_bank + ", deposit_name=" + deposit_name + ", price=" + price + ", pay_date=" + pay_date + "]";
	}

}
