package kokofarm.center.service;

import java.util.List;

import kokofarm.center.domain.CenterVO;

public interface CenterService {
	public void create(CenterVO vo)throws Exception;
	public List<CenterVO> list()throws Exception;
}
