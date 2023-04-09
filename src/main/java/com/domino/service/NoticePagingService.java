package com.domino.service;

import com.domino.domain.PageBlock;

public interface NoticePagingService {
	
	PageBlock paging(String type, int currentPage, int numberPerPage);
	
	PageBlock paging(String type, int currentPage, int numberPerPage, String searchCondition, String searchWord);

}
