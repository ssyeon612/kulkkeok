package com.kulkkeok.model.dao.worldcup;



import java.math.BigDecimal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kulkkeok.model.dto.BeerDto;

import mybatis.SqlMapConfig;

public class WorldCupDaoMyBatis extends SqlMapConfig implements WorldCupDao{

	@Override
	public List<BeerDto> getBeerList(int[] beerNoList) {
		System.out.println("MyBatis : [ getBeerList ] 실행");
		SqlSession session = null;
		
		List<BeerDto> list = new ArrayList<BeerDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			
			for(int i=0;i<beerNoList.length;i++) {
					int beerNo = beerNoList[i];
					
					BeerDto tmp = new BeerDto();
					
					tmp = session.selectOne(namespace+"getBeerListSql",beerNo);
					
					tmp.setBeerKorName(tmp.getBeerKorName().trim());
					tmp.setBeerEngName(tmp.getBeerEngName().trim());
					tmp.setBeerDetail(tmp.getBeerDetail().trim());
					tmp.setBeerPic(tmp.getBeerPic().trim());
					
					list.add(tmp);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		return list;
	}

	@Override
	public BeerDto getBeer(int win) {
		System.out.println("MyBatis : [ getBeer ] 실행");
		SqlSession session = null;
		BeerDto tmp = new BeerDto();
		
		try {
			session = getSqlSessionFactory().openSession(false);		
			tmp = session.selectOne(namespace+"getBeerOneSql",win);
					
			tmp.setBeerKorName(tmp.getBeerKorName().trim());
			tmp.setBeerEngName(tmp.getBeerEngName().trim());
			tmp.setBeerDetail(tmp.getBeerDetail().trim());
			tmp.setBeerPic(tmp.getBeerPic().trim());


		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}

		return tmp;
	}

	@Override
	public boolean confirmWorldcupBeer(int beerNo) {
		System.out.println("MyBatis : [ confirmWorldcupBeer ] 실행");
		SqlSession session = null;
		BeerDto tmp = new BeerDto();

		boolean res = false;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			tmp = session.selectOne(namespace+"confirmWorldcupBeerSql",beerNo);
			
			if(tmp!=null) {res=true;}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}

		return res;
	}

	@Override
	public boolean insertWorldcupBeer(int beerNo) {
		System.out.println("MyBatis : [ insertWorldcupBeer ] 실행");
		SqlSession session = null;
		boolean res = false;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			int r = session.insert(namespace+"insertWorldcupBeerSql",beerNo);
			if(r>0) {
				session.commit();
				res=true;
				}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public boolean countWorldcupBeer(int beerNo) {
		System.out.println("MyBatis : [ countWorldcupBeer ] 실행");
		SqlSession session = null;
		boolean res = false;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			int r = session.update(namespace+"countWorldcupBeerSql",beerNo);
			if(r>0) {
				session.commit();
				res=true;
				}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		
		return res;
	}

	@Override
	public Map<Integer,Integer> getWorldcupRanking() {
		System.out.println("MyBatis : [ getWorldcupRanking ] 실행");
		SqlSession session = null;
		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();

		HashMap<Integer,Integer> map = new HashMap<Integer, Integer>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			resultList = session.selectList(namespace+"getWorldcupRankingSql");
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		for(HashMap<String, Object> list : resultList) {
			int beerNo = ((BigDecimal) list.get("BEER_NO")).intValue();
			int cupCount = ((BigDecimal) list.get("CUPCOUNT")).intValue();
			map.put(beerNo, cupCount);
		}
		return map;
	}

	@Override
	public Map<BeerDto, Integer> getRanking(Map<Integer, Integer> map) {
		System.out.println("MyBatis : [ getRanking ] 실행");
		SqlSession session = null;
		Map<BeerDto, Integer> res = new HashMap<BeerDto, Integer>();
		
		Iterator<Integer> itr = map.keySet().iterator();
		
		try {
			session = getSqlSessionFactory().openSession(false);

			while(itr.hasNext()) {
				
				Integer win = (Integer)itr.next();
				Integer count = (Integer) map.get(win);
				BeerDto tmp = new BeerDto();
				System.out.println(" beerNo [ "+win+" ]");
				tmp = session.selectOne(namespace+"getBeerOneSql",win);
				
				tmp.setBeerKorName(tmp.getBeerKorName().trim());
				tmp.setBeerEngName(tmp.getBeerEngName().trim());
				tmp.setBeerDetail(tmp.getBeerDetail().trim());
				tmp.setBeerPic(tmp.getBeerPic().trim());
				
				res.put(tmp, count);
			}
			
		} catch (Exception e) {
			
		}finally {
			session.close();		
		}
		
		return res;
	}
}
