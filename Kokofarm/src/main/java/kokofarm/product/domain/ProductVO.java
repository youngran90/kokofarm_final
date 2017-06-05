package kokofarm.product.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO implements Serializable{
	
	public ProductVO() {};
	
	private String product_no;
	private String product_name;
	private String product_unit;	
	private String unit;
	private int product_price;	
	private String ca1;
	private String ca2;
	private String ca3;
	
	private String product_area;
	private String producer;
	
	private String seller_no;
	private Timestamp product_uploaddate;
	private Date product_harvestdate;
	private String contents;
	private int review_number;
	
	private String product_mainimage;
	private String s_contents;
	private String product_sellerimage;
	
	private MultipartFile file1;
	private MultipartFile file2;
	public ProductVO(String product_no, String product_name, String product_unit, String unit, int product_price,
			String ca1, String ca2, String ca3, String product_area, String producer, String seller_no,
			Timestamp product_uploaddate, Date product_harvestdate, String contents, int review_number,
			String product_mainimage, String s_contents, String product_sellerimage, MultipartFile file1,
			MultipartFile file2) {
		super();
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_unit = product_unit;
		this.unit = unit;
		this.product_price = product_price;
		this.ca1 = ca1;
		this.ca2 = ca2;
		this.ca3 = ca3;
		this.product_area = product_area;
		this.producer = producer;
		this.seller_no = seller_no;
		this.product_uploaddate = product_uploaddate;
		this.product_harvestdate = product_harvestdate;
		this.contents = contents;
		this.review_number = review_number;
		this.product_mainimage = product_mainimage;
		this.s_contents = s_contents;
		this.product_sellerimage = product_sellerimage;
		this.file1 = file1;
		this.file2 = file2;
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
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getCa1() {
		return ca1;
	}
	public void setCa1(String ca1) {
		this.ca1 = ca1;
	}
	public String getCa2() {
		return ca2;
	}
	public void setCa2(String ca2) {
		this.ca2 = ca2;
	}
	public String getCa3() {
		return ca3;
	}
	public void setCa3(String ca3) {
		this.ca3 = ca3;
	}
	public String getProduct_area() {
		return product_area;
	}
	public void setProduct_area(String product_area) {
		this.product_area = product_area;
	}
	public String getProducer() {
		return producer;
	}
	public void setProducer(String producer) {
		this.producer = producer;
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
	public String getS_contents() {
		return s_contents;
	}
	public void setS_contents(String s_contents) {
		this.s_contents = s_contents;
	}
	public String getProduct_sellerimage() {
		return product_sellerimage;
	}
	public void setProduct_sellerimage(String product_sellerimage) {
		this.product_sellerimage = product_sellerimage;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	@Override
	public String toString() {
		return "ProductVO [product_no=" + product_no + ", product_name=" + product_name + ", product_unit="
				+ product_unit + ", unit=" + unit + ", product_price=" + product_price + ", ca1=" + ca1 + ", ca2=" + ca2
				+ ", ca3=" + ca3 + ", product_area=" + product_area + ", producer=" + producer + ", seller_no="
				+ seller_no + ", product_uploaddate=" + product_uploaddate + ", product_harvestdate="
				+ product_harvestdate + ", contents=" + contents + ", review_number=" + review_number
				+ ", product_mainimage=" + product_mainimage + ", s_contents=" + s_contents + ", product_sellerimage="
				+ product_sellerimage + ", file1=" + file1 + ", file2=" + file2 + "]";
	}
	
	
	
	

		
}
	
