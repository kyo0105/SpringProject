package com.domino.service;

import org.springframework.stereotype.Service;

import com.domino.domain.EmpVO;
import com.domino.mapper.EmpMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmpServiceImpl implements EmpService{

	private final EmpMapper mapper;
	
	@Override
	public EmpVO login(String emp_id, String pw) {

			EmpVO vo = mapper.loginAction(emp_id);
			if (vo != null && !matchPassword(vo.getEmp_pw(), pw)) { return null; }
			return vo;
	}
	
	@Override
	public boolean matchPassword(String outPw, String inPw) {
	
		return outPw != null && outPw.equals(inPw);
	}

}
