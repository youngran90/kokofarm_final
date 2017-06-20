package kokofarm.mypage.service;

import java.util.List;

import kokofarm.mypage.domain.graphVO;

public interface GraphService {

	 public List<graphVO> v_product_no()throws Exception;
	 
	 public List<graphVO> sum_graph(String member_id)throws Exception;
}
