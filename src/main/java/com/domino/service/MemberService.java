package com.domino.service;

import java.util.Map;

import com.domino.domain.AgreeVO;
import com.domino.domain.MemberVO;
import com.domino.domain.SnsVO;

public interface MemberService {
	
	Map<String, Object> login(String member_id, String pw);
	
	boolean matchPassword(String outPw, String inPw);
	
	int memberCheck(String tel);

	Map<String, Object> idCheck(String id);
	
	Map<String, String> emailCheck(String email);
	
	void memberInsert(MemberVO mvo, AgreeVO avo);
	
	Map<String, Object> snsCheck(String tel);
	
	// 카카오 제약에 의한 전화번호 대신 이메일로 임시 체크
	Map<String, Object> snsEmailCheck(String email);
	
	void snsMemberInsert(SnsVO svo, MemberVO mvo, AgreeVO avo);
	
	String tempPassword(int leng);
	
	void snsConnection(SnsVO svo);
}
