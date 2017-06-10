package kokofarm.member.persistence;



import java.util.Date;

import kokofarm.member.domain.LoginDTO;
import kokofarm.member.domain.MemberVO;

public interface MemberDAO {
	public void joinMember(MemberVO vo) throws Exception;
	public Integer logincheck(LoginDTO dto) throws Exception;
	public MemberVO memberInfo(LoginDTO dto) throws Exception;
	public Integer id_check(String userid) throws Exception;
	public void keepLogin(String member_id, String sessionId, Date next);
	public MemberVO checkUserWithSessionKey(String value);
}
