package kokofarm.orderproduct.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class OrderProductVO implements Serializable{

		private String member_id;
		private String order_product_no;
		private String product_amount; //수량
		
		private String order_delivery_price;
		private String order_total_price;
		
		private Timestamp order_date;
		
		public OrderProductVO() {
		}

		public OrderProductVO(String member_id, String order_product_no, String product_amount,
				String order_delivery_price, String order_total_price, Timestamp order_date) {
			super();
			this.member_id = member_id;
			this.order_product_no = order_product_no;
			this.product_amount = product_amount;
			this.order_delivery_price = order_delivery_price;
			this.order_total_price = order_total_price;
			this.order_date = order_date;
		}

		public String getMember_id() {
			return member_id;
		}

		public void setMember_id(String member_id) {
			this.member_id = member_id;
		}

		public String getOrder_product_no() {
			return order_product_no;
		}

		public void setOrder_product_no(String order_product_no) {
			this.order_product_no = order_product_no;
		}

		public String getProduct_amount() {
			return product_amount;
		}

		public void setProduct_amount(String product_amount) {
			this.product_amount = product_amount;
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
			return "OrderProductVO [member_id=" + member_id + ", order_product_no=" + order_product_no
					+ ", product_amount=" + product_amount + ", order_delivery_price=" + order_delivery_price
					+ ", order_total_price=" + order_total_price + ", order_date=" + order_date + "]";
		}

		

		
}
