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
public class MemberVO {
	
	private String member_id;		// 회원ID
	private String name;			// 이름
	private String pw;				// 비밀번호
	private int birth_type;			// 양력음력
	private Date birth;				// 생년월일
	private String tel;				// 휴대전화
	private String email;			// 이메일
	private String gender;			// 성별
	private int info_date;			// 개인정보유효기간
	private String mania_rank;		// 매니아등급
	private int sns_pan;			// SNS팬
	private Date join_date;			// 가입날짜
	
}
