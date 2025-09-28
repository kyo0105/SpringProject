package com.domino.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.domino.domain.NoticeVO;

public interface NoticeMapper {
	
	// 1.1 페이징 처리된 공지 목록 반환
	List<NoticeVO> selectList(@Param("type")String type, @Param("begin")int begin, @Param("end")int end);

	// 1.2 총 공지 수 반환
	int selectTotalRecords(String type);

	// 2.1 공지 검색
	List<NoticeVO> searchList(@Param("type")String type, @Param("begin")int begin, @Param("end")int end, @Param("searchCondition")String searchCondition, @Param("searchWord")String searchWord);

	// 2.2 검색된 총 공지 수 반환 + 검색조건&검색어
	int searchTotalRecords(@Param("type")String type, @Param("searchCondition")String searchCondition, @Param("searchWord")String searchWord);

	// 3.1 공지 상세보기
	List<NoticeVO> selectView(String type);

	// 3.2 공지 검색 상세보기
	List<NoticeVO> searchView(@Param("type")String type, @Param("searchCondition")String searchCondition, @Param("searchWord")String searchWord);

	// 3.3 조회수 증가
	void updateHits(int notice_code);

	// 4. 공지 작성
	void insert(NoticeVO vo);

	// 5. 공지 삭제
	void delete(int notice_code);

	// 6.1 공지 수정
	void update(NoticeVO vo);

	// 6.2 공지 수정 글 가져오기
	NoticeVO selectOne(int notice_code);
	
}
