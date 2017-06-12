package kokofarm.orderproduct.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class OrderProductVO implements Serializable{
		private String order_no;
		private String member_id;
		private String product_no;
		
		private String order_product_name;
		private String order_product_price;
		
		private String order_product_amount; //수량
		
		private String order_delivery_price;
		private String order_total_price;
		
		private Timestamp order_date;
		
		public OrderProductVO() {
		}

		public OrderProductVO(String order_no, String member_id, String product_no, String order_product_name,
				String order_product_price, String order_product_amount, String order_delivery_price,
				String order_total_price, Timestamp order_date) {
			super();
			this.order_no = order_no;
			this.member_id = member_id;
			this.product_no = product_no;
			this.order_product_name = order_product_name;
			this.order_product_price = order_product_price;
			this.order_product_amount = order_product_amount;
			this.order_delivery_price = order_delivery_price;
			this.order_total_price = order_total_price;
			this.order_date = order_date;
		}

		public String getOrder_no() {
			return order_no;
		}

		public void setOrder_no(String order_no) {
			this.order_no = order_no;
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

		public String getOrder_product_name() {
			return order_product_name;
		}

		public void setOrder_product_name(String order_product_name) {
			this.order_product_name = order_product_name;
		}

		public String getOrder_product_price() {
			return order_product_price;
		}

		public void setOrder_product_price(String order_product_price) {
			this.order_product_price = order_product_price;
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

		public Timestamp getOrder_date() {
			return order_date;
		}

		public void setOrder_date(Timestamp order_date) {
			this.order_date = order_date;
		}

		@Override
		public String toString() {
			return "OrderProductVO [order_no=" + order_no + ", member_id=" + member_id + ", product_no=" + product_no
					+ ", order_product_name=" + order_product_name + ", order_product_price=" + order_product_price
					+ ", order_product_amount=" + order_product_amount + ", order_delivery_price="
					+ order_delivery_price + ", order_total_price=" + order_total_price + ", order_date=" + order_date
					+ "]";
		}

		

		

		

		

		
}
