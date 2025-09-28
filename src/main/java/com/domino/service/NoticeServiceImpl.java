package com.domino.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.domino.domain.NoticeVO;
import com.domino.mapper.NoticeMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	private final NoticeMapper noticeMapper;
	
	@Override
	public List<NoticeVO> selectList(String type, int currentPage, int numberPerPage) {
		
		int begin = (currentPage - 1) * numberPerPage + 1;
		int end = begin + numberPerPage - 1;
		
		return noticeMapper.selectList(type, begin, end);
	}

	@Override
	public List<NoticeVO> selectList(String type, int currentPage, int numberPerPage, String searchCondition, String searchWord) {
		
		int begin = (currentPage - 1) * numberPerPage + 1;
		int end = begin + numberPerPage - 1;
		
		return noticeMapper.searchList(type, begin, end, searchCondition, searchWord);
	}

	@Override
	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED, timeout = -1)
	public List<NoticeVO> selectView(String type, int notice_code) {
		
		noticeMapper.updateHits(notice_code);
		
		return noticeMapper.selectView(type);
	}

	@Override
	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED, timeout = -1)
	public List<NoticeVO> selectView(String type, int notice_code, String searchCondition, String searchWord) {
		
		noticeMapper.updateHits(notice_code);
		
		return noticeMapper.searchView(type, searchCondition, searchWord);
	}

	@Override
	public void write(NoticeVO vo) {
		
		noticeMapper.insert(vo);
	}

	@Override
	public void delete(int notice_code) {
		
		noticeMapper.delete(notice_code);
	}

	@Override
	public void update(NoticeVO vo) {
		
		noticeMapper.update(vo);
	}

	@Override
	public NoticeVO selectOne(int notice_code) {
		
		return noticeMapper.selectOne(notice_code);
	}
	
	
	

}
