package kokofarm.product.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class ProductVO implements Serializable{
	
	private String product_no;
	private String product_name;
	private String product_unit;	
	private int product_price;	
	private String seller_no;
	private Timestamp product_uploaddate;
	private Date product_harvestdate;
	private int review_number;
	
	
	
	private String product_mainimage;
	private String product_detailimage;
	private String product_sellerimage;

	
	public ProductVO(){}


	public ProductVO(String product_no, String product_name, String product_unit, int product_price, String seller_no,
			Timestamp product_uploaddate, Date product_harvestdate, int review_number, String product_mainimage,
			String product_detailimage, String product_sellerimage) {
		super();
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_unit = product_unit;
		this.product_price = product_price;
		this.seller_no = seller_no;
		this.product_uploaddate = product_uploaddate;
		this.product_harvestdate = product_harvestdate;
		this.review_number = review_number;
		this.product_mainimage = product_mainimage;
		this.product_detailimage = product_detailimage;
		this.product_sellerimage = product_sellerimage;
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


	public String getProduct_unit() {
		return product_unit;
	}


	public void setProduct_unit(String product_unit) {
		this.product_unit = product_unit;
	}


	public int getProduct_price() {
		return product_price;
	}


	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}


	public String getSeller_no() {
		return seller_no;
	}


	public void setSeller_no(String seller_no) {
		this.seller_no = seller_no;
	}


	public Timestamp getProduct_uploaddate() {
		return product_uploaddate;
	}


	public void setProduct_uploaddate(Timestamp product_uploaddate) {
		this.product_uploaddate = product_uploaddate;
	}


	public Date getProduct_harvestdate() {
		return product_harvestdate;
	}


	public void setProduct_harvestdate(Date product_harvestdate) {
		this.product_harvestdate = product_harvestdate;
	}


	public int getReview_number() {
		return review_number;
	}


	public void setReview_number(int review_number) {
		this.review_number = review_number;
	}


	public String getProduct_mainimage() {
		return product_mainimage;
	}


	public void setProduct_mainimage(String product_mainimage) {
		this.product_mainimage = product_mainimage;
	}


	public String getProduct_detailimage() {
		return product_detailimage;
	}


	public void setProduct_detailimage(String product_detailimage) {
		this.product_detailimage = product_detailimage;
	}


	public String getProduct_sellerimage() {
		return product_sellerimage;
	}


	public void setProduct_sellerimage(String product_sellerimage) {
		this.product_sellerimage = product_sellerimage;
	}


		
}
	
