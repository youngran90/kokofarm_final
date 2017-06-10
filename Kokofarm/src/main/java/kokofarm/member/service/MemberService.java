package kokofarm.member.service;



import java.util.Date;

import kokofarm.member.domain.LoginDTO;
import kokofarm.member.domain.MemberVO;

public interface MemberService {
	public void joinMember(MemberVO vo) throws Exception;
	public Integer login(LoginDTO dto) throws Exception;
	public MemberVO memberInfo(LoginDTO dto) throws Exception;
	public Integer id_checkService(String userid) throws Exception;
	public void keepLogin(String member_id, String sessionId, Date next) throws Exception;
	public MemberVO checkLoginBefore(String value);
	
}
