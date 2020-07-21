package com.kulkkeok.service.worldcup;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kulkkeok.model.dao.worldcup.WorldCupDao;
import com.kulkkeok.model.dao.worldcup.WorldCupDaoMyBatis;
import com.kulkkeok.model.dto.BeerDto;
import com.kulkkeok.model.dto.WorldCup;

public class WorldCupServiceImpl implements WorldCupService {
	private WorldCup game = null;
	private WorldCupDao dao = null;
	private List<BeerDto> list = null;
	
	// 첫 경기
	@Override
	public void getWorldCupGame(int gang) {
		game = new WorldCup();
		
		game.settingGang(gang); // 첫 게임 셋팅
		game.settingFirstBeer(gang); // 처음 이미지 셋팅
		game.playingGame(gang); // beerWinList 셋팅
	}
	
	
	// beerList가져오기
	@Override
	public void getBeerList() {
		dao = new WorldCupDaoMyBatis();
		
		this.list = dao.getBeerList(game.getBeerNoLists());

		// testing
//		for(BeerDto dto : list) {
//			System.out.println(dto.getBeerKorName());
//		}
		
		
	}
	

	@Override
	public String getBeerVs(int index) {
		JSONObject totalObject = new JSONObject(); // 배열을 저장할 totalObject
		JSONArray beerArray = new JSONArray(); // commentInfo JSON 객체를 저장할 commentArray

		System.out.println("getBeerVs : index = "+index);
		for(int i = 0 ;i<2;i++) {
			JSONObject beerInfo = new JSONObject(); 
			
				beerInfo.put("beerNo", Integer.toString((list.get(index+index+i).getBeerNo())));
				beerInfo.put("beerKorName", list.get(index+index+i).getBeerKorName());
				beerInfo.put("beerDetail", list.get(index+index+i).getBeerDetail());
				beerInfo.put("beerPic", list.get(index+index+i).getBeerPic());
				System.out.println("<< beer"+(i+1)+" : "+list.get(index+index+i).getBeerKorName() +" beerNo: "+list.get(index+index+i).getBeerNo() +" index : "+(index+index+i)+ ">>");
			
			
			
			beerArray.add(beerInfo);
		}
		totalObject.put("beers", beerArray);
		
		String jsoninfo = totalObject.toJSONString();
		
		//System.out.println(jsoninfo);
		
		return jsoninfo;
	}

	@Override
	public void setWinList(String winList,int gang) {
		// TODO Auto-generated method stub
		
		String[] winListString = winList.split(",");
		
		int[] wins = new int[winListString.length];
		
		for(int i=0;i<wins.length;i++) {
			wins[i] = Integer.parseInt(winListString[i]);
		}
		
		game.settingBeerWinLists(wins);
		game.settingGang(gang);
		game.settingBeerWinLists();
		
	}
	

	@Override
	public BeerDto getWinBeer(int win) {
		// TODO Auto-generated method stub
		boolean res = dao.confirmWorldcupBeer(win);
		
		if(res) {
			dao.countWorldcupBeer(win);
			System.out.println(res + "이미 있는 맥주");
		}else {
			dao.insertWorldcupBeer(win);	
			System.out.println(res + "새로 만든 맥주");
		}
		
		return dao.getBeer(win);
	}


	@Override
	public BeerDto getBeerDto(int index) {	
		return list.get(index);
	}


	@Override
	public int getGang() {
		// TODO Auto-generated method stub
		return game.getGang();
	}


	@Override
	public Map<BeerDto, Integer> getRanking() {
		Map<Integer,Integer> map = dao.getWorldcupRanking();
		Map<BeerDto,Integer> res = dao.getRanking(map);
		
		return res;
	}
	
	

}
