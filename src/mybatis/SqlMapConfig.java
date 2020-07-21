package mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	private SqlSessionFactory sqlSessionFactory;
	
	public SqlSessionFactory getSqlSessionFactory() {
		String resource = "mybatis/Config.xml";
		//Config.xml 의 경로 저장.
		try {
			// Config.xml 의 파일정보를 읽어온다.
			Reader reader = Resources.getResourceAsReader(resource); // 해당하는 xml파일에서 정보들을 다 읽어오겠다는 의미.
			
			// 읽어온 정보를 가지고
			// SqlSessionFactory 객체 생성
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sqlSessionFactory;
	}
}
