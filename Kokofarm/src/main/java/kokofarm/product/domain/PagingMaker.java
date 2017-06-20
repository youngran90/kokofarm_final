package kokofarm.product.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import kokofarm.basic.domain.Criteria;
import kokofarm.basic.domain.SearchCriteria;

public class PagingMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int lastPage;
	private int cpage;
	private int start;
	private int end;
	private int displayPageNum = 12;
	private int page = 1;
	private int perPageNum = 4;
	private String searchOption;
	private String searchText;
	private String input_sort;
	private String ca1;
	private String ca2;
	private String ca3;
	

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

	public String getSearchOption() {
		return searchOption;
	}

	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getInput_sort() {
		return input_sort;
	}

	public void setInput_sort(String input_sort) {
		this.input_sort = input_sort;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public void setPage(int page) {

		if (page <= 0) {
			this.page = 1;
			return;
		}

		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {

		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 4;
			return;
		}

		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}

	public int getPageStart() {

		return (this.page - 1) * perPageNum;
	}

	public int getPerPageNum() {

		return this.perPageNum;
	}

	public int getCpage() {
		return cpage;
	}

	public void setCpage(int cpage) {
		this.cpage = cpage;
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

	public void calcData() {

		endPage = (int) (Math.ceil(getPage() / (double) displayPageNum) * displayPageNum);

		startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int) (Math.ceil(totalCount / (double) getPerPageNum()));

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		prev = startPage == 1 ? false : true;

		next = endPage * getPerPageNum() >= totalCount ? false : true;

		lastPage = (totalCount / displayPageNum) + 1;

		int start = 0;
		int end = 0;

		start = displayPageNum * (getPage() - 1) + 1; // 시작위치
		end = (displayPageNum * (getPage() - 1)) + displayPageNum;

		this.start = start;
		this.end = end;

	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public int getLastPage() {
		return lastPage;
	}

	public String makeQuery(int page) {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", getPerPageNum()).build();

		return uriComponents.toUriString();
	}

	private String encoding(String keyword) {
		if (keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}

	@Override
	public String toString() {
		return "PagingMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", lastPage=" + lastPage + ", cpage=" + cpage + ", start=" + start
				+ ", end=" + end + ", displayPageNum=" + displayPageNum + ", page=" + page + ", perPageNum="
				+ perPageNum + ", searchOption=" + searchOption + ", searchText=" + searchText + ", input_sort="
				+ input_sort + ", ca1=" + ca1 + ", ca2=" + ca2 + ", ca3=" + ca3 + "]";
	}

}
