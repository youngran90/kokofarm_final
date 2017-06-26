package kokofarm.member.service;


import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kokofarm.member.domain.LoginDTO;
import kokofarm.member.domain.MemberVO;
import kokofarm.member.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	@Transactional
	@Override
	public void joinMember(MemberVO vo) throws Exception {
		dao.joinMember(vo);
		
	}
	
	
	@Override
	public Integer login(LoginDTO dto) throws Exception {
	
		return dao.logincheck(dto);
				
	}


	@Override
	public Integer id_checkService(String userid) throws Exception {
		return dao.id_check(userid);
	}


	@Override
	public void keepLogin(String member_id, String sessionId, Date next) throws Exception {
		dao.keepLogin(member_id, sessionId, next);
		
	}


	@Override
	public MemberVO checkLoginBefore(String value) {
		
		return dao.checkUserWithSessionKey(value);
	}


	@Override
	public MemberVO memberInfo(LoginDTO dto) throws Exception {
		
		return dao.memberInfo(dto);
	}

	@Transactional
	@Override
	public void updateMyInfo(MemberVO vo) throws Exception {
		dao.updateMyInfo(vo);
		
	}

}
