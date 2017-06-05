package kokofarm.member.service;

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
	
	
	@Transactional
	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
	
		return dao.logincheck(dto);
				
	}

}
