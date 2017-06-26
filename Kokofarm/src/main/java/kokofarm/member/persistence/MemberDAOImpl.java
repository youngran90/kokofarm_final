package kokofarm.member.persistence;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
	public Integer logincheck(LoginDTO dto) throws Exception {
	
		return session.selectOne(namespace+".logincheck", dto);
	}


	@Override
	public Integer id_check(String userid) throws Exception {
	
		return session.selectOne(namespace+".id_check", userid);
	}


	@Override
	public void keepLogin(String member_id, String sessionId, Date next){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("member_id", member_id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next",next);
		
		session.update(namespace+".keepLogin",paramMap);
		
	}

	
	@Override
	public MemberVO checkUserWithSessionKey(String value) {
	
		return session.selectOne(namespace+".checkUserWithSessionKey", value);
	}



	@Override
	public MemberVO memberInfo(LoginDTO dto) throws Exception {
	
		return session.selectOne(namespace+".memberInfo", dto);
	}


	@Override
	public void updateMyInfo(MemberVO vo) throws Exception {
		session.update(namespace+".updateMyInfo", vo);
		
	}



}
