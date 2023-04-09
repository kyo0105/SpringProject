package com.domino.service;

import java.util.List;

import com.domino.domain.NoticeVO;

public interface NoticeService {
	
	List<NoticeVO> selectList(String type, int currentPage, int numberPerPage);
	
	List<NoticeVO> selectList(String type, int currentPage, int numberPerPage, String searchCondition, String searchWord);
	
	List<NoticeVO> selectView(String type, int notice_code);
	
	List<NoticeVO> selectView(String type, int notice_code, String searchCondition, String searchWord);
	
	void write(NoticeVO vo);
	
	void delete(int notice_code);
	
	void update(NoticeVO vo);
	
	NoticeVO selectOne(int notice_code);
}
