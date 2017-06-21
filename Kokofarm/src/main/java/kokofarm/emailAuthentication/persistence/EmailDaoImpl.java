package kokofarm.emailAuthentication.persistence;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class EmailDaoImpl implements EmailDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "kokofarm.email.mapper.emailMapper";
	
	
	@Override
	public String userInfo(String email) throws Exception {
		
		return session.selectOne(namespace+".userInfo", email);
	}

	@Override
	public void changePw(Map<String, String> map) throws Exception {
		session.update(namespace+".changePw",map);

	}

	@Override
	public Integer passInfo(Map<String, String> map) throws Exception {
		
		return session.selectOne(namespace+".passInfo", map);
	}

}
