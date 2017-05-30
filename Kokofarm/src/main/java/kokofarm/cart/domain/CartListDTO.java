package kokofarm.cart.domain;

public class CartListDTO{
	private String product_no;
	private String product_name;
	private int product_price;
	private String product_unit;
	
	public CartListDTO() {
		super();
	}

	public CartListDTO(String product_no, String product_name, int product_price, String product_unit) {
		super();
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_unit = product_unit;
	}
	

	public String getProduct_unit() {
		return product_unit;
	}

	public void setProduct_unit(String product_unit) {
		this.product_unit = product_unit;
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

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	@Override
	public String toString() {
		return "CartListDTO [product_no=" + product_no + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_unit=" + product_unit + "]";
	}

	
	
}