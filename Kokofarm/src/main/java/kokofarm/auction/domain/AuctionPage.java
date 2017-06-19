package kokofarm.auction.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.beans.propertyeditors.URLEditor;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class AuctionPage {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	

	private int displayPageNum = 5; //화면에 보여질 페이징번호
	private AuctionCri cri;
	
	
	public void setCri(AuctionCri cri) {
		this.cri = cri;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public AuctionCri getCri() {
		return cri;
	}
	public void calcData(){
		endPage = (int)((Math.ceil(cri.getPage()/(double)displayPageNum) * displayPageNum)-1);
		startPage = ((endPage+1)-displayPageNum)+1;
		
		int tempEndPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		if(endPage>tempEndPage){
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage*cri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery(int page) {

		    UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
		        .queryParam("perPageNum", cri.getPerPageNum()).build();

		    return uriComponents.toUriString();
		  }
	
	public String makeSearch(int page){
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType", ((AuctionCri)cri).getSearchType())
				.queryParam("keyword", encoding(((AuctionCri)cri).getKeyword())).build();
		
		return uriComponents.toUriString();
	}
	
	private String encoding(String keyword){
		if(keyword == null || keyword.trim().length() == 0){
			return "";
		}
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
	
}
