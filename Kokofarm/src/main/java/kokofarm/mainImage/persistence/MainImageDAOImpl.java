package kokofarm.mainImage.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.auction.domain.AuctionRegisterVO;
import kokofarm.auction.domain.RT_AuctionRegisterVO;
import kokofarm.mainImage.domain.AuctionListDTO;
import kokofarm.product.domain.ProductVO;


@Repository
public class MainImageDAOImpl implements MainImageDAO {

	@Inject
	private SqlSession session;
	private static String namespace = "kokofarm.mainProc.mapper.mProcMapper";
	
	@Override
	public List<ProductVO> mainImageLatest() throws Exception {
		
		return session.selectList(namespace+".mainImageLatest");
	}

	@Override
	public List<AuctionListDTO> mainAuctionImageLatest() throws Exception {
		
		return session.selectList(namespace+".mainAuctionLatest");
	}

	@Override
	public List<ProductVO> mainBestSellerItem() throws Exception {
		return session.selectList(namespace+".bestSellerItem");
	}

	@Override
	public List<RT_AuctionRegisterVO> rtAuctionImage() throws Exception {
	
		return session.selectList(namespace+".rtAuctionImage");
	}

	
	
}
