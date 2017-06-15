package kokofarm.product.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ImPage implements Serializable{
	
	private int pageSu;

	private int start;

	private int end;

	private int pageGroupNum;

	private int pageStart;

	private int pageEnd;

	private int nextGroup;

	private int prevGroup;

	private int nextStart;

	private int prevStart;

	private int number;

	private int total;

	private int pageSize;

	private int pageGroupSize;

	private int cpage;

	
	public ImPage() {};
	
	
	public ImPage(int cpage, int pageSize, int total, int pageGroupSize) {
		set(cpage, pageSize, total, pageGroupSize);
	}
	private void set(int cpage, int pageSize, int total, int pageGroupSize) {
		
		if (cpage < 1)
			cpage = 1;
		this.cpage = cpage;
		this.pageSize = pageSize;
		if (pageGroupSize < 1)
			pageGroupSize = 5;
		this.pageGroupSize = pageGroupSize;

		this.total = total;

		int pageSu = (int) Math.ceil((double) total / pageSize); // 페이지수
		if (pageSu < cpage)
			cpage = pageSu;

		int start = 0;
		int end = 0;

		start = pageSize * (cpage - 1) + 1; // 시작위치
		end = (pageSize * (cpage - 1)) + pageSize;
		
		int pageGroupNum = (int) Math.ceil((double) cpage / pageGroupSize); // 현재
		// 페이지
		// 그룹
		int pageStart = (pageGroupNum - 1) * pageGroupSize + 1; // 페이지그룹의 첫페이지
		if (pageStart <= 0)
			pageStart = 1;
		int pageEnd = pageStart + pageGroupSize - 1; // 페이지그룹의 마지막페이지

		int nextGroup = pageGroupNum + 1; // 다음그룹
		int prevGroup = pageGroupNum - 1; // 이전그룹
		int nextStart = ((nextGroup - 1) * pageGroupSize) + 1; // 다음 페이지 그룹의 첫
		// 페이지
		int prevStart = ((prevGroup - 1) * pageGroupSize) + 1;


		this.pageSu = pageSu;
		this.start = start;
		this.end = end;
		this.pageGroupNum = pageGroupNum;
		this.pageStart = pageStart;
		this.pageEnd = pageEnd;
		this.nextGroup = nextGroup;
		this.prevGroup = prevGroup;
		this.nextStart = nextStart;
		this.prevStart = prevStart;
		this.end = end;
	}


	public int getPageSu() {
		return pageSu;
	}


	public void setPageSu(int pageSu) {
		this.pageSu = pageSu;
	}


	public int getStart() {
		return start;
	}


	public void setStart(int start) {
		this.start = start;
	}


	public int getEnd() {
		return end;
	}


	public void setEnd(int end) {
		this.end = end;
	}


	public int getPageGroupNum() {
		return pageGroupNum;
	}


	public void setPageGroupNum(int pageGroupNum) {
		this.pageGroupNum = pageGroupNum;
	}


	public int getPageStart() {
		return pageStart;
	}


	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}


	public int getPageEnd() {
		return pageEnd;
	}


	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}


	public int getNextGroup() {
		return nextGroup;
	}


	public void setNextGroup(int nextGroup) {
		this.nextGroup = nextGroup;
	}


	public int getPrevGroup() {
		return prevGroup;
	}


	public void setPrevGroup(int prevGroup) {
		this.prevGroup = prevGroup;
	}


	public int getNextStart() {
		return nextStart;
	}


	public void setNextStart(int nextStart) {
		this.nextStart = nextStart;
	}


	public int getPrevStart() {
		return prevStart;
	}


	public void setPrevStart(int prevStart) {
		this.prevStart = prevStart;
	}


	public int getNumber() {
		return number;
	}


	public void setNumber(int number) {
		this.number = number;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getPageGroupSize() {
		return pageGroupSize;
	}


	public void setPageGroupSize(int pageGroupSize) {
		this.pageGroupSize = pageGroupSize;
	}


	public int getCpage() {
		return cpage;
	}


	public void setCpage(int cpage) {
		this.cpage = cpage;
	}


	@Override
	public String toString() {
		return "ImPage [pageSu=" + pageSu + ", start=" + start + ", end=" + end + ", pageGroupNum=" + pageGroupNum
				+ ", pageStart=" + pageStart + ", pageEnd=" + pageEnd + ", nextGroup=" + nextGroup + ", prevGroup="
				+ prevGroup + ", nextStart=" + nextStart + ", prevStart=" + prevStart + ", number=" + number
				+ ", total=" + total + ", pageSize=" + pageSize + ", pageGroupSize=" + pageGroupSize + ", cpage="
				+ cpage + "]";
	}
	
	
	
	
}
	
