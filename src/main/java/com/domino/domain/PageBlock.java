package com.domino.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class PageBlock {
	
	private int currentPage;
	private int numberPerPage = 10;
	private int numberOfPageBlock = 10;
	private int totalRecords;
	private int totalPages;
	private int start, end;
	private boolean prev, next;
	
}
