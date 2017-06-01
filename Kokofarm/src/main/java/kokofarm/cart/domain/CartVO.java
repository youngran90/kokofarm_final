package kokofarm.cart.domain;

import java.io.Serializable;

public class CartVO implements Serializable{
	private String cart_no;
	private String product_no;
	private String member_id;
	private String product_unit;
	
	public CartVO() {
		super();
	}
	
	
	public CartVO(String cart_no, String product_no, String member_id, String product_unit) {
		super();
		this.cart_no = cart_no;
		this.product_no = product_no;
		this.member_id = member_id;
		this.product_unit = product_unit;
	}


	public String getCart_no() {
		return cart_no;
	}
	public void setCart_no(String cart_no) {
		this.cart_no = cart_no;
	}
	public String getProduct_no() {
		return product_no;
	}
	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getProduct_unit() {
		return product_unit;
	}


	public void setProduct_unit(String product_unit) {
		this.product_unit = product_unit;
	}


	@Override
	public String toString() {
		return "CartDTO [cart_no=" + cart_no + ", product_no=" + product_no + ", member_id=" + member_id + "]";
	}
	
	
	
}