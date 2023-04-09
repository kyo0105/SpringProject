package com.domino.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.domino.domain.AgreeVO;
import com.domino.domain.MemberVO;
import com.domino.domain.SnsVO;
import com.domino.mapper.EmpMapper;
import com.domino.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private final MemberMapper memberMapper;
	private final EmpMapper empMapper;
	
	@Override
	public Map<String, Object> login(String member_id, String pw) {
		
		Map<String, Object> member = new HashMap<String, Object>();
		
		MemberVO vo = memberMapper.loginAction(member_id);
		SnsVO snsChk = memberMapper.snsLoginChk(member_id);
		
		if (vo != null && !matchPassword(vo.getPw(), pw)) { 
			member.put("vo", null);
			member.put("snsChk", snsChk);
		} else {
			member.put("vo", vo);
			member.put("snsChk", snsChk);
		}
		
		return member;
	}
	
	@Override
	public boolean matchPassword(String outPw, String inPw) {
		
		return outPw != null && outPw.equals(inPw);
	}
	
	@Override
	public int memberCheck(String tel) {
		
		return memberMapper.phoneAuth(tel);
	}
	
	@Override
	public Map<String, Object> idCheck(String id) {
		
		Map<String, Object> data = new HashMap<String, Object>();
		int empIdChk = empMapper.empIdChk(id);
		int memberIdChk = memberMapper.memberIdChk(id);
			
		if (memberIdChk == 0 && empIdChk == 0) {
			data.put("status", "success");
			data.put("msg", id);
		} else if (memberIdChk == 1 || empIdChk == 1) {
			data.put("status", "fail");
		}
		return data;
	}
	
	@Override
	public Map<String, String> emailCheck(String email) {
		
		Map<String, String> data = new HashMap<String, String>();
		int emailChk = memberMapper.memberEmailChk(email);
			
		if (emailChk == 0) {
			data.put("status", "success");
		} else if (emailChk == 1) {
			data.put("status", "fail");
		}			
		return data;
	}
	
	@Override
	@Transactional
	public void memberInsert(MemberVO mvo, AgreeVO avo) {
		
		memberMapper.memberInsert(mvo);
		memberMapper.agreeInsert(avo);
	}

	@Override
	public Map<String, Object> snsCheck(String tel) {
		
		MemberVO memberChk = memberMapper.memberChk(tel);
		SnsVO snsChk = memberMapper.snsChk(tel);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		// 회원가입 X, sns연동 X
		if (memberChk == null && snsChk == null) {
			result.put("status", "회원가입");
			return result;
		// 회원가입 O, sns연동 X
		} else if (memberChk != null  && snsChk == null) {
			result.put("status", "연동");
			result.put("member", memberChk);
			return result;
		// 회원가입 O, sns연동 O (회원가입 X, sns연동 O 가능성 X)  	
		} else {
			result.put("status", snsChk.getSns());
			result.put("member", memberChk);
			result.put("sns_id", snsChk.getSns_id());
			return result;
		}
	}
	
	@Override
	public Map<String, Object> snsEmailCheck(String email) {
		
		MemberVO memberChk = memberMapper.mEmailChk(email);
		SnsVO snsChk = memberMapper.sEmailChk(email);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		// 회원가입 X, sns연동 X
		if (memberChk == null && snsChk == null) {
			result.put("status", "회원가입");
			return result;
		// 회원가입 O, sns연동 X
		} else if (memberChk != null  && snsChk == null) {
			result.put("status", "연동");
			result.put("member", memberChk);
			return result;
		// 회원가입 O, sns연동 O (회원가입 X, sns연동 O 가능성 X)  	
		} else {
			result.put("status", snsChk.getSns());
			result.put("member", memberChk);
			result.put("sns_id", snsChk.getSns_id());
			return result;
		}
	}

	@Transactional
	@Override
	public void snsMemberInsert(SnsVO svo, MemberVO mvo, AgreeVO avo) {
		
		String tempPw = "@" + svo.getSns() + tempPassword(10); 
		mvo.setPw(tempPw);
		
		memberMapper.memberInsert(mvo);
		memberMapper.agreeInsert(avo);
		memberMapper.snsInsert(svo);
	}

	@Override
	public String tempPassword(int leng) {

		int index = 0;
		char[] charSet = new char[] {
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
				'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
		};	//배열안의 문자 숫자는 원하는대로

		StringBuffer password = new StringBuffer();
		Random random = new Random();

		for (int i = 0; i < leng ; i++) {
			double rd = random.nextDouble();
			index = (int) (charSet.length * rd);
			
			password.append(charSet[index]);
			
			System.out.println("index::" + index + "	charSet::"+ charSet[index]);
		}
		
		return password.toString();
	}

	@Override
	public void snsConnection(SnsVO svo) {
		
		memberMapper.snsInsert(svo);
	}

}
