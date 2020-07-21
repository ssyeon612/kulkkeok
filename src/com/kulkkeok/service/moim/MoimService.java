package com.kulkkeok.service.moim;

import java.util.Date;
import java.util.List;

import com.kulkkeok.model.dto.MoimDto;
import com.kulkkeok.model.dto.UserDto;

public interface MoimService {
	public List<MoimDto> getAllMoimList(int startRow, int endRow);
	public int totalMoim();
	public List<MoimDto> getMoimListNotClosed();
	public MoimDto getMoimDetail(int moimNo);
	public List<MoimDto> getMyMoimList(String userId);
	public int insertOne(String categoryNo, String moimTitle, String userId,
			java.sql.Date moimDate, String moimPlaceName, String moimPlaceAdd, String moimContent);
	public int update(int moimNo, String categoryNo, String moimTitle, 
			java.sql.Date moimDate, String moimPlaceName, String moimPlaceAdd, String moimContent);
	public int delete(int moimNo);
	public UserDto getWriterEmail(int moimNo);


}
