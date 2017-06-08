package kokofarm.member.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.member.domain.LoginDTO;
import kokofarm.member.domain.MemberVO;

@Repository
class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "kokofarm.member.mapper.MemberMapper";
	
	
	
	@Override
	public void joinMember(MemberVO vo) throws Exception {
		session.insert(namespace+".joinMember", vo);
		
	}


	@Override
	public MemberVO logincheck(LoginDTO dto) throws Exception {
	
		return session.selectOne(namespace+".logincheck", dto);
	}


	@Override
	public Integer id_check(String userid) throws Exception {
	
		return session.selectOne(namespace+".id_check", userid);
	}

}
