package com.domino.mapper;

import com.domino.domain.EmpVO;

public interface EmpMapper {

	// 1. 관리자 로그인
	EmpVO loginAction(String emp_id);
	
	// 2. 관리자 ID 중복 체크
	int empIdChk(String emp_id);
}
