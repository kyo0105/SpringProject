package com.domino.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.domino.domain.AgreeVO;
import com.domino.domain.MemberVO;
import com.domino.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping(value = { "/member", "/auth" })
public class SignUpController {
	
	private final MemberService service;
	
	@GetMapping("/regStep1")
	public void regStep() { log.info("회원가입 페이지1"); }
	
	@PostMapping("/regStep2")
	public void regStep2() { log.info("회원가입 페이지2"); }
	
	@GetMapping("/phoneAuth")
	public void phoneAuth() { log.info("휴대전화 인증 페이지"); }
	
	@PostMapping("/phoneAuth")
	@ResponseBody
	public String phoneAuth(@RequestParam String tel) {
		
		log.info("휴대전화 인증");
		return service.memberCheck(tel) == 0 ? "success" : "fail"; 
	}
	
	@PostMapping("/idChkAjax")
	@ResponseBody
	public Map<String, Object> idChkAjax(@RequestParam String id) {
		
		log.info("아이디 중복 체크");
		return service.idCheck(id);
	}
	
	@PostMapping("/emailChkAjax")
	@ResponseBody
	public Map<String, String> emailChkAjax(@RequestParam String email) {
		
		log.info("이메일 중복 체크");
		return service.emailCheck(email);
	} 
	
	@PostMapping("/regStep2Proc")
	public void regStep2Proc(@ModelAttribute MemberVO mvo
							, @RequestParam String member_id
							, @RequestParam("ds_fl") int message
							, @RequestParam("dm_fl") int email
							, @RequestParam("o_dm_fl") int mail
							) {
		
		log.info("회원 가입");
		
		AgreeVO avo = new AgreeVO();
		avo.setMember_id(member_id);
		avo.setMessage(message);
		avo.setEmail(email);
		avo.setMail(mail);
		
		service.memberInsert(mvo, avo);
	}
	
}
