package com.kulkkeok.service.post;

import com.kulkkeok.model.dto.Paging;
import com.kulkkeok.model.dto.PostDto;

public interface PostService{

	Paging getPostList(String boardCode, int page);
	PostDto detailPost(String boardCode, int postNo);
	boolean updatePost(String boardCode, int postNo, String postTitle, String postContent);
	boolean deletePost(String boardCode, int postNo);
	boolean countViews(String boardCode, int postNo);
	boolean writePost(String boardCode,  String userId, String postTitle, String postContent);
	boolean writeAnswer(String boardCode, PostDto parentPost,String postTitle,String postContent,String userId);
}
