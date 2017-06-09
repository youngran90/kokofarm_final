package kokofarm.mileage.domain;

import java.io.Serializable;
import java.util.Date;

public class MileageVO implements Serializable{
	private String member_id;
	private int mileage_no;
	private int mileage_use;
	private int mileage_saving;
	private int mileage_total;
	private Date mileage_date;
	
	public MileageVO() {}

	public MileageVO(String member_id, int mileage_no, int mileage_use, int mileage_saving, int mileage_total,
			Date mileage_date) {
		this.member_id = member_id;
		this.mileage_no = mileage_no;
		this.mileage_use = mileage_use;
		this.mileage_saving = mileage_saving;
		this.mileage_total = mileage_total;
		this.mileage_date = mileage_date;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getMileage_no() {
		return mileage_no;
	}

	public void setMileage_no(int mileage_no) {
		this.mileage_no = mileage_no;
	}

	public int getMileage_use() {
		return mileage_use;
	}

	public void setMileage_use(int mileage_use) {
		this.mileage_use = mileage_use;
	}

	public int getMileage_saving() {
		return mileage_saving;
	}

	public void setMileage_saving(int mileage_saving) {
		this.mileage_saving = mileage_saving;
	}

	public int getMileage_total() {
		return mileage_total;
	}

	public void setMileage_total(int mileage_total) {
		this.mileage_total = mileage_total;
	}

	public Date getMileage_date() {
		return mileage_date;
	}

	public void setMileage_date(Date mileage_date) {
		this.mileage_date = mileage_date;
	}

	@Override
	public String toString() {
		return "MileageVO [member_id=" + member_id + ", mileage_no=" + mileage_no + ", mileage_use=" + mileage_use
				+ ", mileage_saving=" + mileage_saving + ", mileage_total=" + mileage_total + ", mileage_date="
				+ mileage_date + "]";
	}
	
	
}
