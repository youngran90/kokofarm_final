package kokofarm.orderproduct.domain;

import java.util.Arrays;

public class OrderFinish_Product_Info {
	private String[] product_no;
	private String[] orderfinish_product_name;
	private String[] order_product_amount;
	private String[] orderfinish_product_price;
	private String[] order_delivery_price;
	private String[] order_total_price;

	public OrderFinish_Product_Info() {
	}

	public OrderFinish_Product_Info(String[] product_no, String[] orderfinish_product_name,
			String[] order_product_amount, String[] orderfinish_product_price, String[] order_delivery_price,
			String[] order_total_price) {
		super();
		this.product_no = product_no;
		this.orderfinish_product_name = orderfinish_product_name;
		this.order_product_amount = order_product_amount;
		this.orderfinish_product_price = orderfinish_product_price;
		this.order_delivery_price = order_delivery_price;
		this.order_total_price = order_total_price;
	}

	public String[] getProduct_no() {
		return product_no;
	}

	public void setProduct_no(String[] product_no) {
		this.product_no = product_no;
	}

	public String[] getOrderfinish_product_name() {
		return orderfinish_product_name;
	}

	public void setOrderfinish_product_name(String[] orderfinish_product_name) {
		this.orderfinish_product_name = orderfinish_product_name;
	}

	public String[] getOrder_product_amount() {
		return order_product_amount;
	}

	public void setOrder_product_amount(String[] order_product_amount) {
		this.order_product_amount = order_product_amount;
	}

	public String[] getOrderfinish_product_price() {
		return orderfinish_product_price;
	}

	public void setOrderfinish_product_price(String[] orderfinish_product_price) {
		this.orderfinish_product_price = orderfinish_product_price;
	}

	public String[] getOrder_delivery_price() {
		return order_delivery_price;
	}

	public void setOrder_delivery_price(String[] order_delivery_price) {
		this.order_delivery_price = order_delivery_price;
	}

	public String[] getOrder_total_price() {
		return order_total_price;
	}

	public void setOrder_total_price(String[] order_total_price) {
		this.order_total_price = order_total_price;
	}

	@Override
	public String toString() {
		return "OrderFinish_Product_Info [product_no=" + Arrays.toString(product_no) + ", orderfinish_product_name="
				+ Arrays.toString(orderfinish_product_name) + ", order_product_amount="
				+ Arrays.toString(order_product_amount) + ", orderfinish_product_price="
				+ Arrays.toString(orderfinish_product_price) + ", order_delivery_price="
				+ Arrays.toString(order_delivery_price) + ", order_total_price=" + Arrays.toString(order_total_price)
				+ "]";
	}

}
