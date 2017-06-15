package kokofarm.auction.domain;

public class RT_AuctionCri {
	private int page;
	private int perPageNum;
	
	public RT_AuctionCri(){
		this.page = 1;
		this.perPageNum = 2;
	}

	public int getPage() {
		return page;
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
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public int getPageStart(){
		return (this.page -1)*perPageNum;
	}
	
	public int getPerPageNum(){
		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "AuctionCri [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	
}
