package com.kulkkeok.model.dao.beer;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.StarAvgDto;

import mybatis.SqlMapConfig;

public class BeerDaoMyBatis extends SqlMapConfig implements BeerDao{

	@Override
	public List<BeerDto> AllBeerList() {
		System.out.println("MyBatis : [ AllBeerList ] 실행");
		SqlSession session = null;
		List<BeerDto> list = new ArrayList<BeerDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"allBeerListSql");
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		for(BeerDto beer:list) {
			//System.out.println(beer.getBeerPic());
			beer.setBeerPic(beer.getBeerPic().trim());
		}

		return list;
	}

	@Override
	public List<BeerDto> TypeOfBeerListType(String typeCode) {
		// TODO Auto-generated method stub
		System.out.println("MyBatis : [ TypeOfBeerListType ] 실행");
		SqlSession session = null;
		List<BeerDto> list = new ArrayList<BeerDto>();
		String name = "%"+typeCode+"%";
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"typeOfBeerListTypeSql",name);
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		for(BeerDto beer:list) {
			//System.out.println(beer.getBeerPic());
			beer.setBeerPic(beer.getBeerPic().trim());
			beer.setTypeName(beer.getTypeName().trim());
		}
		//typeOfBeerListTypeSql
		return list;
	}

	@Override
	public List<BeerDto> TypeOfBeerListOrigin(String originCode) {
		// TODO Auto-generated method stub
		System.out.println("MyBatis : [ TypeOfBeerListOrigin ] 실행");
		SqlSession session = null;
		List<BeerDto> list = new ArrayList<BeerDto>();
		
				
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"typeOfBeerListOriginSql",originCode.trim());
					
		}catch (Exception e) {
					// TODO: handle exception
		}finally {
					session.close();
		}
				
		for(BeerDto beer:list) {
					//System.out.println(beer.getBeerPic());
			beer.setBeerPic(beer.getBeerPic().trim());
		}
				//typeOfBeerListTypeSql
		return list;
	}

	@Override
	public List<BeerDto> TypeOfBeerListName(String beerName) {
		System.out.println("MyBatis : [ TypeOfBeerListName ] 실행");
		SqlSession session = null;
		List<BeerDto> list = new ArrayList<BeerDto>();
		String name = "%"+beerName+"%";
				
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"typeOfBeerListNameSql",name);
			
		}catch (Exception e) {
					// TODO: handle exception
		}finally {
			session.close();
		}
				
		for(BeerDto beer:list) {
			//System.out.println(beer.getBeerPic());
			beer.setBeerPic(beer.getBeerPic().trim());
		}
				//typeOfBeerListTypeSql
		return list;
	}

	@Override
	public BeerDto selectOne(int beerNo) {
		System.out.println("MyBatis : [ selectOne ] 실행");
		SqlSession session = null;
		BeerDto beer = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			beer = session.selectOne(namespace+"selectOneSql",beerNo);
			
		}catch (Exception e) {
					// TODO: handle exception
		}finally {
			session.close();
		}
				
		if(beer != null) {
			System.out.println(beer.getBeerPic());
			beer.setBeerPic(beer.getBeerPic().trim());
		}
		
		return beer;
	}

	@Override
	public List<BeerDto> otherOriginBeerList() {
		System.out.println("MyBatis : [ otherOriginBeerList ] 실행");
		SqlSession session = null;
		List<BeerDto> list = new ArrayList<BeerDto>();
				
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"otherOriginBeerListSql");
			
		}catch (Exception e) {
					// TODO: handle exception
		}finally {
			session.close();
		}
				
		for(BeerDto beer:list) {
			//System.out.println(beer.getBeerPic());
			beer.setBeerPic(beer.getBeerPic().trim());
		}
				//typeOfBeerListTypeSql
		return list;
	}

	@Override
	public List<BeerDto> otherTypeBeerList() {
		System.out.println("MyBatis : [ otherTypeBeerList ] 실행");
		SqlSession session = null;
		List<BeerDto> list = new ArrayList<BeerDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"otherTypeBeerListSql");
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		for(BeerDto beer:list) {
			//System.out.println(beer.getBeerPic());
			beer.setBeerPic(beer.getBeerPic().trim());
			beer.setTypeName(beer.getTypeName().trim());
		}
		//typeOfBeerListTypeSql
		return list;
	}
	
	@Override
	public StarAvgDto updateStarAvg(int beerNo) {
		System.out.println("MyBatis : [ StarAvgDto ] 실행");
		SqlSession session = null;
		StarAvgDto res  = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			int star = session.selectOne(namespace+"StarAvgDtoSql",beerNo);
			res = new StarAvgDto(star);
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		
		return res;
	}
	

}
