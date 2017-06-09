package kokofarm.tender.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class PayVO implements Serializable{
	private String pay_no;
	private int success_no;
	private String recipient;
	private String phone_no;
	private String tel_no;
	private String ship_area;
	private String ship_msg;
	private String pay_sort;
	private String card_sort;
	private String period;
	private String account;
	private String deposit_name;
	private int price;
	private Timestamp pay_date;
	
	public String getPay_no() {
		return pay_no;
	}
	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}
	public int getSuccess_no() {
		return success_no;
	}
	public void setSuccess_no(int success_no) {
		this.success_no = success_no;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}
	public String getShip_area() {
		return ship_area;
	}
	public void setShip_area(String ship_area) {
		this.ship_area = ship_area;
	}
	public String getShip_msg() {
		return ship_msg;
	}
	public void setShip_msg(String ship_msg) {
		this.ship_msg = ship_msg;
	}
	public String getPay_sort() {
		return pay_sort;
	}
	public void setPay_sort(String pay_sort) {
		this.pay_sort = pay_sort;
	}
	public String getCard_sort() {
		return card_sort;
	}
	public void setCard_sort(String card_sort) {
		this.card_sort = card_sort;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
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
	public String getTel_no() {
		return tel_no;
	}
	public void setTel_no(String tel_no) {
		this.tel_no = tel_no;
	}
	@Override
	public String toString() {
		return "PayVO [pay_no=" + pay_no + ", success_no=" + success_no + ", recipient=" + recipient + ", phone_no="
				+ phone_no + ", tel_no=" + tel_no + ", ship_area=" + ship_area + ", ship_msg=" + ship_msg
				+ ", pay_sort=" + pay_sort + ", card_sort=" + card_sort + ", period=" + period + ", account=" + account
				+ ", deposit_name=" + deposit_name + ", price=" + price + ", pay_date=" + pay_date + "]";
	}
	
	


}
