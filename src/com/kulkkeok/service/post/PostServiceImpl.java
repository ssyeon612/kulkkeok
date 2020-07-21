package com.kulkkeok.service.post;

import java.util.List;
import java.util.Map;

import com.kulkkeok.model.dao.comment.CommentDaoMyBatis;
import com.kulkkeok.model.dao.post.PostDao;
import com.kulkkeok.model.dao.post.PostDaoMyBatis;
import com.kulkkeok.model.dto.Paging;
import com.kulkkeok.model.dto.PostDto;

public class PostServiceImpl implements PostService{
	
	private PostDao dao = null;

	public PostServiceImpl() {
		super();
		dao = new PostDaoMyBatis();
	}
	
	@Override
	public Paging getPostList(String boardCode, int page) {
		// TODO Auto-generated method stub
		
		// [1] Create paging object.
		Paging paging = new Paging();
		
		// [2] get total Post.
		//int totalPost = dao.getTotalPost(boardCode);
		int totalPost = dao.getTotalPost(boardCode);
		
		// [3] Setting totalPage.
		paging.setting(page, totalPost);
		
		// [4] Setting startRow, and endRow.
		paging.handleRow();
		
		//System.out.println("startRow : "+ paging.getStartRow() +", endRow : "+paging.getEndRow());
		
		// [5] Get list from startRow to endRow.
		
		//List<PostDto> postList = dao.getPostList(boardCode, paging.getStartRow(), paging.getEndRow());
		List<PostDto> postList = dao.getPostList(boardCode, paging.getStartRow(), paging.getEndRow());
		
		// [6] Get commentCount.
		Map<Integer,Integer> commentCountMap = new CommentDaoMyBatis().getCommentCount(boardCode, paging.getStartRow(), paging.getEndRow());
		
		
		// [7] Get best Post List of boardCode.
		List<PostDto> bestPostList = dao.getBestPostList(boardCode);
		
		// [8] Setting...
		paging.setBestPostList(bestPostList);
		paging.setCommentCountMap(commentCountMap);
		paging.handleList(postList);
		
		// [9] Setting page blocks.
		paging.pageBlock();
		
		// Return.
		return paging;
	}

	@Override
	public PostDto detailPost(String boardCode, int postNo) {
		return dao.detailPost(boardCode, postNo);
	}

	@Override
	public boolean updatePost(String boardCode, int postNo, String postTitle, String postContent) {
		// TODO Auto-generated method stub
		PostDto post = new PostDto();
		
		post.setPostNo(postNo);
		post.setPostTitle(postTitle);
		post.setPostContent(postContent);
		
		return dao.updatePost(boardCode, post);
	}

	@Override
	public boolean deletePost(String boardCode, int postNo) {
		
		return dao.deletePost(boardCode, postNo);
	}

	@Override
	public boolean countViews(String boardCode, int postNo) {
		
		return dao.countViews(boardCode, postNo);
	}

	@Override
	public boolean writePost(String boardCode, String userId, String postTitle, String postContent) {
		
		PostDto post = new PostDto();
		
		post.setUserId(userId);
		post.setPostTitle(postTitle);
		post.setPostContent(postContent);
			
		return dao.writePost(boardCode, post);
	}

	@Override
	public boolean writeAnswer(String boardCode, PostDto parentPost, String postTitle, String postContent,String userId) {
		// TODO Auto-generated method stub
		
		int parentgroupno = parentPost.getGroupNo();
		int parentgroupsq = parentPost.getGroupSq();
		
		// [1] 순서 변경
		boolean resSq = dao.updateAnswer(boardCode, parentgroupno, parentgroupsq);
		
		if(resSq) {System.out.println("순서변경");}else {System.out.println("실패 or 변경할 순서가 없음.");}
		
		PostDto post = new PostDto();
			
		post.setPostTitle(postTitle);
		post.setGroupNo(parentgroupno);
		post.setGroupSq(parentgroupsq);
		post.setPostContent(postContent);
		post.setTitleTab(parentPost.getTitleTab());
		post.setUserId(userId);
	
		return dao.writeAnswer(boardCode, post);
	}
	
	
}
