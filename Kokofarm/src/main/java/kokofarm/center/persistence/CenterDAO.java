package kokofarm.center.persistence;

import java.util.List;

import kokofarm.center.domain.CenterVO;

public interface CenterDAO {
	public void create(CenterVO vo)throws Exception;
	public List<CenterVO> list()throws Exception;
}
