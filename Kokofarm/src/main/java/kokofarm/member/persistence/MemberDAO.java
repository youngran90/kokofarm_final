package kokofarm.member.persistence;

import kokofarm.member.domain.LoginDTO;
import kokofarm.member.domain.MemberVO;

public interface MemberDAO {
	public void joinMember(MemberVO vo) throws Exception;
	public MemberVO logincheck(LoginDTO dto) throws Exception;
	public Integer id_check(String userid) throws Exception;
}
