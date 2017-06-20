package kokofarm.mypage.persistence;

import java.util.List;

import kokofarm.mypage.domain.graphVO;

public interface GraphDAO {

	public List<graphVO> v_product_no()throws Exception;
	
	public List<graphVO>  sum_graph(String member_id)throws Exception;
}
