package kokofarm.orderproduct.domain;

import java.sql.Timestamp;
import java.util.Date;

public class OrderFinish_Payment_Info {

	private String orderfinish_no;
	private String payment_no;// 결제번호
	private String pay; // 결제 방법
	private String creditcard_name;// 신용카드 이름
	private String pay_month; // 카드일경우-할부, 나머지는 null
	private String pay_bank; // 계좌이체일경우-은행, 나머지는 null
	private String deposit_name; // 계좌이체일경우-입금자명, 나머지는 null
	private Timestamp payment_date; // 결제 일
	private String member_id;

	public OrderFinish_Payment_Info() {
	}

	public OrderFinish_Payment_Info(String orderfinish_no, String payment_no, String pay, String creditcard_name,
			String pay_month, String pay_bank, String deposit_name, Timestamp payment_date, String member_id) {
		super();
		this.orderfinish_no = orderfinish_no;
		this.payment_no = payment_no;
		this.pay = pay;
		this.creditcard_name = creditcard_name;
		this.pay_month = pay_month;
		this.pay_bank = pay_bank;
		this.deposit_name = deposit_name;
		this.payment_date = payment_date;
		this.member_id = member_id;
	}

	public String getOrderfinish_no() {
		return orderfinish_no;
	}

	public void setOrderfinish_no(String orderfinish_no) {
		this.orderfinish_no = orderfinish_no;
	}

	public String getPayment_no() {
		return payment_no;
	}

	public void setPayment_no(String payment_no) {
		this.payment_no = payment_no;
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

	public Timestamp getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Timestamp payment_date) {
		this.payment_date = payment_date;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "OrderFinish_Payment_Info [orderfinish_no=" + orderfinish_no + ", payment_no=" + payment_no + ", pay="
				+ pay + ", creditcard_name=" + creditcard_name + ", pay_month=" + pay_month + ", pay_bank=" + pay_bank
				+ ", deposit_name=" + deposit_name + ", payment_date=" + payment_date + ", member_id=" + member_id
				+ "]";
	}

}
