package kokofarm.member.service;

import kokofarm.member.domain.LoginDTO;
import kokofarm.member.domain.MemberVO;

public interface MemberService {
	public void joinMember(MemberVO vo) throws Exception;
	public MemberVO login(LoginDTO dto) throws Exception;
	public Integer id_checkService(String userid) throws Exception;
	
}
