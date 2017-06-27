package kokofarm.orderproduct.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class MileageVO implements Serializable {
	private String orderfinish_no;
	private String member_id;
	private String mileage_no;
	private int mileage_use;
	private int mileage_saving;
	private int mileage_total;
	private Timestamp mileage_date;

	public MileageVO() {
	}

	public MileageVO(String orderfinish_no, String member_id, String mileage_no, int mileage_use, int mileage_saving,
			int mileage_total, Timestamp mileage_date) {
		super();
		this.orderfinish_no = orderfinish_no;
		this.member_id = member_id;
		this.mileage_no = mileage_no;
		this.mileage_use = mileage_use;
		this.mileage_saving = mileage_saving;
		this.mileage_total = mileage_total;
		this.mileage_date = mileage_date;
	}

	public String getOrderfinish_no() {
		return orderfinish_no;
	}

	public void setOrderfinish_no(String orderfinish_no) {
		this.orderfinish_no = orderfinish_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMileage_no() {
		return mileage_no;
	}

	public void setMileage_no(String mileage_no) {
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

	public Timestamp getMileage_date() {
		return mileage_date;
	}

	public void setMileage_date(Timestamp mileage_date) {
		this.mileage_date = mileage_date;
	}

	@Override
	public String toString() {
		return "MileageVO [orderfinish_no=" + orderfinish_no + ", member_id=" + member_id + ", mileage_no=" + mileage_no
				+ ", mileage_use=" + mileage_use + ", mileage_saving=" + mileage_saving + ", mileage_total="
				+ mileage_total + ", mileage_date=" + mileage_date + "]";
	}

}