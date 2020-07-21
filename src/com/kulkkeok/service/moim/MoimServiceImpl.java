package com.kulkkeok.service.moim;

import java.util.List;

import com.kulkkeok.model.dao.moim.MoimDao;
import com.kulkkeok.model.dao.moim.MoimDaoMyBatis;
import com.kulkkeok.model.dto.MoimDto;
import com.kulkkeok.model.dto.UserDto;

public class MoimServiceImpl implements MoimService{
	
	private MoimDao dao = new MoimDaoMyBatis();

	@Override
	public List<MoimDto> getAllMoimList(int startRow, int endRow) {
		return dao.getAllMoimList(startRow, endRow);
	}
	
	@Override
	public int totalMoim() {
		return dao.totalMoim();
	}
	
	@Override
	public List<MoimDto> getMoimListNotClosed(){
		return dao.getMoimListNotClosed();
	}

	@Override
	public MoimDto getMoimDetail(int seq) {
		return dao.getMoimDetail(seq);
	}

	@Override
	public List<MoimDto> getMyMoimList(String userId) {
		return dao.getMyMoimList(userId);
	}

	@Override
	public int insertOne(String categoryNo, String moimTitle, String userId,
			java.sql.Date moimDate, String moimPlaceName, String moimPlaceAdd, String moimContent) {
		
		MoimDto dto = new MoimDto();
		dto.setCategoryNo(categoryNo);
		dto.setMoimTitle(moimTitle);
		dto.setUserId(userId);
		dto.setMoimDate(moimDate);
		dto.setMoimPlaceName(moimPlaceName);
		dto.setMoimPlaceAdd(moimPlaceAdd);
		dto.setMoimContent(moimContent);
		
		int res = dao.insertOne(dto);
		
		return res;
	}

	@Override
	public int update(int moimNo, String categoryNo, String moimTitle,
			java.sql.Date moimDate, String moimPlaceName, String moimPlaceAdd, String moimContent) {
		
		MoimDto dto = new MoimDto();
		dto.setMoimNo(moimNo);
		dto.setCategoryNo(categoryNo);
		dto.setMoimTitle(moimTitle);
		dto.setMoimDate(moimDate);
		dto.setMoimPlaceName(moimPlaceName);
		dto.setMoimPlaceAdd(moimPlaceAdd);
		dto.setMoimContent(moimContent);
		
		int res = dao.update(dto);
		
		return res;
	}

	@Override
	public int delete(int seq) {
		return dao.delete(seq);
	}


//	@Override
//	public void MoimStatus() {
//	}

	@Override
	public UserDto getWriterEmail(int moimNo) {
		return dao.getWriterEmail(moimNo);
	}

}
