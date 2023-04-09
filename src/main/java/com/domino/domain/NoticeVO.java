package com.domino.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class NoticeVO {
	
	private int seq;
	private int notice_code;
	private String title;
	private Date notice_date;
	private int hits;
	private String content;
	private String type;
	private String emp_id;
	
}
