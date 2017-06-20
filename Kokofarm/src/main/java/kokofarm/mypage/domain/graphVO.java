package kokofarm.mypage.domain;

import java.io.Serializable;

public class graphVO implements Serializable{

	private int sell_count;
	private String ORDERFINISH_PRODUCT_Name;
	private String o_date;
	private int sum;
	
	private int sum1 = 0;
	private int sum2 = 0;
	private int sum3 = 0;
	private int sum4= 0;
	private int sum5= 0;
	private int sum6= 0;
	private int sum7= 0;
	private int sum8= 0;
	private int sum9= 0;
	private int sum10= 0;
	private int sum11= 0;
	private int sum12= 0;
	
	
	public graphVO(){}


	public graphVO(int sell_count, String oRDERFINISH_PRODUCT_Name, String o_date, int sum, int sum1, int sum2,
			int sum3, int sum4, int sum5, int sum6, int sum7, int sum8, int sum9, int sum10, int sum11, int sum12) {
		super();
		this.sell_count = sell_count;
		ORDERFINISH_PRODUCT_Name = oRDERFINISH_PRODUCT_Name;
		this.o_date = o_date;
		this.sum = sum;
		this.sum1 = sum1;
		this.sum2 = sum2;
		this.sum3 = sum3;
		this.sum4 = sum4;
		this.sum5 = sum5;
		this.sum6 = sum6;
		this.sum7 = sum7;
		this.sum8 = sum8;
		this.sum9 = sum9;
		this.sum10 = sum10;
		this.sum11 = sum11;
		this.sum12 = sum12;
	}


	public int getSell_count() {
		return sell_count;
	}


	public void setSell_count(int sell_count) {
		this.sell_count = sell_count;
	}


	public String getORDERFINISH_PRODUCT_Name() {
		return ORDERFINISH_PRODUCT_Name;
	}


	public void setORDERFINISH_PRODUCT_Name(String oRDERFINISH_PRODUCT_Name) {
		ORDERFINISH_PRODUCT_Name = oRDERFINISH_PRODUCT_Name;
	}


	public String getO_date() {
		return o_date;
	}


	public void setO_date(String o_date) {
		this.o_date = o_date;
	}


	public int getSum() {
		return sum;
	}


	public void setSum(int sum) {
		this.sum = sum;
	}


	public int getSum1() {
		return sum1;
	}


	public void setSum1(int sum1) {
		this.sum1 = sum1;
	}


	public int getSum2() {
		return sum2;
	}


	public void setSum2(int sum2) {
		this.sum2 = sum2;
	}


	public int getSum3() {
		return sum3;
	}


	public void setSum3(int sum3) {
		this.sum3 = sum3;
	}


	public int getSum4() {
		return sum4;
	}


	public void setSum4(int sum4) {
		this.sum4 = sum4;
	}


	public int getSum5() {
		return sum5;
	}


	public void setSum5(int sum5) {
		this.sum5 = sum5;
	}


	public int getSum6() {
		return sum6;
	}


	public void setSum6(int sum6) {
		this.sum6 = sum6;
	}


	public int getSum7() {
		return sum7;
	}


	public void setSum7(int sum7) {
		this.sum7 = sum7;
	}


	public int getSum8() {
		return sum8;
	}


	public void setSum8(int sum8) {
		this.sum8 = sum8;
	}


	public int getSum9() {
		return sum9;
	}


	public void setSum9(int sum9) {
		this.sum9 = sum9;
	}


	public int getSum10() {
		return sum10;
	}


	public void setSum10(int sum10) {
		this.sum10 = sum10;
	}


	public int getSum11() {
		return sum11;
	}


	public void setSum11(int sum11) {
		this.sum11 = sum11;
	}


	public int getSum12() {
		return sum12;
	}


	public void setSum12(int sum12) {
		this.sum12 = sum12;
	}


	
}
