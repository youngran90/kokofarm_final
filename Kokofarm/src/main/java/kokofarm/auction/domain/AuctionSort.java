package kokofarm.auction.domain;

public class AuctionSort {
	private AuctionPage auctionPage;
	private String auction_sort;
	
	public AuctionPage getAuctionPage() {
		return auctionPage;
	}
	public void setAuctionPage(AuctionPage auctionPage) {
		this.auctionPage = auctionPage;
	}
	public String getAuction_sort() {
		return auction_sort;
	}
	public void setAuction_sort(String auction_sort) {
		this.auction_sort = auction_sort;
	}
	@Override
	public String toString() {
		return "AuctionSort [auctionPage=" + auctionPage + ", auction_sort=" + auction_sort + "]";
	}
	
	
}
