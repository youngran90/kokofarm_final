package kokofarm.mainImage.persistence;

import java.util.List;

import kokofarm.auction.domain.RT_AuctionRegisterVO;
import kokofarm.mainImage.domain.AuctionListDTO;
import kokofarm.product.domain.ProductVO;


public interface MainImageDAO {
	public List<ProductVO> mainImageLatest() throws Exception;
	public List<AuctionListDTO> mainAuctionImageLatest() throws Exception;
	public List<ProductVO> mainBestSellerItem() throws Exception;
	public List<RT_AuctionRegisterVO> rtAuctionImage() throws Exception;
	
}
