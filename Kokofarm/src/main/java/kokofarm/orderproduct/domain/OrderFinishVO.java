package kokofarm.orderproduct.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class OrderFinishVO implements Serializable {

	private String orderfinish_no;

	private String orderfinish_product_no;
	private String orderfinish_product_name;
	private int orderfinish_product_amount;
	private int orderfinish_product_price;
	private int orderfinish_delivery_price;
	private int orderfinish_total_price;
	private int orderfinish_final_price;

	private String orderfinish_member_id;
	private String orderfinish_member_name;
	private String orderfinish_member_phonenum;
	private String orderfinish_member_homenum;
	private String orderfinish_member_address;

	private String orderfinish_message; // 배송메세지

	private Timestamp orderfinish_date;

	public OrderFinishVO() {
	}

	public OrderFinishVO(String orderfinish_no, String orderfinish_product_no, String orderfinish_product_name,
			int orderfinish_product_amount, int orderfinish_product_price, int orderfinish_delivery_price,
			int orderfinish_total_price, int orderfinish_final_price, String orderfinish_member_id,
			String orderfinish_member_name, String orderfinish_member_phonenum, String orderfinish_member_homenum,
			String orderfinish_member_address, String orderfinish_message, Timestamp orderfinish_date) {
		super();
		this.orderfinish_no = orderfinish_no;
		this.orderfinish_product_no = orderfinish_product_no;
		this.orderfinish_product_name = orderfinish_product_name;
		this.orderfinish_product_amount = orderfinish_product_amount;
		this.orderfinish_product_price = orderfinish_product_price;
		this.orderfinish_delivery_price = orderfinish_delivery_price;
		this.orderfinish_total_price = orderfinish_total_price;
		this.orderfinish_final_price = orderfinish_final_price;
		this.orderfinish_member_id = orderfinish_member_id;
		this.orderfinish_member_name = orderfinish_member_name;
		this.orderfinish_member_phonenum = orderfinish_member_phonenum;
		this.orderfinish_member_homenum = orderfinish_member_homenum;
		this.orderfinish_member_address = orderfinish_member_address;
		this.orderfinish_message = orderfinish_message;
		this.orderfinish_date = orderfinish_date;
	}

	public String getOrderfinish_no() {
		return orderfinish_no;
	}

	public void setOrderfinish_no(String orderfinish_no) {
		this.orderfinish_no = orderfinish_no;
	}

	public String getOrderfinish_product_no() {
		return orderfinish_product_no;
	}

	public void setOrderfinish_product_no(String orderfinish_product_no) {
		this.orderfinish_product_no = orderfinish_product_no;
	}

	public String getOrderfinish_product_name() {
		return orderfinish_product_name;
	}

	public void setOrderfinish_product_name(String orderfinish_product_name) {
		this.orderfinish_product_name = orderfinish_product_name;
	}

	public int getOrderfinish_product_amount() {
		return orderfinish_product_amount;
	}

	public void setOrderfinish_product_amount(int orderfinish_product_amount) {
		this.orderfinish_product_amount = orderfinish_product_amount;
	}

	public int getOrderfinish_product_price() {
		return orderfinish_product_price;
	}

	public void setOrderfinish_product_price(int orderfinish_product_price) {
		this.orderfinish_product_price = orderfinish_product_price;
	}

	public int getOrderfinish_delivery_price() {
		return orderfinish_delivery_price;
	}

	public void setOrderfinish_delivery_price(int orderfinish_delivery_price) {
		this.orderfinish_delivery_price = orderfinish_delivery_price;
	}

	public int getOrderfinish_total_price() {
		return orderfinish_total_price;
	}

	public void setOrderfinish_total_price(int orderfinish_total_price) {
		this.orderfinish_total_price = orderfinish_total_price;
	}

	public int getOrderfinish_final_price() {
		return orderfinish_final_price;
	}

	public void setOrderfinish_final_price(int orderfinish_final_price) {
		this.orderfinish_final_price = orderfinish_final_price;
	}

	public String getOrderfinish_member_id() {
		return orderfinish_member_id;
	}

	public void setOrderfinish_member_id(String orderfinish_member_id) {
		this.orderfinish_member_id = orderfinish_member_id;
	}

	public String getOrderfinish_member_name() {
		return orderfinish_member_name;
	}

	public void setOrderfinish_member_name(String orderfinish_member_name) {
		this.orderfinish_member_name = orderfinish_member_name;
	}

	public String getOrderfinish_member_phonenum() {
		return orderfinish_member_phonenum;
	}

	public void setOrderfinish_member_phonenum(String orderfinish_member_phonenum) {
		this.orderfinish_member_phonenum = orderfinish_member_phonenum;
	}

	public String getOrderfinish_member_homenum() {
		return orderfinish_member_homenum;
	}

	public void setOrderfinish_member_homenum(String orderfinish_member_homenum) {
		this.orderfinish_member_homenum = orderfinish_member_homenum;
	}

	public String getOrderfinish_member_address() {
		return orderfinish_member_address;
	}

	public void setOrderfinish_member_address(String orderfinish_member_address) {
		this.orderfinish_member_address = orderfinish_member_address;
	}

	public String getOrderfinish_message() {
		return orderfinish_message;
	}

	public void setOrderfinish_message(String orderfinish_message) {
		this.orderfinish_message = orderfinish_message;
	}

	public Timestamp getOrderfinish_date() {
		return orderfinish_date;
	}

	public void setOrderfinish_date(Timestamp orderfinish_date) {
		this.orderfinish_date = orderfinish_date;
	}

	@Override
	public String toString() {
		return "OrderFinishVO [orderfinish_no=" + orderfinish_no + ", orderfinish_product_no=" + orderfinish_product_no
				+ ", orderfinish_product_name=" + orderfinish_product_name + ", orderfinish_product_amount="
				+ orderfinish_product_amount + ", orderfinish_product_price=" + orderfinish_product_price
				+ ", orderfinish_delivery_price=" + orderfinish_delivery_price + ", orderfinish_total_price="
				+ orderfinish_total_price + ", orderfinish_final_price=" + orderfinish_final_price
				+ ", orderfinish_member_id=" + orderfinish_member_id + ", orderfinish_member_name="
				+ orderfinish_member_name + ", orderfinish_member_phonenum=" + orderfinish_member_phonenum
				+ ", orderfinish_member_homenum=" + orderfinish_member_homenum + ", orderfinish_member_address="
				+ orderfinish_member_address + ", orderfinish_message=" + orderfinish_message + ", orderfinish_date="
				+ orderfinish_date + "]";
	}

}
