package kokofarm.auction.domain;

public class AuctionCri {
	private int page; //기본페이지
	private int perPageNum; //보여질 데이터 갯수
	private String searchType;
	private String keyword;

	public AuctionCri(){
		this.page = 1;
		this.perPageNum = 12;
	}
	
	public void setPage(int page) {
		if(page <= 0){
			this.page = 1;
			return;
		}
		
		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100){
			this.perPageNum = 12;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}

	public int getPageStart(){
		return (this.page -1)*perPageNum;
	}
	
	public int getPerPageNum(){
		return this.perPageNum;
	}
	
	/*검색처리*/
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	
}
