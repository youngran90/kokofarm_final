package kokofarm.orderproduct.domain;

import java.io.Serializable;
import java.util.List;

public class OrderProductListVO implements Serializable{
	private String member_id;
	private String product_no;
	private String product_name;
	private String product_price;
	private String order_product_amount; //수량
	private String order_delivery_price;
	private String order_total_price;
	private String product_mainimage;
	private int product_total;
	
	public OrderProductListVO() {
	}

	public OrderProductListVO(String member_id, String product_no, String product_name, String product_price,
			String order_product_amount, String order_delivery_price, String order_total_price,
			String product_mainimage, int product_total) {
		super();
		this.member_id = member_id;
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_price = product_price;
		this.order_product_amount = order_product_amount;
		this.order_delivery_price = order_delivery_price;
		this.order_total_price = order_total_price;
		this.product_mainimage = product_mainimage;
		this.product_total = product_total;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
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

	public String getProduct_price() {
		return product_price;
	}

	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}

	public String getOrder_product_amount() {
		return order_product_amount;
	}

	public void setOrder_product_amount(String order_product_amount) {
		this.order_product_amount = order_product_amount;
	}

	public String getOrder_delivery_price() {
		return order_delivery_price;
	}

	public void setOrder_delivery_price(String order_delivery_price) {
		this.order_delivery_price = order_delivery_price;
	}

	public String getOrder_total_price() {
		return order_total_price;
	}

	public void setOrder_total_price(String order_total_price) {
		this.order_total_price = order_total_price;
	}

	public String getProduct_mainimage() {
		return product_mainimage;
	}

	public void setProduct_mainimage(String product_mainimage) {
		this.product_mainimage = product_mainimage;
	}

	public int getProduct_total() {
		return product_total;
	}

	public void setProduct_total(int product_total) {
		this.product_total = product_total;
	}

	@Override
	public String toString() {
		return "OrderProductListVO [member_id=" + member_id + ", product_no=" + product_no + ", product_name="
				+ product_name + ", product_price=" + product_price + ", order_product_amount=" + order_product_amount
				+ ", order_delivery_price=" + order_delivery_price + ", order_total_price=" + order_total_price
				+ ", product_mainimage=" + product_mainimage + ", product_total=" + product_total + "]";
	}

		
}
