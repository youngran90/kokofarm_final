package kokofarm.mypage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kokofarm.mypage.domain.graphVO;
import kokofarm.mypage.persistence.GraphDAO;

@Service
public class GraphServiceImpl implements GraphService {

	
	@Inject
	private GraphDAO dao;
	
	@Override
	public List<graphVO> v_product_no() throws Exception {
		System.out.println(dao.v_product_no().toString());
		return dao.v_product_no();
	}

	@Override
	public List<graphVO> sum_graph(String member_id) throws Exception {
		return dao.sum_graph(member_id);
	}
}
