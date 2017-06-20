package kokofarm.product.domain;

import java.io.Serializable;

public class dailyPrice implements Serializable{
	
	private String item_name;
	private String kind_name;
	private String rank;
	private String dpr1;
	private String dpr2 ;
	private String dpr3;
	
	public dailyPrice(){}

	public dailyPrice(String item_name, String kind_name, String rank, String dpr1, String dpr2, String dpr3) {
		super();
		this.item_name = item_name;
		this.kind_name = kind_name;
		this.rank = rank;
		this.dpr1 = dpr1;
		this.dpr2 = dpr2;
		this.dpr3 = dpr3;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getKind_name() {
		return kind_name;
	}

	public void setKind_name(String kind_name) {
		this.kind_name = kind_name;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getDpr1() {
		return dpr1;
	}

	public void setDpr1(String dpr1) {
		this.dpr1 = dpr1;
	}

	public String getDpr2() {
		return dpr2;
	}

	public void setDpr2(String dpr2) {
		this.dpr2 = dpr2;
	}

	public String getDpr3() {
		return dpr3;
	}

	public void setDpr3(String dpr3) {
		this.dpr3 = dpr3;
	};
	
	
	
}
