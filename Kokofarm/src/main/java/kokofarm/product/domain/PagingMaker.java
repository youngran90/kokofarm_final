package kokofarm.product.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import kokofarm.basic.domain.Criteria;
import kokofarm.basic.domain.SearchCriteria;

public class PagingMaker {

	private int totalCount; //총 개시물 개수
	private int startPage; //페이징 시작
	private int endPage; // 페이징 끝 번호
	private boolean prev;
	private boolean next;
	private int lastPage; // 맨 마지막 번호
	private int start; // 디비에서 사용될 시작 번호
	private int end;// 디비에서 사용될 끝 번호
	private int displayPageNum =4 ; // 화면상에 보여줄 리스트의 크기 
	private int page = 1;	//현재페이지 
	private int perPageNum = 5; //하단 페이징할 개수 5로 하면 될듯 
	private String searchOption; // 검색 옵션 ex)name, seller등
	private String searchText; // 검색어
	private String input_sort; // 정렬 방식
	private String ca1; // 카테고리 정보
	private String ca2; // 카테고리 정보
	private String ca3; // 카테고리 정보
	

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
			this.perPageNum = 5;
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
		int pageGroupNum = (int) Math.ceil((double) page / perPageNum);
		
		startPage = (pageGroupNum - 1) * perPageNum + 1;
		
		if (startPage <= 0)
			startPage = 1;
		endPage = startPage + perPageNum - 1; // 페이지그룹의 마지막페이지
		
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
		calcData();
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
				+ prev + ", next=" + next + ", lastPage=" + lastPage + ",  start=" + start
				+ ", end=" + end + ", displayPageNum=" + displayPageNum + ", page=" + page + ", perPageNum="
				+ perPageNum + ", searchOption=" + searchOption + ", searchText=" + searchText + ", input_sort="
				+ input_sort + ", ca1=" + ca1 + ", ca2=" + ca2 + ", ca3=" + ca3 + "]";
	}

}
