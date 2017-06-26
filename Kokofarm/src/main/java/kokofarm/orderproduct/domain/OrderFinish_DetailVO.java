package kokofarm.orderproduct.domain;

import java.sql.Timestamp;

public class OrderFinish_DetailVO {

	private String orderfinish_no;

	private String orderfinish_product_name;
	private int orderfinish_product_amount;
	private int orderfinish_delivery_price;
	private int orderfinish_total_price;
	private int orderfinish_final_price;

	private String orderfinish_member_name;
	private String orderfinish_member_phonenum;
	private String orderfinish_member_address;

	private Timestamp orderfinish_date;

	private String product_mainimage;
	private String product_no;

	public OrderFinish_DetailVO() {
	}

	public OrderFinish_DetailVO(String orderfinish_no, String orderfinish_product_name, int orderfinish_product_amount,
			int orderfinish_delivery_price, int orderfinish_total_price, int orderfinish_final_price,
			String orderfinish_member_name, String orderfinish_member_phonenum, String orderfinish_member_address,
			Timestamp orderfinish_date, String product_mainimage, String product_no) {
		super();
		this.orderfinish_no = orderfinish_no;
		this.orderfinish_product_name = orderfinish_product_name;
		this.orderfinish_product_amount = orderfinish_product_amount;
		this.orderfinish_delivery_price = orderfinish_delivery_price;
		this.orderfinish_total_price = orderfinish_total_price;
		this.orderfinish_final_price = orderfinish_final_price;
		this.orderfinish_member_name = orderfinish_member_name;
		this.orderfinish_member_phonenum = orderfinish_member_phonenum;
		this.orderfinish_member_address = orderfinish_member_address;
		this.orderfinish_date = orderfinish_date;
		this.product_mainimage = product_mainimage;
		this.product_no = product_no;
	}

	public String getOrderfinish_no() {
		return orderfinish_no;
	}

	public void setOrderfinish_no(String orderfinish_no) {
		this.orderfinish_no = orderfinish_no;
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

	public String getOrderfinish_member_address() {
		return orderfinish_member_address;
	}

	public void setOrderfinish_member_address(String orderfinish_member_address) {
		this.orderfinish_member_address = orderfinish_member_address;
	}

	public Timestamp getOrderfinish_date() {
		return orderfinish_date;
	}

	public void setOrderfinish_date(Timestamp orderfinish_date) {
		this.orderfinish_date = orderfinish_date;
	}

	public String getProduct_mainimage() {
		return product_mainimage;
	}

	public void setProduct_mainimage(String product_mainimage) {
		this.product_mainimage = product_mainimage;
	}

	public String getProduct_no() {
		return product_no;
	}

	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}

	@Override
	public String toString() {
		return "OrderFinish_DetailVO [orderfinish_no=" + orderfinish_no + ", orderfinish_product_name="
				+ orderfinish_product_name + ", orderfinish_product_amount=" + orderfinish_product_amount
				+ ", orderfinish_delivery_price=" + orderfinish_delivery_price + ", orderfinish_total_price="
				+ orderfinish_total_price + ", orderfinish_final_price=" + orderfinish_final_price
				+ ", orderfinish_member_name=" + orderfinish_member_name + ", orderfinish_member_phonenum="
				+ orderfinish_member_phonenum + ", orderfinish_member_address=" + orderfinish_member_address
				+ ", orderfinish_date=" + orderfinish_date + ", product_mainimage=" + product_mainimage
				+ ", product_no=" + product_no + "]";
	}

	

}
