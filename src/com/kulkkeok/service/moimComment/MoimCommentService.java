package com.kulkkeok.service.moimComment;

import java.util.List;
import java.util.Map;

import com.kulkkeok.model.dto.MoimCommentDto;

public interface MoimCommentService {
	public boolean writeMoimComment(int moimNo, String mmContent, String userId);
	public String commentList(int moimNo);
	public boolean updateComment(int moimNo, int mmNo, String mmContent);
	public boolean deleteComment(int moimNo, int mmNo, String mmContent);
	public MoimCommentDto selectParentCommect(int moimNo, int mmNo);
	public int lastGroupsq(int moimNo, int parentgroupNo);
	public boolean replyComment(int moimNo, int mmNo, String mmContent, String userId);
	public Map<Integer, Integer> getCommentCount(int startRow, int endRow);


}
