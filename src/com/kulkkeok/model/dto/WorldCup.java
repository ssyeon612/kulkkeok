package com.kulkkeok.model.dto;
import java.lang.Math;
import java.util.List;

public class WorldCup {
	private int gang = 0; // 32강 / 8강 / 4강
	private int round = 0; // 1라운드 , 2라운드 , 3라운드... ,.. 5라운드
	private int[] beerNoLists = null;
	private int[] beerWinLists = null;
	

	public int getGang() {
		return gang;
	}

	public int getRound() {
		return round;
	}

	public int[] getBeerNoLists() {
		return beerNoLists;
	}

	public int[] getBeerWinLists() {
		return beerWinLists;
	}


	
	// 첫 게임 setting
	public void settingGang(int gang) {
		this.gang = gang;
		//this.round = (int) baseLog(gang, 2);
		//this.round = 1;
		// 32강 -> 5라운드
		// 16강 -> 4라운드
		// ..
		// 4강 -> 2라운드
		beerNoLists = null;
	}
	
	// 이미지 랜덤 가져오기 : 첫 셋팅
	// 32강 끝내고
	// gang= 32
	public void settingFirstBeer(int gang) {
		// 첫 셋팅
			this.beerNoLists = new int[gang];
			
			for(int i=0;i<gang;i++) {
				
				int random = (int)(Math.random()*195)+1;
				
				boolean is = true;
				for(int j=0;j<beerNoLists.length;j++) {
					if(beerNoLists[j] == random) {
						is = false;
						i--;
						break;
					}
				}
				
				if(is) {this.beerNoLists[i] = random; System.out.println("firstSetting : "+beerNoLists[i]);}	
			}
			
			System.out.println("beerNoList setting 완료.");

	}
	
	
	
	// 32강 -> 16개
	// 16강 -> 8개
	// ..
	// 4강 -> 2개
	
	public void playingGame(int gang) {
		beerWinLists = new int[this.gang/2];
		System.out.println("beerWinLists setting 완료." );

	}
	
	public void settingBeerWinLists(int[] wins) {
		for(int i=0;i<wins.length;i++) {
			this.beerWinLists[i] = wins[i];
		}
	}
	
	public void settingBeerNoList() {
		
		
	}
	
	public void settingBeerWinLists() {
		this.beerNoLists = new int[this.gang];
		
		for(int i=0;i<beerNoLists.length;i++) {
			this.beerNoLists[i] = this.beerWinLists[i];
		}
		
	}
	
	

	private double baseLog(int x, int y) {
		// TODO Auto-generated method stub
		
		return Math.log10(x) / Math.log10(y);
	}
	
	
	
	
}
