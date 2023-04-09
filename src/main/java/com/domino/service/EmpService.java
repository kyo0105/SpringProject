package com.domino.service;

import com.domino.domain.EmpVO;

public interface EmpService {
	
	EmpVO login(String empId, String pw);
	
	boolean matchPassword(String outPw, String inPw);
	
}
