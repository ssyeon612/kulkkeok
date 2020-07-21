package com.kulkkeok.model.dao.beerStory;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kulkkeok.model.dto.BeerStoryDto;

import mybatis.SqlMapConfig;

public class BeerStoryDaoMyBatis extends SqlMapConfig implements BeerStoryDao{
	//작성
		public int insertOne(BeerStoryDto dto) {
			System.out.println("MyBatis : [ insertOne ] 실행");
			int res = 0; 
			SqlSession session = null;
			
			try {
				session = getSqlSessionFactory().openSession(false);
				res = session.insert(namespace+"InsertOneSql",dto);
				//System.out.println(res);
				if(res>0) {session.commit();}
				
			} catch (Exception e) {
				
			}finally {
				session.close();
			}
			
			return res;
		}
		
		//수정
		public int updateOne(BeerStoryDto dto) {
			System.out.println("MyBatis : [ updateOne ] 실행");
			int res = 0; 
			SqlSession session = null;
			
			try {
				session = getSqlSessionFactory().openSession(false);
				res = session.update(namespace+"UpdateOneSql",dto);
				//System.out.println(res);
				if(res>0) {session.commit();}
				
			} catch (Exception e) {
				
			}finally {
				session.close();
			}
			return res;
		}
		
		//삭제
		public int deleteOne(int storyNo) {
			System.out.println("MyBatis : [ deleteOne ] 실행");
			int res = 0; 
			SqlSession session = null;
			
			try {
				session = getSqlSessionFactory().openSession(false);
				res = session.delete(namespace+"DeleteOneSql",storyNo);
				//System.out.println(res);
				if(res>0) {session.commit();}
				
			} catch (Exception e) {
				
			}finally {
				session.close();
			}
			return res;
			
		}
		
		//모든 맥주 이야기
		public List<BeerStoryDto> getAllList(){
			System.out.println("MyBatis : [ getAllList ] 실행");
			List<BeerStoryDto> list = new ArrayList<BeerStoryDto>();
			SqlSession session = null;
			
			try {
				session = getSqlSessionFactory().openSession(true);
				list = session.selectList(namespace+"GetAllListSql");
				
			} catch (Exception e) {
				
			}finally {
				session.close();
			}
		
			return list;
		}

		@Override
		public BeerStoryDto selectOne(int storyNo) {
			System.out.println("MyBatis : [ selectOne ] 실행");
			BeerStoryDto res = new BeerStoryDto();
			SqlSession session = null;
			
			try {
				session = getSqlSessionFactory().openSession(false);
				res = session.selectOne(namespace+"SelectOneSql",storyNo);
				
			} catch (Exception e) {
				// TODO: handle exception
			}finally {
				session.close();
			}
				
			return res;
		}

}
