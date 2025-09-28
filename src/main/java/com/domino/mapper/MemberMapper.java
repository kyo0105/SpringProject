package com.domino.mapper;

import com.domino.domain.AgreeVO;
import com.domino.domain.MemberVO;
import com.domino.domain.SnsVO;

public interface MemberMapper {

	// 1. 회원 로그인
	MemberVO loginAction(String member_id);
	
	// 2. 번호 인증
	int phoneAuth(String tel);
	
	// 3. 회원 ID 중복 체크
	int memberIdChk(String member_id);
	
	// 4. 회원 Email 중복 체크
	int memberEmailChk(String email);

	// 5. 회원가입
	void memberInsert(MemberVO vo);
	
	// 6. 광고동의 
	void agreeInsert(AgreeVO VO);
	
	// 7. 회원 체크
	MemberVO memberChk(String tel);
	
	// 8.1 sns회원 체크(번호)
	SnsVO snsChk(String tel);	
	
	// 8.2 sns회원 체크(아이디)
	SnsVO snsLoginChk(String member_id);
	
	// 9. sns간편 회원가입
	void snsInsert(SnsVO vo);
	
	// 카카오 제약에 의한 전화번호 대신 이메일로 임시 체크
	MemberVO mEmailChk(String email);
	SnsVO sEmailChk(String email);	
	
}
