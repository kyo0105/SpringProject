package com.domino.service;

import org.springframework.stereotype.Service;

import com.domino.domain.PageBlock;
import com.domino.mapper.NoticeMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticePagingServiceImpl implements NoticePagingService{
	
	private final NoticeMapper noticeMapper;
	
	@Override
	public PageBlock paging(String type, int currentPage, int numberPerPage) {

		int numberOfPageBlock = 10;
		int totalRecords , totalPages = 0;
		
		totalRecords = noticeMapper.selectTotalRecords(type);
		totalPages = (int)Math.ceil((double)totalRecords / numberPerPage);  // 총페이지수
		
		PageBlock pageBlock = new PageBlock();
		pageBlock.setCurrentPage(currentPage);
		pageBlock.setNumberPerPage(numberPerPage);
		pageBlock.setNumberOfPageBlock(numberOfPageBlock);
		pageBlock.setTotalRecords(totalRecords);
		pageBlock.setTotalPages(totalPages);
		int start = (currentPage-1) / numberOfPageBlock * numberOfPageBlock + 1;
		pageBlock.setStart(start);
		int end = start + numberOfPageBlock -1;
		if(end > totalPages) end = totalPages;
		pageBlock.setEnd(end);
					
		if(start != 1) pageBlock.setPrev(true); //이전버튼
		if(end != totalPages) pageBlock.setNext(true); //다음버튼
		
		return pageBlock;
		
	}

	@Override
	public PageBlock paging(String type, int currentPage, int numberPerPage, String searchCondition, String searchWord) {

		int numberOfPageBlock = 10;
		int totalRecords , totalPages = 0;
		
		totalRecords = noticeMapper.searchTotalRecords(type, searchCondition, searchWord);
		totalPages = (int)Math.ceil((double)totalRecords / numberPerPage);  // 총페이지수
		
		PageBlock pageBlock = new PageBlock();
		pageBlock.setCurrentPage(currentPage);
		pageBlock.setNumberPerPage(numberPerPage);
		pageBlock.setNumberOfPageBlock(numberOfPageBlock);
		pageBlock.setTotalRecords(totalRecords);
		pageBlock.setTotalPages(totalPages);
		int start = (currentPage-1) / numberOfPageBlock * numberOfPageBlock + 1;
		pageBlock.setStart(start);
		int end = start + numberOfPageBlock -1;
		if(end > totalPages) end = totalPages;
		pageBlock.setEnd(end);
					
		if(start != 1) pageBlock.setPrev(true); //이전버튼
		if(end != totalPages) pageBlock.setNext(true); //다음버튼
		
		return pageBlock;
		
	}

}
