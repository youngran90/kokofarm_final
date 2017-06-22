package kokofarm.mainImage.persistence;

import java.util.List;


import kokofarm.mainImage.domain.AuctionListDTO;
import kokofarm.product.domain.ProductVO;

public interface MainImageDAO {
	public List<ProductVO> mainImageLatest() throws Exception;
	public List<AuctionListDTO> mainAuctionImageLatest() throws Exception;
	public List<ProductVO> mainBestSellerItem() throws Exception;
	
}
