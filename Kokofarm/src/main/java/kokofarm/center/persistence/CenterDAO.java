package kokofarm.center.persistence;

import java.util.List;

import kokofarm.center.domain.CenterVO;

public interface CenterDAO {
	public void create(CenterVO vo)throws Exception;
	public List<CenterVO> list_notice()throws Exception;
	public List<CenterVO> list_faq()throws Exception;
	public CenterVO detail_notice(int cno)throws Exception;
	public CenterVO detail_faq(int cno)throws Exception;
	public void delete_notice(int cno) throws Exception;
	public void delete_faq(int cno)throws Exception;
	public void update_viewcnt(int cno)throws Exception;
}
