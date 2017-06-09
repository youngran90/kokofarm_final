package kokofarm.tender.domain;

import java.io.Serializable;

public class SuccessVO implements Serializable{
	private int success_no;
	private int tender_no;
	private String pay_state;
	public int getSuccess_no() {
		return success_no;
	}
	public void setSuccess_no(int success_no) {
		this.success_no = success_no;
	}
	public int getTender_no() {
		return tender_no;
	}
	public void setTender_no(int tender_no) {
		this.tender_no = tender_no;
	}
	public String getPay_state() {
		return pay_state;
	}
	public void setPay_state(String pay_state) {
		this.pay_state = pay_state;
	}
	@Override
	public String toString() {
		return "SuccessVO [success_no=" + success_no + ", tender_no=" + tender_no + ", pay_state=" + pay_state + "]";
	}
	
	

}
