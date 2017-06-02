package kokofarm.member.persistence;

import kokofarm.member.domain.MemberVO;

public interface MemberDAO {
	public void joinMember(MemberVO vo) throws Exception;
	
}
