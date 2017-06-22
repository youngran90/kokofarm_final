package kokofarm.mainImage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.auction.domain.AuctionRegisterVO;
import kokofarm.mainImage.domain.AuctionListDTO;
import kokofarm.mainImage.persistence.MainImageDAO;
import kokofarm.product.domain.ProductVO;

@Service
public class MainImageServiceImpl implements MainImageService {

	@Inject
	private MainImageDAO dao;
	
	@Override
	public List<ProductVO> productLatest() throws Exception {
		
		return dao.mainImageLatest();
	}

	@Override
	public List<AuctionListDTO> auctionPLatest() throws Exception {
			return dao.mainAuctionImageLatest();
	}

	@Override
	public List<ProductVO> bestSellerItems() throws Exception {
		return dao.mainBestSellerItem();
	}

}
