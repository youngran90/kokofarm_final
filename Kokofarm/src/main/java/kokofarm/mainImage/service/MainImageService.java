package kokofarm.mainImage.service;

import java.util.List;

import kokofarm.auction.domain.AuctionRegisterVO;
import kokofarm.mainImage.domain.AuctionListDTO;
import kokofarm.product.domain.ProductVO;

public interface MainImageService {
	public List<ProductVO> productLatest() throws Exception;
	public List<AuctionListDTO> auctionPLatest() throws Exception;
	public List<ProductVO> bestSellerItems() throws Exception;
}
