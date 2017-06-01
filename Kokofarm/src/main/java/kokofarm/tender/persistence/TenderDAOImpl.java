package kokofarm.tender.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kokofarm.tender.domain.TenderVO;

@Repository
public class TenderDAOImpl implements TenderDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace= "kokofarm.tender.mappers.TenderMapper";

	@Override
	public void insertTender(TenderVO tender) throws Exception {
		session.insert(namespace+".insertTender",tender);
		
	}
	

}
