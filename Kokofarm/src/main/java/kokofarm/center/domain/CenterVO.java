package kokofarm.center.domain;

import java.io.Serializable;

public class CenterVO implements Serializable{
	private String cno;
	private String c_title;
	private String c_group;
	private String c_content;
	private String c_regdate;
	private int c_viewcnt;
	
	public CenterVO(){};
	
	
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public String getC_group() {
		return c_group;
	}
	public void setC_group(String c_group) {
		this.c_group = c_group;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_regdate() {
		return c_regdate;
	}
	public void setC_regdate(String c_regdate) {
		this.c_regdate = c_regdate;
	}
	public int getC_viewcnt() {
		return c_viewcnt;
	}
	public void setC_viewcnt(int c_viewcnt) {
		this.c_viewcnt = c_viewcnt;
	}
	@Override
	public String toString() {
		return "CenterVO [cno=" + cno + ", c_title=" + c_title + ", c_group=" + c_group + ", c_content=" + c_content
				+ ", c_regdate=" + c_regdate + ", c_viewcnt=" + c_viewcnt + "]";
	}
	
	
}
